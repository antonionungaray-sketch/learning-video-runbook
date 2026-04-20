# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Claude Code plugin (skills-only, no build tooling) — a **guide** estructurada que acompaña la producción de **explainer videos con intención pedagógica**: tutoriales técnicos, divulgación científica, video-ensayo, documental narrativo, periodismo analítico visual, explainer comercial, how-to, onboarding, conferencia grabada, live stream educativo, podcast audiovisual, personal essay con intención de enseñar, y modalidades equivalentes. Package: `video-explainer-guide`.

El scope **no cubre** vlogs, reacciones, gameplay, entretenimiento puro, videoclips musicales ni contenido donde no hay un concepto o habilidad para transferir al espectador — la guía filtra explícitamente estos casos.

**Idioma:** content, briefs, skill prose, vistas y fichas de creators están en **español de México**. Match that language and variant when writing new content. Los slugs públicos del plugin (nombre del paquete, nombres de los skills, identificadores de archivos JSON) están en inglés técnico por convención del ecosistema de Claude Code. Los identificadores internos de briefs siguen en español (`decision: guion/04-retrieval`) porque son citas estables ya tejidas en pilares.

**Estado del toolkit:** en migración mayor (fase 0 cerrada, fases 1-6 en curso) — ver `ROADMAP.md` y el plan de reforma. El sesgo histórico hacia "entrenamiento/training" está siendo reemplazado por el modelo de 12 modalidades pedagógicas + 4 ejes estructurales. Hasta que las fases 1-5 cierren, algunos briefs y el flujo interno de los skills aún reflejan el esquema antiguo (foco en tutorial técnico + formación corporativa). Respeta el scope ampliado declarado arriba.

There is no code to build, lint, or test. Changes are docs, skill markdown, and the three bash scripts in `scripts/` (+ one HTML template).

## Three-layer architecture

The toolkit uses a **3-layer knowledge architecture** que reemplazó el flujo anterior "skills load pillars directly" (rediseño 2026-04-18). Entender esto antes de editar cualquier cosa bajo `docs/`, `skills/` o `scripts/`.

### Layer 1 — Pilares (source of truth)

`docs/pilares/{01-fundamentos-cognitivos, 02-tendencias-y-casos, 03-herramientas}.md` — split by rate of change. Every claim traces to a pillar section via a stable ID (e.g. `[P1-§2.3-#8]`, `[P2-ficha-fireship]`, `[P3-edicion-postproc]`). Never invent advice que bypasses the pillars.

- **Pilar 1 — fundamentos cognitivos y teoría del medio (stable).** Núcleo: peer-reviewed cognitive science (Mayer, Sweller, Paivio, Bjork, Roediger, Cepeda) — principles of multimedia learning, CLT, dual coding, retrieval/spacing, attention. Expansión en curso (fase 2) hacia teoría del cine documental (Nichols, Renov), ensayo fílmico (Rascaroli), retórica visual y periodismo de datos (Cairo, Tufte), active learning en conferencia (Freeman et al., Mazur). Cambia 1–2× por año. **Wins all conflicts** salvo override explícito del usuario.
- **Pilar 2 — tendencias y casos (dynamic).** Current platform trends, patterns que funcionan, anti-patterns. Refreshed every 4–8 weeks via the `actualizar-tendencias` skill. Fichas de creators viven en `docs/casos-de-exito/{tutoriales-tecnicos, divulgacion-corta, onboarding-corporativo, ...}.md`. Expansión en curso (fase 3) hacia documental narrativo, video-ensayo, periodismo visual, conferencia, live stream, podcast audiovisual, personal essay.
- **Pilar 3 — herramientas (dynamic).** Current tools, releases, deprecations. Refreshed every 2–4 weeks via `actualizar-herramientas`. Hardware-agnostic. Expansión en curso (fase 3) hacia live-stream setup, podcast multi-mic, workflow de documental, periodismo de datos.

Cuando pilar 2 o 3 contradice pilar 1, **flag the conflict to the user explicitly**; do not silently apply the trend.

**Stable ID convention:**
- Pilar 1: `[P1-§X.Y]` para secciones; `[P1-§2.3-#N]` para los principios de Mayer (inline).
- Pilar 2: `[P2-<slug>]` para secciones (ej. `P2-idea-guion`, `P2-edicion-patrones`); `[P2-ficha-<name>]` para fichas de creators.
- Pilar 3: `[P3-<etapa>]` y `[P3-<etapa>-<subsection>]`.

IDs are **stable contract**. Si una sección se renombra conceptualmente, el ID persiste. Renames break nothing.

### Layer 2 — Briefs (precomputed synthesis)

`docs/briefs/{concepto,guion,previsualizacion,grabacion,edicion,publicacion}/NN-slug.md` — 43 archivos (6+8+4+7+10+8), 40-100 líneas cada uno. Cada brief es un **ensamblaje denso** de una decisión crítica: principio cognitivo + 2-3 casos concretos + anti-patrón + heurística numérica + conflictos conocidos + salida esperada. Todo citado con IDs estables al pilar.

