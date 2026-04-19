# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Claude Code plugin (skills-only, no build tooling) — a **runbook** estructurado que guía la producción de video con intención pedagógica (tutoriales técnicos, divulgación, formación corporativa, onboarding, contenido explicativo para público general). Package: `learning-video-runbook`. Content and skills are in **Spanish**; match that language when writing new skill/doc content.

There is no code to build, lint, or test. Changes are docs, skill markdown, and the two bash scripts in `scripts/`.

## Three-layer architecture

The toolkit uses a **3-layer knowledge architecture** that replaced the previous "skills load pillars directly" flow (rediseño 2026-04-18). Understand this before editing anything under `docs/`, `skills/`, or `scripts/`.

### Layer 1 — Pilares (source of truth)

`docs/pilares/{01-fundamentos-cognitivos, 02-tendencias-y-casos, 03-herramientas}.md` — split by rate of change. Every claim in the toolkit traces to a pillar section via a stable ID (e.g. `[P1-§2.3-#8]`, `[P2-ficha-fireship]`, `[P3-edicion-postproc]`). Never invent advice that bypasses the pillars.

- **Pilar 1 — fundamentos cognitivos (stable).** Peer-reviewed cognitive science: Mayer's principles, CLT, dual coding, retrieval/spacing, attention. Every claim cited or marked as heuristic. Changes 1–2× per year. **Wins all conflicts** unless the user explicitly overrides.
- **Pilar 2 — tendencias y casos (dynamic).** Current platform trends, patterns that work now, anti-patterns. Refreshed every 4–8 weeks via the `actualizar-tendencias` skill. Fichas de creators viven en `docs/casos-de-exito/{tutoriales-tecnicos, divulgacion-corta, onboarding-corporativo}.md`.
- **Pilar 3 — herramientas (dynamic).** Current tools, releases, deprecations. Refreshed every 2–4 weeks via `actualizar-herramientas`. Hardware-agnostic.

When pilar 2 or 3 contradicts pilar 1, **flag the conflict to the user explicitly**; do not silently apply the trend.

**Stable ID convention:**
- Pilar 1: `[P1-§X.Y]` for sections; `[P1-§2.3-#N]` for Mayer's 12 principles (inline).
- Pilar 2: `[P2-<slug>]` for sections (ej. `P2-idea-guion`, `P2-edicion-patrones`); `[P2-ficha-<name>]` for creator fichas.
- Pilar 3: `[P3-<etapa>]` and `[P3-<etapa>-<subsection>]`.

IDs are **stable contract**. If a section is renamed conceptually, the ID persists. Renames break nothing.

### Layer 2 — Briefs (precomputed synthesis)

`docs/briefs/{guion,previsualizacion,grabacion,edicion,publicacion}/NN-slug.md` — 34 archivos (8+3+7+8+8), 40-100 líneas cada uno. Cada brief es un **ensamblaje denso** de una decisión crítica: principio cognitivo + 2-3 casos concretos + anti-patrón + heurística numérica + conflictos conocidos + salida esperada. Todo citado con IDs estables al pilar.

**Contrato estricto de cada brief:**
- Frontmatter YAML: `decision`, `etapa`, `pregunta`, `fuentes` (lista de IDs), `admite-variantes` (bool), `sync: YYYY-MM-DD`, `version`.
- 6 bloques fijos en el cuerpo: `Principio aplicable` · `Casos` · `Anti-patrón` · `Heurística numérica` · `Conflictos conocidos` · `Salida esperada`.
- ≥5 citas inline a IDs. Cada ID citado inline debe estar declarado en `fuentes:`.
- 40-100 líneas.

Los briefs son la capa que los skills cargan en runtime. **Los skills NO leen pilares completos.**

### Layer 3 — Skills (consume briefs)

`skills/{guion,previsualizacion,grabacion,edicion,publicacion}-entrenamiento/` — una por etapa (5 etapas; previsualización es opcional, insertada entre guión y grabación). Cada skill:
1. Carga `docs/briefs/<mi-etapa>/*.md` (glob, ~7-8 archivos).
2. Recorre las decisiones en orden alfabético = orden de flujo.
3. Para cada decisión: lee el brief correspondiente, propone con cita trazable, flaggea conflictos del brief, espera aprobación.
4. Para decisiones con `admite-variantes: true`, aplica el **test de determinismo upstream** (≥2 casos del brief aplicables al contexto → ofrecer variantes; un solo caso domina → proponer una sola).
5. Produce un plan documentado con template al final.

