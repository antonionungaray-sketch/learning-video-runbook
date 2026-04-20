# Changelog

Todas las versiones relevantes de este proyecto se registran acá. Formato basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.1.0/); versionado siguiendo [SemVer](https://semver.org/lang/es/).

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