**Contrato estricto de cada brief (post fase 4):**
- Frontmatter YAML: `decision`, `etapa`, `pregunta`, `fuentes` (lista de IDs), `admite-variantes` (bool), **`varia-por-eje: [lista]`**, `sync: YYYY-MM-DD`, `version`.
- Cuerpo con bloques fijos: `Principio aplicable` · `Casos` · `Anti-patrón` · `Heurística numérica` · **`Ajuste por eje`** (solo si `varia-por-eje` no es `[]`) · `Conflictos conocidos` · `Salida esperada`.
- ≥5 citas inline a IDs. Cada ID citado inline debe estar declarado en `fuentes:`.
- 40-150 líneas (más en briefs priority con bloques Ajuste por eje detallados).

**`varia-por-eje:`** lista los 5 ejes estructurales (arco-dominante, objetivo-cognitivo, grado-edicion, grado-guion, rol-presentador) + `plataforma` cuando la decisión varía. `[]` = universal (loudness, contraste, CPS, codec/bitrate universales). El bloque `Ajuste por eje` tiene sub-bloques `### Por \`ejeX\`` con un bullet por cada valor posible del eje. Las skills de etapa leen la sección 0.5 del Concept Brief (modalidad + ejes + plataforma) para resolver qué sub-bloque aplicar en cada brief.

Arquitectura de modalidades y ejes formalmente en [`docs/arquitectura/modalidades-y-ejes.md`](docs/arquitectura/modalidades-y-ejes.md) — 12 presets nombrados + 5 ejes + atributo de plataforma.

Los briefs son la capa que los skills cargan en runtime. **Los skills NO leen pilares completos.**

### Layer 3 — Skills (consume briefs)

`skills/{concept,script,storyboard,record,edit,publish}-explainer/` — una por etapa (6 etapas; concepto y storyboard son opcionales — concepto va al inicio del flujo con default ON, storyboard va entre guión y grabación). Cada skill:
1. Carga `docs/briefs/<mi-etapa>/*.md` (glob, ~4-10 archivos).
2. Recorre las decisiones en orden alfabético = orden de flujo.
3. Para cada decisión: lee el brief correspondiente, propone con cita trazable, flaggea conflictos del brief, espera aprobación.
4. Para decisiones con `admite-variantes: true`, aplica el **test de determinismo upstream** (≥2 casos del brief aplicables al contexto → ofrecer variantes; un solo caso domina → proponer una sola).
5. Produce un plan documentado con template al final.

**Cantidad de decisiones que admiten variantes por etapa (recalibrado 2026-04-19 tras fase 4):**
- Concepto 2/6, Guión 5/8, Storyboard 0/4 (deterministas por diseño), Grabación 3/7, Edición 5/10, Publicación 4/8. El resto son estándares, derivados, o principios deterministas. Los briefs con `admite-variantes: true` suelen coincidir con los que declaran `varia-por-eje:` no vacío (la variación depende de la modalidad/ejes); los universales (`varia-por-eje: []`) son casi siempre `admite-variantes: false`.

**Prohibido en skills:** leer pilares completos en runtime (`Read docs/pilares/...`). Si hay una pregunta fuera del scope de los briefs, usar `Grep` dirigido por ID.

## Skills layout (`skills/`)

- `create-explainer` — orchestrator. Identifica etapa y delega al skill de etapa. Invoca `concept-explainer` por default al inicio del flujo (saltable explícitamente). Ofrece `storyboard-explainer` como puente opcional entre guión y grabación (recomendado, no bloqueante). También filtra fuera-de-scope (vlog, reacción, gameplay, entretenimiento, etc.).
- `concept-explainer` / `script-explainer` / `storyboard-explainer` / `record-explainer` / `edit-explainer` / `publish-explainer` — one per production stage. Consumen briefs, no pilares. `concept-explainer` produce un **Concept Brief** con `estado: draft | locked` + `locked-at: YYYY-MM-DD` que define audiencia, objetivo, promesa, ángulo, formato, plataforma, tono y restricciones; `script-explainer` lo lee read-only en su Paso 0, avisa si está en `draft` y lo trata como contrato cuando está `locked`. `storyboard-explainer` produce un **Production Brief** análogo; `record-explainer` y `edit-explainer` lo leen read-only con la misma disciplina. Cambios post-lock en cualquiera de los dos briefs requieren re-invocar la skill correspondiente.
- `actualizar-tendencias` / `actualizar-herramientas` — mantenimiento de pilares 2 y 3. Tras aplicar cambios, cierran llamando a `scripts/verificar-briefs.sh` y sugieren `sincronizar-briefs` si hay stale.
- `sincronizar-briefs` — re-sincroniza briefs cuando los pilares cambiaron. Muestra diff, pregunta editar/sync-bump/diferir por cada brief stale.

## Scripts (`scripts/`)

