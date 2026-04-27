# Changelog

Todas las versiones relevantes de este proyecto se registran aquí. Formato basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.1.0/); versionado siguiendo [SemVer](https://semver.org/lang/es/).

## [1.4.0] — 2026-04-26

**Ampliación del toolkit a material didáctico no-video.** El plugin ahora produce, además de explainer videos, material didáctico estático que aprovecha los pilares 1 y 2: láminas didácticas secuenciales (estilo el set "El origen del yoga"), slides para presentar en vivo (formato Marp), y long-form escrito con visualizaciones embebidas. Disparador: Antonio generó un set de 9 láminas sobre el origen del yoga con un prompt curado a mano y el resultado fue muy efectivo; esta versión sistematiza ese trabajo.

### Añadido

- **Skill `material-explainer`** — produce material didáctico no-video desde un mismo Didactic Brief. Standalone (no invoca `concept-explainer`); tiene su propio paso 0 ligero (4 preguntas: concepto + audiencia + objetivo cognitivo + restricciones). Si encuentra un Concept Brief de video preexistente, ofrece reutilizar audiencia/objetivo/restricciones. Gate de lock entre paso 1 (generar Brief) y paso 2 (materializar). La generación de imágenes se delega a herramientas externas (Claude artifact, GPT image, Midjourney) — la skill produce los prompts.
- **Etapa nueva `docs/briefs/material/`** con 7 briefs precomputados: 01-secuenciacion-conceptual (orden de conceptos), 02-densidad-y-bloque (cuánta info por bloque), 03-soporte-visual (taxonomía mapa/diagrama-causal/comparativo/timeline/etc.), 04-retrieval-y-consolidacion (cajas concepto-clave + glosario "para estudiar"), 05-estilo-visual-coherencia (5 presets nombrados), 06-adaptacion-formato (ajuste por lámina/slide/long-form), 07-prompts-imagen-IA (anatomía de prompt para set coherente).
- **5 presets de estilo visual** definidos en brief 05: `historico-grabado` (paleta sepia + grabado + libro de historia), `tecnico-flat` (sans-serif moderno + ilustración vectorial flat), `cientifico-informativo` (Tufte minimalista + Nature vibe), `narrativo-comic` (viñetas con personajes), `editorial-periodico` (serif editorial + NYT/Atlantic vibe). Cada preset es un meta-prompt verbatim que se inyecta a cada output del paso 2 — ese verbatim es lo que da consistencia visual entre piezas del set.
- **Vista `docs/vistas-por-etapa/material.md`** auto-generada por `regenerar-vistas.sh` desde los frontmatters de los 7 briefs nuevos.

### Cambiado

- **`create-explainer`** — agrega bifurcación inicial "video o material estático" antes de identificar etapa de video. Si material, delega a `material-explainer`. El filtro de scope (intención pedagógica) se aplica a ambos flujos. Lista de fuera-de-scope ampliada con memes, posters decorativos sin contenido secuencial y anuncios puros sin componente explicativo.
- **`scripts/regenerar-vistas.sh`** — agrega `material` al array `ETAPAS`. Cambio de una línea.
- **`CLAUDE.md`** — sección "Skills layout" documenta `material-explainer` y la bifurcación del orquestador. Sección "Layer 2 — Briefs" actualiza el conteo (43 → 50 briefs, agrega 7 de material/) y vistas por etapa incluye material.

### Notas técnicas

- **`scripts/verificar-briefs.sh` no requirió cambios** — escanea recursivamente `docs/briefs/**/*.md` y reconoce la nueva carpeta automáticamente.
- **Pseudo-eje `formato`** en briefs 02/04/06 con valores `lamina | slide | long-form` — ad-hoc para esta etapa, no formalizado en `docs/arquitectura/modalidades-y-ejes.md`. Follow-up futuro: si crece su uso, formalizar como atributo separado (estilo `plataforma`) o como eje pleno.
- **`material-explainer` no invoca `concept-explainer`** — diseño consciente para mantener el flujo de material limpio sin forzar al usuario por el paso 0.5 de modalidad/ejes/plataforma del flujo de video.
- **Limpieza colateral previa al release**: 8 briefs stale pre-existentes (por edits a pilares 2 y 3 del 2026-04-23 sin sincronizar) resueltos vía sync-bump tras verificar que ninguno requería edición sustantiva del contenido.

### Verificación

- `bash scripts/verificar-briefs.sh --strict` cierra exit 0 (0 stale, 0 missing, 0 inline missing) tras los 7 briefs nuevos.
- `bash scripts/regenerar-vistas.sh` regenera las 7 vistas (incluye `material.md`) sin errores.
- 7 briefs con frontmatter válido, citas inline declaradas en `fuentes:`, longitud entre 69-116 líneas.
- Pendiente (Fase E del plan): smoke tests humano-en-loop con casos yoga (calibrador), OAuth (técnico) y Coriolis (científico).

## [1.3.3] — 2026-04-23

**Follow-up del cleanup de rioplatense de v1.3.1.** El barrido original dejó residuos que el grep de entonces no capturó: `acá` (patrón más frecuente, 14 ocurrencias), y pocas ocurrencias de `Sos`/`vos`/`imaginá`/`Mirá`/`querés`/`dale`/`buscá`/`Revisá` en archivos que aquella pasada no cubrió (template HTML de storyboard, planes/specs de superpowers, briefs y skills adicionales).

### Fixed

- `acá` → `aquí` (14 ocurrencias): briefs `concepto/01-audiencia`, `concepto/04-formato-y-duracion`, `concepto/05-plataforma-y-distribucion`, `concepto/06-tono-y-restricciones`, `edicion/09-transiciones`; skills `concept-explainer`, `create-explainer` (×3), `edit-explainer`, `sync-briefs`, `update-tools` (×2), `update-trends`; `docs/arquitectura/dry-run-fase-6.md`.
- `Sos` → `Eres` (3): `skills/concept-explainer/SKILL.md`, plan piloto fase A (`docs/superpowers/plans/2026-04-18-fase-a-piloto-guion.md`), spec capa de briefs (`docs/superpowers/specs/2026-04-18-capa-de-briefs-design.md`).
- `vos` removido del enum de persona gramatical (×2): `skills/concept-explainer/SKILL.md` y brief `concepto/06-tono-y-restricciones`. Enum canónico final: `[tú | usted | vosotros | ustedes | nosotros]`.
- `imaginá` → `imagina` (2): brief `guion/07-voz-registro`, plan piloto fase A.
- `Mirá` → `Observa` / `Atención` (2): plan piloto fase A (`Mirá lo que podemos hacer…` → `Observa lo que podemos hacer…`), brief `edicion/02-senalizacion` (callout `"¡Mirá!"` → `"¡Atención!"`).
- `querés` → `quieres` (1): `dry-run-fase-6.md`.
- `buscá el cursor` → `busca el cursor` (1): brief `edicion/02-senalizacion`.
- `dale a exportar` → `haz clic en Exportar` (1): brief `previsualizacion/03-shotlist-demos`.
- `dale like` → `deja like` (1): `docs/casos-de-exito/tutoriales-tecnicos.md`.
- `Revisá` → `Revisa` (1): hint de `scripts/storyboard-draft.template.html`.

### Technical notes

- Verificación post-cleanup: `grep -riEn '\b(acá|vos|sos|querés|tenés|mirá|imaginá|revisá|buscá|dale)\b' docs/ skills/ scripts/ --include='*.md' --include='*.html'` devuelve 0 matches (excluyendo `docs/vistas-por-etapa/` que son artefactos auto-generados sin contenido propio).
- Cero cambios de lógica, frontmatter o IDs estables. Solo texto en prosa y un enum ampliado. `verificar-briefs.sh --strict` no se ejecutó aquí porque los cambios no tocan citas; el único stale preexistente (`concepto/04-formato-y-duracion` vs `P2-meta-transversales` desde 2026-04-20) permanece, pendiente de `sync-briefs`.

## [1.3.2] — 2026-04-23

**Enriquecimiento de Pilar 3 (`auto-editor`, refresh HyperFrames) y apertura de Pilar 2 al patrón emergente de pipelines agente-orquestados.** Evaluación de dos herramientas mostradas en un demo público del canal Atomic Treehouse (Hyperframes + video-use) contra la línea editorial "open-source primero con licencia declarada". HyperFrames ya estaba en Pilar 3 pero con status obsoleto; video-use no pasa el filtro (sin licencia declarada al 2026-04-23). Se documenta el patrón que video-use representa y se incorporan alternativas maduras con licencia limpia.

### Added

- **`auto-editor` en Pilar 3 [P3-edicion-postproc]** — Unlicense, v30.1.4, 4.2k★, 137 releases. Recorta silencios y pausas muertas por threshold, dB o motion. Exporta timelines XML a Premiere, DaVinci, Final Cut Pro, ShotCut y Kdenlive — encaja con la familia de editores ya listada. No quita filler words (queda explícito como límite). Metadata estructurada con `equivalentes: [ffmpeg]`.
- **Nueva subsección [P2-edicion-pipelines-ia] en Pilar 2** — documenta el patrón emergente 2026-04 de pipelines IA-forward agente-orquestados (raw → auto-trim → transcribe → overlay → render). Lista `browser-use/video-use` como caso con caveat bloqueante ("no usar, no recomendar" hasta que upstream declare licencia) y dos alternativas MIT en observación: `DayadaUP/claude-code-auto-video-edit` y `6missedcalls/video-editing-skill`, ambas candidatas a Pilar 3 tras smoke test humano-en-loop.
- **Línea nueva en "Cuándo elegir qué" de §Edición y post** — auto-editor como primer corte de silencios antes de entrar al editor; el juicio editorial fino de pacing variable por densidad cognitiva [P1-§4.4] sigue siendo humano.
- **Referencia cruzada en brief `edicion/10-overlays-auxiliares`** — apunta a [P2-edicion-pipelines-ia] para pipelines completos orquestados por agente; sync bumpeado a 2026-04-23, version 4.

### Changed

- **Entry de HyperFrames en Pilar 3 refrescada** — status de `nuevo/cambia rápido (2026-04-18)` → `beta estable (v0.4.15, 9.8k★, activo; 2026-04-23)`. Comando de instalación explícito (`npx skills add heygen-com/hyperframes`), requisito Node ≥22 en `hardware-min`, aclaración de que el timeline editor visual mostrado en demos públicas es el dashboard hosted de `hyperframes.heygen.com` y no parte del repo open-source (el repo es CLI-only).
- Tabla de Frescura de Pilar 3: añadida revisión 2026-04-23 (auto-editor + refresh HyperFrames); §Edición y post marca 2026-04-23 como última revisión.

### Technical notes

- No se tocaron IDs estables ni contratos de metadata existentes. El nuevo ID `[P2-edicion-pipelines-ia]` queda declarado en Pilar 2 §Edición y post; sólo el brief `edicion/10-overlays-auxiliares` lo cita inline (declarado en su `fuentes:` frontmatter).
- `verificar-briefs.sh --strict` debe pasar limpio (los cambios son aditivos, sin rompimiento de IDs). `validar-metadata-pilar3.sh` debe pasar (los dos bloques `<!-- meta -->` tocados — HyperFrames actualizada con `hardware-min` nuevo, auto-editor agregada — siguen el contrato canónico de 5 campos).
- Bump de versión 1.3.1 → 1.3.2. Enriquecimiento de contenido, no nueva funcionalidad ni ruptura.
- El plan de evaluación que dio lugar a estos cambios vive en `~/.claude/plans/revisa-las-siguientes-ligas-atomic-treehouse.md`.

## [1.3.1] — 2026-04-20

**Unificación de variante lingüística a español neutro (México).** El CLAUDE.md del repo y la memoria global marcaban español de México como variante oficial, pero quedaban residuos de rioplatense que se colaban por default al generar contenido. Esta versión los erradica del workspace.

### Fixed

- Reemplazado `acá` → `aquí` en 19 ocurrencias (6 skills, 7 briefs de concepto/edición, `dry-run-fase-6.md`, este CHANGELOG).
- Erradicado voseo activo: `Sos` → `Eres` (prompts de dispatch de variantes en `concept-explainer`, spec de capa de briefs, plan piloto), `querés` → `quieres` (dry-run), `Mirá` → `Observa` (plan piloto), `imaginá` → `imagina` (brief `guion/07-voz-registro`, plan piloto), `Revisá` → `Revisa` (hint del template HTML de storyboard).
- Reescritos ejemplos entre comillas que citaban rioplatense incluso como antipatrón (el usuario fue explícito: citar rioplatense contamina igual): `"Abre el menú y dale a exportar"` → `"Abre el menú y haz clic en Exportar"`; `callouts "¡Mirá!"` → `callouts "¡Atención!"`; `"buscá el cursor"` → `"busca el cursor"`; `"suscríbete / dale like"` → `"suscríbete y deja like"`.
- Removido `vos` de los enums de persona gramatical en `concept-explainer/SKILL.md`, `briefs/concepto/06-tono-y-restricciones`, `briefs/guion/07-voz-registro` y plan piloto. El enum queda `[tú | usted | vosotros | ustedes | nosotros]`.

### Technical notes

- Verificación: grep completo de patrones rioplatenses (voseo + léxico) sobre todo el workspace devuelve 0 matches. `verificar-briefs.sh --strict` devuelve 0 stale / 0 IDs huérfanos / 0 inline no declarados — los frontmatters y IDs estables no se tocaron.

## [1.3.0] — 2026-04-20

**Fix de path resolution para plugin instalado vía marketplace.** Antes, todas las skills fallaban al invocarse desde el cwd del usuario (su proyecto de video), porque referenciaban archivos empaquetados con rutas relativas. Claude Code no las resolvía contra la raíz del plugin instalado.

### Fixed

- Las 11 skills referencian contenido empaquetado con `${CLAUDE_PLUGIN_ROOT}` en vez de paths relativos al cwd del usuario. Aplica a lecturas de `docs/pilares/`, `docs/briefs/`, `docs/arquitectura/modalidades-y-ejes.md`, `docs/casos-de-exito/` y a invocaciones de scripts bajo `scripts/`. Afectaba `update-tools`, `update-trends`, `sync-briefs` y todas las skills de etapa (`concept-explainer`, `script-explainer`, `storyboard-explainer`, `record-explainer`, `edit-explainer`, `publish-explainer`, `create-explainer`, `setup-environment`).
- Los scripts bash (`verificar-briefs.sh`, `regenerar-vistas.sh`, `validar-metadata-pilar3.sh`) derivan su ubicación vía el helper `scripts/lib/resolve-plugin-root.sh`, que prefiere `$CLAUDE_PLUGIN_ROOT` y cae a `${BASH_SOURCE[0]}` + git toplevel como fallback. Antes usaban `git rev-parse --show-toplevel` a secas, que en una instalación de marketplace devuelve el repo del usuario o nada.
- `hook-verificar-pilares.sh` invoca `verificar-briefs.sh` por path absoluto para no depender del cwd.

### Added

- **`scripts/lib/resolve-plugin-root.sh`** — helper sourceable que resuelve `$PLUGIN_ROOT` y hace `cd` a la raíz del plugin. Reusado por los tres scripts de mantenimiento.
- **Gate de modo instalado** en `update-tools`, `update-trends` y `sync-briefs` — detectan si el plugin corre como instalación de marketplace (sin `.git/` en `$CLAUDE_PLUGIN_ROOT`) y, en ese caso, cierran con mensaje amable sugiriendo `/create-explainer` o abrir un issue. Previene que un usuario edite por error el directorio de instalación (cuyos cambios se perderían al actualizar el plugin).

### Technical notes

- Bump de versión 1.2.0 → 1.3.0. Fix crítico: sin esto, el plugin era inusable para cualquier usuario que lo instalara vía marketplace en otra máquina (el log original del bug mostraba Glob fallando en `docs/pilares/03-herramientas.md` con cwd en el proyecto del usuario).
- `${CLAUDE_PLUGIN_ROOT}` es la variable oficial documentada por Claude Code para plugins — ver [plugins-reference#environment-variables](https://code.claude.com/docs/en/plugins-reference#environment-variables).

## [1.2.0] — 2026-04-20

**Fase 7 — Portabilidad y perfil de entorno.** El plugin ahora es portable entre OS vía perfil de entorno persistente que los skills de etapa leen para filtrar recomendaciones de herramientas.

### Added

- **Skill `setup-environment`** — construye y actualiza el perfil de entorno del usuario (OS, preferencias, hardware, restricciones, herramientas ya elegidas) en `~/.claude/video-explainer/profile.md`. Re-invocable. Soporta override por proyecto (`./video-explainer-profile.md`).
- **Paso 0.5 en 4 skills de etapa** (`concept-explainer`, `record-explainer`, `edit-explainer`, `publish-explainer`) — lectura del perfil de entorno al inicio de cada skill para filtrar recomendaciones de herramientas según OS, licencia y hardware; fallback a WebSearch si la herramienta óptima no está en Pilar 3.
- **Metadata estructurada en Pilar 3** — cada bullet de herramienta en `docs/pilares/03-herramientas.md` tiene un bloque `<!-- meta: <slug> -->` con campos `plataformas`, `licencia`, `modo`, `hardware-min?`, `equivalentes`.
- **Script `scripts/validar-metadata-pilar3.sh`** — valida integridad de los bloques `<!-- meta -->` en Pilar 3 (campos obligatorios, valores permitidos, duplicados).
- **`update-tools` acepta payload estructurado** desde el fallback externo de los skills de etapa para incorporar herramientas nuevas al catálogo con ficha completa.

### Changed

- Skills de mantenimiento renombrados a inglés (ruptura menor): `actualizar-herramientas` → `update-tools`, `actualizar-tendencias` → `update-trends`, `sincronizar-briefs` → `sync-briefs`. Los nombres anteriores no son compatibles.
- `create-explainer` sugiere invocar `setup-environment` en la primera instalación (si no existe el perfil).
- `CLAUDE.md` documenta la arquitectura del perfil de entorno y el nuevo skill.
- `ROADMAP.md` registra la fase 7 como cerrada.

### Technical notes

- Bump de versión 1.1.0 → 1.2.0.

## [1.1.0] — 2026-04-19 (sin entrada de changelog separada)

Ver historial de commits. Fases 1-6 cerradas; bump desde 1.0.0 registrado en la fase 6.

## [1.0.0] — 2026-04-19

**Rebrand mayor — ruptura de compatibilidad.** El paquete cambia de nombre y expande su alcance declarado al espectro completo de video con intención pedagógica. Cerramos la **fase 0 del plan de reforma** (`/home/antonio/.claude/plans/desafortunadamente-este-proyecto-est-bubbly-charm.md`). Las fases 1-6 quedan pendientes.

### Changed (ruptura)

- **Nombre del paquete:** `learning-video-runbook` → `video-explainer-guide`.
- **Nombre del marketplace:** `learning-video-runbook-marketplace` → `video-explainer-guide-marketplace`.
- **Nombres de skills (7):**
  - `crear-entrenamiento` → `create-explainer`
  - `concepto-entrenamiento` → `concept-explainer`
  - `guion-entrenamiento` → `script-explainer`
  - `previsualizacion-entrenamiento` → `storyboard-explainer`
  - `grabacion-entrenamiento` → `record-explainer`
  - `edicion-entrenamiento` → `edit-explainer`
  - `publicacion-entrenamiento` → `publish-explainer`

  No se mantiene compatibilidad con los nombres viejos. Cualquier documentación, alias o script externo que invoque los slash commands anteriores debe actualizarse.

- **Scope declarado del toolkit:** antes se posicionaba como soporte principalmente para tutoriales técnicos y formación corporativa. Ahora el alcance declarado cubre el espectro completo de explainer videos con intención pedagógica: tutoriales técnicos, divulgación científica, video-ensayo, documental narrativo, periodismo analítico visual, explainer comercial, how-to, onboarding, conferencia grabada, live stream educativo, podcast audiovisual, personal essay pedagógico. Nota: la calibración interna de los briefs y el contenido del pilar 1 todavía reflejan el foco instruccional original — esa expansión llega con las fases 2-4 de la reforma.
- **Filtro de scope explícito:** el orquestador `create-explainer` ahora identifica y filtra casos fuera-de-scope (vlogs, reacciones, gameplay, entretenimiento puro, videoclips, etc.) en lugar de aceptarlos silenciosamente. Los principios del toolkit contaminan esos géneros; el filtro preventivo evita que un creador invoque el flujo completo para un caso donde no aplica.
- **Título humano de las skills:** ahora en español de México explícitamente (antes tenía algunos deslices de voseo). Documentado en `CLAUDE.md`.
- **Idioma declarado del proyecto:** slugs públicos (paquete, skills) en inglés técnico por convención del ecosistema de Claude Code; contenido (pilares, briefs, prose de SKILL.md, vistas, fichas, READMEs) en español de México estricto (no voseo rioplatense). Los identificadores de briefs permanecen en español (`decision: guion/04-retrieval`) por contrato de ID estable con los pilares.

### Added

- `CHANGELOG.md` (este archivo).
- `scripts/storyboard-draft.template.html`: título actualizado al nuevo nombre del paquete.
- `docs/onboarding/guia-rapida.md` y `docs/onboarding/guia-rapida.html`: guía de usuario reescrita con las 6 etapas (antes documentaba 5 — faltaba `concept-explainer`) y con el scope ampliado. El SVG del pipeline en el HTML ahora muestra 6 cajas (se agregó el ícono de bombilla para la etapa de concepto).

### Documentation

- `README.md`: reescritura completa. Nuevo posicionamiento, listado explícito de modalidades cubiertas y listado de modalidades fuera-de-scope.
- `CLAUDE.md`: reescritura. Incorpora el nuevo scope, el estado de migración (fase 0 cerrada, fases 1-6 pendientes), el filtro de scope y regla explícita de español de México para evitar contaminación futura de voseo.
- `ROADMAP.md`: agregado ROADMAP v2 al inicio (resumen de las 7 fases de la reforma con estado y decisiones cerradas). El v1 histórico se conserva como referencia, con referencias a skills actualizadas.

### Technical notes

- Los 7 renombres de directorio se hicieron con `git mv` para preservar el historial de commits.
- `scripts/verificar-briefs.sh --strict` sigue pasando en exit 0 después de la reforma (cero drift, cero IDs huérfanos, cero IDs no declarados).
- `scripts/regenerar-vistas.sh` ejecutado; vistas auto-generadas en `docs/vistas-por-etapa/*.md` refrescadas.
- Bump de versión 0.4.0 → 1.0.0.

### Pendiente para versiones futuras (fases 1-6 del plan de reforma)

- **Fase 1** — Diseño formal del modelo de 4 ejes estructurales + 12 presets de modalidad (`docs/arquitectura/modalidades-y-ejes.md`).
- **Fase 2** — Expansión del pilar 1: integrar teoría del cine documental, ensayo fílmico, retórica visual y active learning junto al núcleo cognitivo actual.
- **Fase 3** — Expansión de pilares 2 y 3: nuevas fichas de creators y herramientas para las modalidades ampliadas.
- **Fase 4** — Rediseño de los 43 briefs con bloques de "Ajuste por eje" + marcado de universales.
- **Fase 5** — Adaptación de los 7 skills al Concept Brief con campo `modalidad` + ejes.
- **Fase 6** — Verificación end-to-end con 4 modalidades representativas, regeneración de vistas, cierre.

## [0.4.0] y anteriores

Ver historial de commits. Versiones previas correspondían al paquete `learning-video-runbook` (antes `training-video-toolkit`), orientado primariamente a tutoriales técnicos y formación corporativa.