**Cantidad de decisiones que admiten variantes por etapa (baseline establecido en dry-runs):**
- Guión 2/8, Previsualización 0/3 (deterministas por diseño), Edición 2/8, Grabación 3/7, Publicación 3/8. El resto son estándares, derivados, o principios deterministas.

**Prohibido en skills:** leer pilares completos en runtime (`Read docs/pilares/...`). Si hay una pregunta fuera del scope de los briefs, usar `Grep` dirigido por ID.

## Skills layout (`skills/`)

- `crear-entrenamiento` — orchestrator. Identifies stage, delegates to stage skill. Ofrece previsualización como puente opcional entre guión y grabación (recomendado, no bloqueante).
- `guion-entrenamiento` / `previsualizacion-entrenamiento` / `grabacion-entrenamiento` / `edicion-entrenamiento` / `publicacion-entrenamiento` — one per production stage. Consume briefs, no pilares. `previsualizacion-entrenamiento` produce un **Production Brief** que `grabacion-entrenamiento` lee como input opcional (read-only).
- `actualizar-tendencias` / `actualizar-herramientas` — mantenimiento de pilares 2 y 3. Tras aplicar cambios, cierran llamando a `scripts/verificar-briefs.sh` y sugieren `sincronizar-briefs` si hay stale.
- `sincronizar-briefs` — re-sincroniza briefs cuando los pilares cambiaron. Muestra diff, pregunta editar/sync-bump/diferir por cada brief stale.

## Scripts (`scripts/`)

- `verificar-briefs.sh` — detecta drift entre briefs y pilares por rango de sección. Reporta 3 contadores: stale, IDs no encontrados (typos), IDs inline no declarados (bugs de integridad). Exit 0 por defecto (reporte). Con `--strict`, exit 1 si alguno > 0 (para hooks / CI).
- `hook-verificar-pilares.sh` — hook `PostToolUse` (Edit/Write/MultiEdit): cuando tocás un archivo bajo `docs/pilares/`, corre `verificar-briefs.sh --strict` y avisa por stderr si hay drift. Registrado en `.claude/settings.json`. Nunca bloquea (exit 0 siempre).
- `regenerar-vistas.sh` — emite `docs/vistas-por-etapa/<etapa>.md` desde los frontmatters de los briefs. Vistas son artefactos derivados, **no se editan a mano.**

Todos zero-dependency salvo el hook, que requiere `jq` para parsear stdin JSON.

## Vistas por etapa (derivadas)

`docs/vistas-por-etapa/{guion,previsualizacion,grabacion,edicion,publicacion}.md` son **artefactos auto-generados** por `regenerar-vistas.sh` desde los frontmatters de los briefs. Conservan valor como índice humanamente legible pero no se editan a mano. Si necesitás cambiar una vista, editá el brief correspondiente y regenerá.

## Objective technical standards (enforced by edicion)

Do not weaken these without explicit pillar-backed reason:
- Loudness: −14 LUFS (YouTube), −16 LUFS (podcast), −23 LUFS (EBU R128 broadcast); true peak ≤ −1 dBTP.
- Contrast: WCAG 2.2 AA — 4.5:1 body, 3:1 large text.
- Subtitles: 15–20 CPS, ≤ 2 lines, 37–42 chars/line.

## Plugin packaging

`.claude-plugin/marketplace.json` and `.claude-plugin/plugin.json` define this as an installable Claude Code plugin. Bump `plugin.json:version` when shipping user-visible changes.

## Myths to refuse

Per pilar 1 §7, the repo explicitly rejects the "8-second attention span" claim and other pseudoscience. Don't reintroduce these in skill, brief, or doc edits — the pillar cites why they're wrong. Briefs están depurados.

## Working on this repo

- **Edit un brief:** cambio va en `docs/briefs/<etapa>/NN-*.md`. Si cambiás `fuentes:` o `pregunta:`, correr `bash scripts/regenerar-vistas.sh` después.
- **Edit un pilar:** el hook `PostToolUse` corre `verificar-briefs.sh --strict` automáticamente y avisa si hay drift. Si el aviso aparece, invocar `sincronizar-briefs`.
- **Nuevo creator para pilar 2:** ficha va en `docs/casos-de-exito/<nicho>.md` con header `## <Nombre> [P2-ficha-<slug>]`. Slug es contrato estable.
- **Nuevo brief:** usar plantilla de 6 bloques, ≥5 citas con IDs estables, frontmatter completo. Longitud 40-100 líneas. Agregar al `docs/briefs/<etapa>/` con prefijo NN-.
- **Plugin packaging:** los briefs y scripts van en el paquete distribuible. Las vistas se regeneran en el repo del usuario si corre el script (opcional).
