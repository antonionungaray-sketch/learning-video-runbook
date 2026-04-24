# Dry-run end-to-end — Fase 6

Simulación del flujo completo para 4 modalidades contrastantes + 1 caso fuera de scope. Documenta qué preset, qué ejes, qué plataforma, y qué sub-bloque de "Ajuste por eje" aplica cada skill en briefs clave. Objetivo: evidencia de que el toolkit sirve al espectro ampliado sin contaminar.

Fecha: 2026-04-19 · Cierre reforma: fases 0-5 ejecutadas; esta fase verifica cohesión.

---

## Caso A — Tutorial técnico de ComfyUI

**Input del usuario:** "Quiero hacer un tutorial de 12 min sobre cómo armar un workflow de upscaling con ComfyUI en YouTube."

### `create-explainer` (orquestador)
- Etapa: proyecto nuevo → default ON → `concept-explainer`.
- Scope OK (intención pedagógica: transferir habilidad).

### `concept-explainer` — sección 0.5
- Preset: **`instruccional`** (familia Instruccional).
- Ejes derivados por default:
  - `arco-dominante: performativo`
  - `objetivo-cognitivo: adquirir-habilidad`
  - `grado-edicion: heavy`
  - `grado-guion: guionado`
  - `rol-presentador: demostrador`
- Plataforma: **`long-form-horizontal`**.
- Divergencias: ninguna.

### Routing de briefs clave

| Brief | `varia-por-eje` | Sub-bloque aplicable | Qué prescribe |
|---|---|---|---|
| `guion/05-retrieval` | `[objetivo-cognitivo, grado-guion, arco-dominante]` | objetivo: adquirir-habilidad · guion: guionado · arco: performativo | Retrieval explícito tras cada bloque de código (preguntas tipo "¿qué nodo conectarías aquí?"), pausas de auto-explicación. |
| `guion/08-cta` | `[objetivo-cognitivo, rol-presentador]` | adquirir-habilidad · demostrador | CTA de **aplicación inmediata** ("abre ComfyUI y replica el workflow"). |
| `grabacion/02-video-encuadre` | `[rol-presentador, plataforma]` | demostrador · long-form-horizontal | Screen capture dominante + face-cam PiP pequeña. |
| `edicion/01-pacing` | `[arco-dominante, grado-edicion]` | performativo · heavy | Cortes 8-12/min, zooms a UI, podar dead-air. |
| `publicacion/08-metricas-aprendizaje` | `[objetivo-cognitivo]` | adquirir-habilidad | Post-test aplica: comentarios con output, stars de repo, quiz opcional. |

**Resultado:** contaminación cero, toolkit calibrado. Match exacto con el uso histórico.

---

## Caso B — Documental narrativo sobre café colombiano

**Input:** "Documental de 22 min sobre la historia del café colombiano, con narrador en off, entrevistas a productores, archivo."

### `concept-explainer` — sección 0.5
- Preset: **`documental-narrativo-pedagogico`**.
- Ejes:
  - `arco-dominante: narrativo`
  - `objetivo-cognitivo: corregir-intuicion` (el espectador cree que sabe qué es café de especialidad, el doc reordena)
  - `grado-edicion: heavy`
  - `grado-guion: guionado`
  - `rol-presentador: narrador-omnisciente`
- Plataforma: `long-form-horizontal`.

### Routing

| Brief | Sub-bloque | Qué prescribe |
|---|---|---|
| `guion/02-estructura` | narrativo | 3 actos + giros; no problem→solution instruccional. |
| `guion/05-retrieval` | corregir-intuicion + guionado + narrativo | **Consolidación retórica, NO retrieval formal.** Momentos de re-encuadre del contraste inicial (cita [P1-§10.4]). |
| `guion/08-cta` | corregir-intuicion + narrador-omnisciente | CTA reflexivo / reverberante, no "aplica ahora". |
| `grabacion/01-audio` | narrador-omnisciente | Voz en off grabada en cabina, no set. |
| `grabacion/02-video-encuadre` | narrador-omnisciente | **Sin face-cam**. B-roll + archivo + entrevistas. |
| `edicion/06-b-roll` | narrativo | B-roll narrativo (atmósfera, transición de tiempo), no ilustrativo-instruccional. |
| `edicion/07-voiceover` | narrador-omnisciente | VO dominante, no "original + TTS patch". |
| `publicacion/08-metricas-aprendizaje` | corregir-intuicion + formar-opinion parcial | Resonancia (shares, comentarios reflexivos) > post-test. |

**Resultado:** ninguna prescripción absurda tipo "retrieval practice cada 3 min" o "CTA de aplicación". Reforma validada.

---

## Caso C — Podcast audiovisual sobre LLMs con experto invitado

**Input:** "Podcast de ~90 min con un investigador de Anthropic, dos cámaras, publicamos en YouTube y Spotify."

### `concept-explainer`
- Preset: **`podcast-audiovisual-educativo`**.
- Ejes:
  - `arco-dominante: conversacional`
  - `objetivo-cognitivo: orientarse`
  - `grado-edicion: light`
  - `grado-guion: semi-improvisado`
  - `rol-presentador: anfitrion-de-experto`
