# ROADMAP v1 — Playbook 1.0 para producción de video de entrenamiento estilo YouTube, con demo y guardrail anti-slop

Source: office-hours session 2026-04-18, mirror of `~/.gstack/projects/antonionungaray-sketch-training-video-toolkit/antonio-main-design-20260418-004705.md`
Branch: main
Status: APPROVED
Mode: Builder

## Problem Statement

El repo `learning-video-runbook` (antes `training-video-toolkit`) ya tiene la arquitectura correcta — orchestrator + 4 skills de etapa + 3 pilares + 4 vistas — pero funciona hoy más como *esqueleto* que como *playbook*. La meta es usarlo uno mismo y hacer que funcione para otros creadores, produciendo contenido audiovisual educativo y de divulgación atractivo para audiencias modernas de YouTube.

El gap no es estructura: es (a) contenido suficientemente afilado en los pilares dinámicos (2 y 3), (b) un guardrail explícito contra AI slop que preserve voz humana, y (c) una primera prueba real — un video publicado — que demuestre el flujo de punta a punta.

## What Makes This Cool

La mayoría de guías de "crecer en YouTube" son marketing. Los cursos universitarios de diseño instruccional ignoran las mecánicas de plataforma. Este playbook cruza las dos cosas: **ciencia cognitiva citada (Mayer, CLT, dual coding) + mecánica actual de YouTube (hook 0-3s, cadencia 2-4s, subtítulos como formato primario) + herramientas IA concretas — todo trazable**. Cada recomendación apunta a una sección de un pilar. No hay hand-waving.

La cita clave del brief original: *"muy atractivo para la audiencia (...) a través de las tendencias más efectivas usadas por creadores exitosos"*. El verbo es "atractivo", no "claro". La tensión atención + rigor es el posicionamiento real.

## Constraints

- **Idioma:** español en todo contenido y skills (enforced por CLAUDE.md).
- **Autonomía IA:** mix copiloto sobrio + piloto supervisado. Humano aprueba y es responsable de voz, juicio editorial, personalidad. IA asiste en transcripción, normalización, cortes por silencio, candidatos de miniatura.
- **Pilar 1 intocable:** la ciencia cognitiva gana conflictos salvo override explícito del usuario.
- **Estándares objetivos de `edicion` son no-negociables:** LUFS (-14 YT, -16 pod, -23 EBU), WCAG 2.2 AA (4.5:1 body, 3:1 large), subs (15-20 CPS, ≤2 líneas, 37-42 chars).
- **No romper "lo suficiente":** v1 cubre tutorial técnico + divulgación corta; onboarding corporativo y telemetría YouTube Analytics van a v2.
- **No SaaS pagado como dependencia central de pilar 3:** herramientas open source primero (WhisperX, auto-editor, ffmpeg, Ollama); SaaS nombrado como alternativa.

## Premises

1. **El problema es contenido, no estructura.** El toolkit tiene la forma correcta. Afilar pilar 2 y 3; añadir un skill transversal (`anti-slop-guardrail`), no una etapa nueva.
2. **Pilar 1 se queda como está.** La ganancia para audiencias YouTube viene casi toda de pilar 2 (hook, cadencia, subs-primero, miniatura, duración, B-roll density).
3. **Refinada:** Primer video se produce en paralelo con pilares 2/3, pero solo *después* de que pilar 2 esté medianamente completo vía research+docs. No bloqueante al 100%, pero gated en pilar 2 decente.
4. **"Humano y orgánico" requiere guardrail versionada.** Codificar qué NO se delega a IA (voz, cortes críticos, chistes, metáforas) y qué SÍ (transcripción, LUFS, rough cut por silencios, candidatos de miniatura). Implementar como skill + vista, no como párrafo.

## Cross-Model Perspective

Subagente Claude independiente (Codex no disponible) destacó:

- **Posicionamiento:** "Atractivo + riguroso" es el verdadero moat vs. cursos de YouTube growth o cursos académicos de instructional design. Vale la pena codificarlo en README y en el hook del orchestrator.
- **Moat técnico:** el puente traceable pilar 1 → decisión concreta en timeline ("cortar B-roll genérico en 00:47 por coherence principle"). Submagic/Opus Clip tienen heurísticas sin justificación citada.
- **Prototipo de fin de semana propuesto:** skill `anti-slop-guardrail` (1 archivo), expansión pilar 2 con 6-8 patrones citados, Makefile con `make transcribe` / `rough-cut` / `loudness` / `subs`.
- **Descartado para v1:** su loop de telemetría YouTube Analytics → patch a pilar 2. Es Approach C — queda para v2.