- `verificar-briefs.sh` — detecta drift entre briefs y pilares por rango de sección. Reporta 3 contadores: stale, IDs no encontrados (typos), IDs inline no declarados (bugs de integridad). Exit 0 por defecto (reporte). Con `--strict`, exit 1 si alguno > 0 (para hooks / CI).
- `hook-verificar-pilares.sh` — hook `PostToolUse` (Edit/Write/MultiEdit): cuando tocas un archivo bajo `docs/pilares/`, corre `verificar-briefs.sh --strict` y avisa por stderr si hay drift. Registrado en `.claude/settings.json`. Nunca bloquea (exit 0 siempre).
- `regenerar-vistas.sh` — emite `docs/vistas-por-etapa/<etapa>.md` desde los frontmatters de los briefs. Vistas son artefactos derivados, **no se editan a mano.**
- `storyboard-draft.template.html` — template HTML autocontenido (vanilla JS + rough.js embebido) que `storyboard-explainer` copia al directorio del usuario e hidrata con los datos del storyboard. Tiene vista Cómic (viñetas 16:9 sketchy) y vista Tabla (formulario por bloque); el data model incluye bloques con encuadre WS/MS/CU/ECU, variantes A/B, y **overlays auxiliares** (intro/outro, lower-third, idea-bulb, callout, separador, highlight-icono) dibujados sobre cada viñeta + chips debajo. El usuario itera visualmente, exporta YAML (con overlays serializados) y pega de vuelta al chat. UI = view, markdown = model; el HTML se regenera cada vez y nunca se commitea.

Zero-dependency. El hook parsea el stdin JSON con `python3` (preferido), con fallback a `jq` o a un parser grep/sed si ninguno está disponible.

## Vistas por etapa (derivadas)

`docs/vistas-por-etapa/{concepto,guion,previsualizacion,grabacion,edicion,publicacion}.md` son **artefactos auto-generados** por `regenerar-vistas.sh` desde los frontmatters de los briefs. Conservan valor como índice humanamente legible pero no se editan a mano. Si necesitas cambiar una vista, edita el brief correspondiente y regenera.

Nota: los slugs de los briefs y de las vistas siguen en español (`concepto/01-audiencia.md`, `vistas-por-etapa/concepto.md`) por contrato de ID estable con los pilares. El rebrand a inglés solo aplicó a los slugs del paquete y de las skills.

## Objective technical standards (enforced by edit-explainer)

No weaken these sin explicit pillar-backed reason:
- Loudness: −14 LUFS (YouTube), −16 LUFS (podcast), −23 LUFS (EBU R128 broadcast); true peak ≤ −1 dBTP.
- Contrast: WCAG 2.2 AA — 4.5:1 body, 3:1 large text.
- Subtitles: 15–20 CPS, ≤ 2 lines, 37–42 chars/line.

## Plugin packaging

`.claude-plugin/marketplace.json` and `.claude-plugin/plugin.json` definen esto como un installable Claude Code plugin. Bump `plugin.json:version` cuando shipping user-visible changes. La versión 1.0.0 marca el cierre de la fase 0 del rebrand (training-video-toolkit → video-explainer-guide).

## Myths to refuse

Per pilar 1, el repo explicitly rejects el claim de "8-second attention span" y otras pseudociencias. Don't reintroduce these en skill, brief o doc edits — el pilar cita por qué están mal. Briefs están depurados.

## Scope filter (qué NO hace este toolkit)

Un vlog, una reacción, un gameplay sin análisis, un videoclip musical, un sketch cómico, un ASMR, un trailer o un stream conversacional abierto **no** se beneficia de los principios de este toolkit — al contrario, los principios lo contaminan. Si un usuario invoca el toolkit para uno de estos casos, el orquestador `create-explainer` lo identifica y sugiere no usarlo. No forzar un "Concept Brief" con objetivo de aprendizaje inventado cuando el proyecto del usuario no tiene intención pedagógica.

## Working on this repo

- **Edit un brief:** cambio va en `docs/briefs/<etapa>/NN-*.md`. Si cambias `fuentes:` o `pregunta:`, correr `bash scripts/regenerar-vistas.sh` después.
- **Edit un pilar:** el hook `PostToolUse` corre `verificar-briefs.sh --strict` automáticamente y avisa si hay drift. Si el aviso aparece, invocar `sincronizar-briefs`.
- **Nuevo creator para pilar 2:** ficha va en `docs/casos-de-exito/<nicho>.md` con header `## <Nombre> [P2-ficha-<slug>]`. Slug es contrato estable.
- **Nuevo brief:** usar plantilla de 6 bloques (+ "Ajuste por eje" cuando fase 4 aterrice), ≥5 citas con IDs estables, frontmatter completo. Longitud 40-100 líneas. Agregar al `docs/briefs/<etapa>/` con prefijo NN-.
- **Plugin packaging:** los briefs y scripts van en el paquete distribuible. Las vistas se regeneran en el repo del usuario si corre el script (opcional).
- **Spanish variant:** español de México (no voseo rioplatense). Preferir `tú / puedes / tienes / quieres / aquí`.
