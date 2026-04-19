---
name: edicion-entrenamiento
description: "Use when the user is at the editing / post-production stage of a training video — cutting, pacing, signaling, audio normalization (LUFS), captions, B-roll, voiceover IA, or rendering. Etapa de edición y post del toolkit de entrenamiento audiovisual."
---

# Edición de entrenamiento audiovisual

Acompañas al creador a convertir el material crudo en un video que respeta
los principios cognitivos, aplica las convenciones actuales de pacing y
señalización, y cumple estándares técnicos objetivos.

## Carga obligatoria al inicio

Antes de proponer cualquier decisión, **lee todos los briefs de esta etapa**:

```
docs/briefs/edicion/*.md
```

(10 archivos de 40-100 líneas cada uno. Orden alfabético = orden de flujo:
01-pacing → 02-senalizacion → 03-audio-loudness → 04-texto-pantalla →
05-subtitulos → 06-b-roll → 07-voiceover → 08-render → 09-transiciones →
10-overlays-auxiliares.)

**NO leer pilares completos en runtime.** Los briefs ya sintetizan la
información pertinente con trazabilidad al pilar vía IDs estables. Si
durante el flujo surge una pregunta del usuario fuera del scope de los
briefs, usá `Grep` dirigido por ID (ej. `grep "P1-§3.2"
docs/pilares/01-fundamentos-cognitivos.md`), no `Read` del archivo
completo.

## Flujo

Camina al creador por las 10 decisiones críticas **en el orden de los
briefs cargados**. Cada decisión usa EXCLUSIVAMENTE su brief
correspondiente.

Para cada decisión:

1. **Plantear la `pregunta`** del frontmatter del brief al usuario.
2. **Aplicar el test de determinismo upstream** (solo si el brief tiene
   `admite-variantes: true`):
   - Si al menos 2 de los `Casos` listados en el brief son razonablemente
     aplicables al contexto actual del usuario evaluado contra **TODOS
     los ejes** (audiencia + plataforma + nicho + decisiones previas ya
     aprobadas): **ofrecer variantes con recomendación**.
   - Si un solo caso domina: proponer una sola propuesta, no ofrecer
     variantes.
   - **Nota de etapa:** en edición, la mayoría de decisiones son
     deterministas (estándares técnicos objetivos). Admiten variantes:
     01-pacing, 02-senalizacion, 09-transiciones, 10-overlays-auxiliares
     (4/10). El resto (loudness, texto, subtítulos, B-roll, voiceover,
     render) tiene `false` por diseño.
3. **Proponer con justificación trazable** usando `Principio aplicable` +
   `Casos` del brief. Si el brief lista `Conflictos conocidos` aplicables
   al contexto, **flaggearlos explícitamente al usuario**.
4. **Dispatch de variantes (solo si aplica y el usuario aceptó explorar):**
   invocar Task tool con el brief congelado inline + decisiones previas
   acumuladas. NO elige el sub-agent — devuelve N variantes; la decisión
   la toma el main.
5. **Registrar la decisión aprobada** antes de pasar a la siguiente.

## Estándares técnicos objetivos (no negociables)

Estos viven inline en los briefs pero los repito acá para énfasis:

- **Loudness** (brief 03): -14 LUFS integrated YouTube/redes; -16 LUFS
  podcast; -23 LUFS broadcast EBU R128. True peak ≤ -1 dBTP.
- **Contraste de texto en pantalla** (brief 04): WCAG 2.2 AA — 4.5:1
  cuerpo, 3:1 texto grande.
- **Subtítulos** (brief 05): 15-20 CPS, ≤2 líneas, 37-42 chars/línea,
  1-7s en pantalla.

Si el usuario propone violar uno de estos, **flaggear explícitamente** y
pedir justificación antes de aceptar el override.

## Salida

Al terminar las 10 decisiones, produce un **plan de edición documentado**
con el siguiente formato:

```
PROYECTO: [nombre del video]
PLATAFORMA DESTINO: [YouTube / Vimeo / LMS / etc.]
DURACIÓN FINAL: [N min]

═══ 01. PACING ═══
[CORTES/MIN POR BLOQUE]: [lista por bloque]
[PODA]: [cortes decorativos eliminados]

═══ 02. SEÑALIZACIÓN ═══
[LISTA POR TIMESTAMP]: [qué, técnica, duración]

═══ 03. AUDIO LOUDNESS ═══
[TARGET]: [-14 / -16 / -23 LUFS + true peak]
[HERRAMIENTA USADA]: [FFmpeg / DaVinci / etc.]
[LOG DEL MEDIDOR]: [captura o valor final]

═══ 04. TEXTO EN PANTALLA ═══
[LISTA DE LABELS]: [contenido, tipo, timestamp]
[TIPOGRAFÍA]: [familia + tamaños + jerarquía]
[CONTRASTE VERIFICADO]: [valor por elemento crítico]

═══ 05. SUBTÍTULOS ═══
[CPS VERIFICADO]: [valor]
[REVISIÓN MANUAL]: [log de términos técnicos corregidos]
[OPEN/CLOSED]: [sí/sí o sí/no]

═══ 06. B-ROLL ═══
[LISTA POR TIMESTAMP]: [qué muestra, qué ilustra, duración]
[PODA]: [B-roll eliminado por no cumplir función]

═══ 07. VOICEOVER ═══
[DECISIÓN POR SEGMENTO]: [original / regrabado / TTS clonado / TTS genérico]

═══ 08. RENDER ═══
[PRESET]: [codec, bitrate, resolución, fps, container, audio codec]
[VERIFICACIÓN FFPROBE]: [confirmación de parámetros]

═══ 09. TRANSICIONES ═══
[POR BLOQUE]: [corte seco / cross-dissolve Nms / J-cut / match cut / …]
[NO POST-PRODUCIBLES]: [listado de zooms/PiP ya resueltos en captura]

═══ 10. OVERLAYS AUXILIARES ═══
[CATÁLOGO]: 10 tipos universales + 'otro' (escape hatch libre).
Cada tipo tiene cita al pilar que lo respalda (el brief lo documenta).
[LISTA POR TIMESTAMP]: [bloque, tipo, timestamps, descripción/prompt IA]
  Ejemplo (explainer económico):
    B3  stat-callout    01:12-01:15  "8.3% inflación anual"
    B4  pull-quote      02:11-02:16  "...función de reacción" — Banxico
    B6  question-prompt 04:20-04:24  "¿Cuál es el mecanismo de transmisión?"
    B6  answer-reveal   04:26-04:29  "Tasa → crédito → consumo"
    B7  otro            05:10-05:12  "mapa animado de la región afectada"
[HERRAMIENTA DE GENERACIÓN]: [Remotion / Motion Canvas / HyperFrames / Manim]
[PROPAGADOS DESDE]: [Production Brief locked, sección 4]

═══ NOTAS DE PRODUCCIÓN ═══
[CONFLICTOS FLAGGEADOS]: [lista — incluye P2 vs P1 y P1 vs restricción
externa como accesibilidad]
```

Verifica antes de declarar la etapa completa:

- [ ] Pacing variable por bloque, sin tomas estáticas largas injustificadas.
- [ ] Señalización solo donde aporta.
- [ ] Audio master verificado al LUFS target (log o captura).
- [ ] Texto en pantalla con contraste WCAG AA confirmado.
- [ ] Subtítulos a 15-20 CPS, revisados manualmente.
- [ ] B-roll todo funcional; lista de poda explícita.
- [ ] Voiceover consistente, sin rupturas entre original y TTS.
- [ ] Render en preset correcto para plataforma destino; ffprobe
      confirma.
- [ ] Transiciones declaradas y coherentes con lo que YA viene en el
      crudo (no "arreglar zoom en post").
- [ ] Overlays auxiliares ejecutados con timestamps sincronizados a la
      narración; los del Production Brief `locked` están todos cubiertos.
- [ ] Cero conflictos no resueltos (P2 vs P1 o P1 vs restricción externa).

## Reglas firmes

- **Nunca leer pilares completos** en el flujo normal. Solo briefs.
- **Trazabilidad obligatoria:** cada recomendación cita ID del brief
  (`[P1-§X.Y]`, `[P3-edicion-X]`) en la justificación al usuario.
- **Estándares técnicos (loudness, contraste, CPS) no son opinión.**
  Exigir override explícito del usuario para violarlos, con razón.
- **Subtítulos:** nunca aceptar transcripción automática de Whisper sin
  revisión manual — falla sistemáticamente en jerga técnica y nombres
  propios.
- **Música bajo voz siempre con ducking** (-18 LU mínimo) o fuera.
- **Variantes solo cuando el test de determinismo las habilita** y solo
  en briefs con `admite-variantes: true`.