- Plataforma: **`podcast-audio-primario`** (con VOD en YouTube como secundario; se declara como divergencia).

### Routing

| Brief | Sub-bloque | Qué prescribe |
|---|---|---|
| `guion/02-estructura` | conversacional + semi-improvisado | Agenda con 6-10 temas-ancla, no script línea a línea. |
| `guion/05-retrieval` | orientarse + semi-improvisado | Recapituleos cada ~20 min por el anfitrión; no retrieval formal. |
| `grabacion/01-audio` | anfitrion-de-experto | Multi-mic (2× SM7B + Cloudlifter), grabación en pistas separadas. |
| `grabacion/06-tomas` | semi-improvisado | One-take largo; no bloques. |
| `edicion/01-pacing` | conversacional + light | Cortes mínimos (silencios largos + umms); 1-2/min efectivos. |
| `edicion/09-transiciones` | universal | Corte seco dominante. |
| `publicacion/02-thumbnail` | podcast-audio-primario + long-form-horizontal | Thumbnail para YouTube + cover art cuadrado para Spotify. |
| `publicacion/05-programacion` | podcast-audio-primario | Cadencia fija (semanal / quincenal). |
| `publicacion/07-metricas-plataforma` | podcast-audio-primario | Retention en Spotify/Apple + consumption por episodio, no APV puro. |

**Resultado:** routing limpio. No se fuerza "heavy editing" ni "retrieval explícito" que romperían el formato.

---

## Caso D — Live stream de programación en Rust

**Input:** "Live stream de 3h programando un parser en Rust, responder chat, publicar VOD."

### `concept-explainer`
- Preset: **`live-stream-educativo`**.
- Ejes:
  - `arco-dominante: performativo`
  - `objetivo-cognitivo: adquirir-habilidad`
  - `grado-edicion: zero`
  - `grado-guion: improvisado`
  - `rol-presentador: demostrador`
- Plataforma: **`live-with-vod`**.

### Routing

| Brief | Sub-bloque | Qué prescribe |
|---|---|---|
| `guion/02-estructura` | improvisado + performativo | Lista de objetivos de sesión (qué intentar hacer funcionar); no script. |
| `guion/05-retrieval` | adquirir-habilidad + improvisado | Consolidación conversacional con chat ("¿alguien ve el bug?"), no retrieval formal. |
| `grabacion/04-escenas` | live-with-vod + zero | OBS con escenas + Stream Deck; el "setup es la grabación". |
| `grabacion/06-tomas` | improvisado + zero | One-take, sin retomas posibles. |
| **Edit stage: no aplica.** | `grado-edicion: zero` | `edit-explainer` no se invoca; sugerir saltar a `publish-explainer` con el VOD crudo si aplica re-publicación. |
| `publicacion/05-programacion` | live-with-vod | Schedule del stream + estrategia de VOD (mantenerlo, trim-down, resumen editado). |
| `publicacion/08-metricas-aprendizaje` | adquirir-habilidad | Replica del chat + stars de repo como señales; no post-test formal. |

**Resultado:** el skill de edición se salta correctamente; el flujo reconoce el modo live sin forzar post.

---

## Caso E — Fuera de scope: vlog de viaje

**Input:** "Quiero hacer un vlog de mi viaje a Oaxaca."

### `create-explainer` — filtro de scope

El skill identifica que el proyecto **no tiene intención pedagógica**: es narrativa afectiva sin concepto/habilidad transferible. Caso listado explícitamente en `## Filtro de scope` del orquestador.

Respuesta esperada:

> "Un vlog de viaje no calza con el scope de este toolkit — los principios (retrieval practice, ajuste por eje cognitivo, métricas de aprendizaje) están calibrados para videos con intención pedagógica (enseñar algo, corregir una intuición, transferir habilidad). Para un vlog afectivo te va a contaminar la producción más que ayudar. Sugerencia: usa una guía de producción general de vlogs, no este toolkit. Si en cambio lo que quieres es hacer un **documental breve sobre cocina oaxaqueña** o un **explainer sobre la historia del mezcal**, eso sí calza — contámelo con ese framing y arrancamos."

**Resultado:** filtro funciona; no se fuerza un Concept Brief falso.

---

## Conclusión

Los 4 casos de scope + 1 de filtro demuestran:

1. **Sin contaminación cruzada.** Documental no recibe retrieval formal; podcast no recibe heavy edit; live stream salta edit-explainer; tutorial técnico mantiene el comportamiento histórico.
2. **Routing por ejes funciona.** `varia-por-eje` + sub-bloques `### Por \`ejeX\`` resuelven cada decisión sin ambigüedad.
3. **Plataforma se comporta como eje transversal.** Especialmente dominante en etapa de publicación (6/8 briefs varían por plataforma).
4. **Filtro de scope preventivo.** Casos no-pedagógicos se redirigen antes de generar artefactos.

Reforma lista para cierre formal.