## Approaches Considered

### Approach A: Sprint mínimo viable
1 semana. Pilar 2 solo para tutoriales técnicos, skill anti-slop, video. Publica rápido pero cojo para adopción externa (Completeness 6/10).

### Approach B: Playbook 1.0 + video como demo (elegido)
3-5 semanas realistas (3 si todo fluye; 5 contando instalación de WhisperX/CUDA, iteraciones de guion, re-grabación). Cobertura de dos nichos (tutoriales técnicos + divulgación corta), skill + vista anti-slop, Makefile starter, pilar 3 con open source concreto, video como demo, postmortem como primer dato (Completeness 9/10).

### Approach C: Laboratorio con telemetría
2 meses. B + evals JSON + YouTube Analytics → patch automático a pilar 2. Rompe "lo suficiente" (Completeness 10/10 pero sobre-ingeniería para v1).

## Recommended Approach (Approach B)

### Semana 1 — Sprint de pilares

**Afilar pilar 2 a "medianamente completo"** (4-6h de research con `actualizar-tendencias` o manual):

- Documentar 6-8 patrones probados en 2026 con citas/casos: hook 0-3s por intención (stakes, curiosidad, promesa concreta), cadencia de cortes 2-4s para retención, subtítulos como formato primario (silent consumption), miniatura con cara + 2-3 palabras, duración objetivo por nicho (tutorial técnico: 4-8 min; divulgación: 5-10 min), B-roll density (cada 8-15s para no saturar), pattern interrupts cada 60-90s, outro CTA específico vs. genérico.
- Anti-patrones documentados: intro de creador >10s, uniform fast cuts, B-roll decorativo no funcional, subs como after-thought.
- Dos secciones por nicho: `### Tutoriales técnicos de software` y `### Divulgación corta`. Onboarding corporativo queda marcado "Pendiente v2".
- Tabla "Frescura" con fecha de verificación 2026-04-18.

**Afilar pilar 3 con herramientas open-source concretas** (2-4h):

- Por etapa, herramientas con versión + ejemplo de comando/config:
  - Guion: Claude/Ollama local (drafts), markdown.
  - Grabación: OBS (captura pantalla + cara), micrófono USB dinámico (Shure MV7/Samson Q9U según presupuesto), cualquier laptop con luz neutra.
  - Edición: auto-editor (corte por silencios), Shotcut/Kdenlive (ediciones críticas humanas), ffmpeg + loudnorm filter para LUFS.
  - Post: WhisperX (transcripción + timestamps para SRT 15-20 CPS), Aegisub (ajuste manual si hace falta), HandBrake para export.
  - Miniatura: Krita/GIMP o Canva gratis; IA para candidatos (SDXL local o Flux) pero selección humana.
- SaaS nombrado como alternativa pero no default: Descript, Submagic, Opus Clip, ElevenLabs.

### Semana 2 — Guardrail anti-slop + starter de proyecto de video

**Nuevo skill `skills/anti-slop-guardrail/SKILL.md`** — transversal, no stage. Se invoca antes de exportar/publicar:

1. Lista de "no delegables" con verificación: ¿la voz en el video es tuya (no TTS)? ¿El juicio editorial de cortes críticos es tuyo? ¿Los chistes/personalidad son tuyos? ¿Las metáforas salieron de tu experiencia?
2. Lista de "delegables" con verificación: ¿transcripción humana-revisada? ¿LUFS normalizado (ffmpeg)? ¿rough cut humano-ajustado? ¿miniatura candidata humano-seleccionada?
3. Si alguna respuesta es "no", bloquea el export y pide al humano completar.
4. Output: artefacto JSON `anti-slop-audit.json` con firma del humano.

**Nueva vista `docs/vistas-por-etapa/anti-slop.md`** — síntesis + checklist final, como las otras vistas.

**Template `templates/video-project/Makefile`** — starter para cada proyecto de video nuevo. Comandos verificados contra versiones actuales (WhisperX ≥3.1, auto-editor ≥24.x, ffmpeg ≥6):
```make
INPUT ?= input.mp4
OUT   ?= output

transcribe: ; whisperx $(INPUT) --output_format srt --language es --output_dir $(OUT)
rough-cut:  ; auto-editor $(INPUT) --edit audio:threshold=0.04 --margin 0.2sec -o $(OUT)/rough.mp4
# loudnorm de dos pasadas (precisión real; single-pass es aproximado)
loudness:
	ffmpeg -i $(INPUT) -af loudnorm=I=-14:TP=-1:LRA=11:print_format=json -f null - 2>&1 | tee loudnorm.log
	# Leer measured_I, measured_TP, measured_LRA, measured_thresh, offset del log, luego:
	# ffmpeg -i $(INPUT) -af loudnorm=I=-14:TP=-1:LRA=11:measured_I=X:measured_TP=Y:measured_LRA=Z:measured_thresh=W:offset=O:linear=true:print_format=summary -c:v copy $(OUT)/final.mp4
subs:       ; whisperx $(INPUT) --output_format srt --max_line_width 42 --max_line_count 2 --output_dir $(OUT)
```
Con README del template que explica dependencias (ffmpeg, auto-editor, WhisperX) y versiones pinneadas. **Nota importante:** WhisperX requiere CUDA + token de HuggingFace para diarización; documentar fallback a `openai-whisper` (CPU, sin diarización) para creadores sin GPU.

### Semana 3 — Video como demo (producción + publicación)

- Producir el tutorial de la herramienta de voz→texto (5-7 min, target tutorial técnico de software).
- Orden de invocación: `/crear-entrenamiento` (orchestrator decide etapa) → `/guion-entrenamiento` → `/grabacion-entrenamiento` → `/edicion-entrenamiento` → `/anti-slop-guardrail` (gate obligatoria antes de exportar) → `/publicacion-entrenamiento`.
- `anti-slop-guardrail` emite `anti-slop-audit.json` con schema mínimo:
  ```json
  { "proyecto": "voz-a-texto-tutorial", "fecha": "2026-05-XX",
    "no_delegables": { "voz": "humana", "cortes_criticos": "humana",
      "chistes_personalidad": "humana", "metaforas": "humana" },
    "delegables_verificados": { "transcripcion": "revisada", "lufs": "normalizado",
      "rough_cut": "ajustado", "miniatura": "seleccionada_humana" },
    "aprobado_por": "antonio", "aprobado_commit": "<git sha>" }
  ```
  Firma = commit sha del último commit del humano en el branch del proyecto. Sin IA-firma.

### Semana 4 — Postmortem + reinyección a pilares

- 7 días post-publicación, escribir **`postmortem-001.md`** en `<repo del video>/postmortems/` (para creadores con gstack: `~/.gstack/projects/$SLUG/postmortems/`; para el resto: carpeta local al proyecto del video):
  - Qué skill falló o dio fricción (qué pregunta no me ayudó, qué cita estaba débil, qué tool IA no funcionó como prometí).
  - Qué sección de pilar 2 o 3 necesita update, con propuesta de patch concreto.
  - 3 métricas observadas tras 7 días: APV (%), retention curve drops, CTR.
- Abrir PR en el repo del toolkit con el patch a pilar 2/3. Ese es el primer dato del feedback loop (sin YouTube API todavía — lectura manual desde YouTube Studio).

## Open Questions

- ¿El tutorial de voz→texto se publica en un canal ya existente, o se crea uno nuevo? (No bloquea v1, pero define dónde observar métricas.)
- ¿Las dependencias del Makefile (WhisperX, auto-editor) valen la pena documentar como `setup.sh` interactivo para otros creadores, o README basta? (Probablemente README en v1, script en v2.)
- ¿La guardrail anti-slop debe ejecutarse también en pre-grabación (antes de guion final) o solo pre-export? (Pre-export basta en v1.)

## Success Criteria

v1 se considera exitosa si:

1. Pilar 2 tiene 2 nichos cubiertos (tutorial técnico + divulgación corta) con 6-8 patrones citados cada uno, fecha de verificación 2026-04-Q2.
2. Pilar 3 nombra herramientas concretas con versión + ejemplo, open source como default.
3. `anti-slop-guardrail` skill existe, tiene checklist ejecutable, produce `anti-slop-audit.json` antes de cada export.
4. Template `Makefile` funciona de punta a punta en un proyecto de video nuevo sin edición manual previa.
5. Tutorial de voz→texto publicado, con postmortem escrito en 7 días post-publicación.
6. Primer patch a pilar 2 o 3 mergeado basado en el postmortem.

## Distribution Plan

- **Primario:** sigue como plugin de Claude Code vía `.claude-plugin/marketplace.json`. Versión bump: 0.1.0 → 0.2.0 al mergear v1 (nuevo skill + template = user-visible).
- **Secundario para otros creadores (v1):** README del repo con "Cómo empezar" linkeado desde el orchestrator. Sección nueva "Para otros creadores" explicando instalación como plugin + dependencias del Makefile.
- **Diferido a v2:** portar a repo standalone con docs web, curso, o cualquier canal no-Claude-Code.

## Dependencies

- Herramientas locales: WhisperX, auto-editor, ffmpeg, OBS (usuario ya debería tener o instalar; documentado en template README).
- Sin dependencia de SaaS pagados en la ruta default.
- Sin dependencia de YouTube Analytics API en v1 (postmortem manual con screenshots de YouTube Studio).

## Next Steps

Orden recomendado (Approach B desglosado):

1. **Día 1-2:** Correr `/actualizar-tendencias` con queries específicas para los 6-8 patrones listados. Documentar en pilar 2. Marcar conflictos con pilar 1 si aparecen.
2. **Día 3:** Correr `/actualizar-herramientas` para afilar pilar 3 con open source concreto. Documentar versiones probadas.
3. **Día 4-5:** Escribir `skills/anti-slop-guardrail/SKILL.md` + `docs/vistas-por-etapa/anti-slop.md` siguiendo el contrato de los otros skills/vistas.
4. **Día 6:** Crear `templates/video-project/` con Makefile + README.
5. **Día 7:** Pausa — revisar todo junto. Bump versión plugin a 0.2.0.
6. **Semana 3:** Producir tutorial de voz→texto usando el playbook nuevo de punta a punta. Notas de fricción en tiempo real. Publicar al final de semana 3.
7. **Semana 4 (día 7 post-publicación):** Escribir postmortem-001. Abrir PR con patch a pilar 2/3.

## The Assignment

**Esta semana:** correr `/actualizar-tendencias` con un scope explícito — "tutoriales técnicos de software 2026" — y producir un draft de pilar 2 con al menos 6 patrones citados antes del domingo. No escribas código todavía. El guion del tutorial de voz→texto espera hasta que pilar 2 esté medianamente completo. Cuando tengas el draft, invoca `/crear-entrenamiento` y prueba si el orchestrator ya te direcciona bien hacia `guion-entrenamiento` con el pilar 2 actualizado. Ese primer test te va a decir más que una semana de planning.

## Reviewer Concerns (no bloqueantes pero registrados)

Iteración 1 de revisión adversarial detectó estos puntos; varios ya fueron corregidos arriba. Quedan abiertos:

- **Schema JSON anti-slop más detallado.** El schema arriba es mínimo viable; antes de v1 final, validar con un JSON Schema o Zod-style definition en `skills/anti-slop-guardrail/schema.json`.
- **Convención de nombres de archivo en el Makefile.** `INPUT ?= input.mp4` es un default; conviene que el README documente cómo renombrar y cómo estructurar `raw/`, `cuts/`, `final/`.
- **WhisperX fallback para creadores sin GPU.** El README del template debe incluir la ruta alterna (openai-whisper CPU + sin diarización) y dejar explícito qué se pierde.
- **Version pinning concreto en pilar 3.** "Versiones probadas" debe traducirse a números exactos (ej. `whisperx==3.1.5`, `auto-editor==24.44.0`, `ffmpeg 6.1+`) antes de cerrar v1.
- **Línea vs. C (telemetría).** Success criterion #6 ("primer patch a pilar 2/3 mergeado basado en postmortem") es manual-v1 del loop telemetría. Dibujar la línea explícita vs. Approach C en el README para que v2 no ambigüe scope.
