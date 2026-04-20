---
decision: edicion/03-audio-loudness
etapa: edicion
pregunta: ¿Cumple la pista master los estándares objetivos de loudness y true peak de la plataforma destino?
fuentes:
  - P1-§2.3-#1                 # coherencia (música decorativa compite)
  - P2-edicion-antipatrones    # música bajo voz sin ducking
  - P3-edicion-postproc        # FFmpeg para normalización
  - P3-edicion-editores        # DaVinci/Audacity integran medidores LUFS
admite-variantes: false
varia-por-eje: []
sync: 2026-04-20
version: 2
---

## Principio aplicable

**Estándares objetivos, no opinión.** Loudness y true peak son números
medidos por medidor LUFS (integrated + momentary + short-term) y por
true-peak meter. No hay "me suena bien" — hay que medir.

**Coherencia** [P1-§2.3-#1]: música de fondo que compite con la voz
degrada inteligibilidad y aprendizaje. Si hay música, debe tener función
(transición entre bloques, intro/outro) y atenuar -18/-20 LU bajo voz.

## Casos

- **YouTube y la mayoría de plataformas sociales:** target **-14 LUFS
  integrated**, true peak **≤ -1 dBTP**. YouTube normaliza al subir: si
  subes más fuerte, baja; si subes más bajo, NO sube (pierdes loudness
  perceptual).
- **Podcast (Spotify/Apple Podcasts):** target **-16 LUFS integrated**,
  true peak **≤ -1 dBTP**.
- **Broadcast EBU R128:** target **-23 LUFS integrated**, true peak
  **≤ -1 dBTP** (o -2 dBTP estricto para distribución).
- **Herramientas de medición** [P3-edicion-postproc]: FFmpeg `loudnorm`
  filter hace medición + normalización en una pasada. DaVinci Resolve
  y Premiere tienen medidores LUFS integrados [P3-edicion-editores].
  Audacity + plugin ACX-check para medición manual.

## Anti-patrón

**"Normalizar al peak" en lugar de al loudness integrated**
[P2-edicion-antipatrones]. Normalizar al peak no garantiza volumen
percibido uniforme entre videos — 2 videos con el mismo peak pueden
sonar uno mucho más fuerte que otro. El peak es techo, el LUFS es
volumen percibido.

**Música de fondo bajo voz sin ducking** [P1-§2.3-#1]: degrada
inteligibilidad de la narración y añade carga extraña. Si va música,
aplicar ducking automático (-18 LU bajo voz) o removerla.

**Procesado offline sin log.** Sin log del medidor o salida de
`ffmpeg loudnorm` [P3-edicion-postproc], no hay trazabilidad del
resultado. Queda a memoria del editor si el master pasó el estándar.

## Heurística numérica

- **Master integrated LUFS:** valor objetivo según plataforma (ver
  Casos).
- **True peak:** siempre ≤ -1 dBTP (algunos flujos exigen -2 dBTP).
- **Headroom durante edición:** mezclar apuntando -16 a -18 LUFS y
  aplicar el loudness pass final; así hay rango para limitar sin
  clipping.
- **Ducking música vs. voz:** mínimo -18 LU, ideal -20 a -24 LU.

## Conflictos conocidos

Ninguno.

## Salida esperada

- Target LUFS integrated + true peak elegido para la plataforma destino.
- Herramienta usada para medir (FFmpeg loudnorm / plugin del editor /
  Audacity / medidor estándar).
- Captura del medidor o log de FFmpeg confirmando target alcanzado.
- Si hay música: nota del ducking aplicado.

## Snippet de referencia (FFmpeg loudnorm two-pass)

```
# Pass 1 (medición, no modifica archivo):
ffmpeg -i input.mp4 -af loudnorm=I=-14:TP=-1:LRA=11:print_format=json \
  -f null - 2>&1 | tail -20

# Pass 2 (aplica normalización con valores medidos):
ffmpeg -i input.mp4 \
  -af loudnorm=I=-14:TP=-1:LRA=11:measured_I=<from_pass1>:measured_TP=<from_pass1>:measured_LRA=<from_pass1>:measured_thresh=<from_pass1>:linear=true \
  -c:v copy output.mp4
```
Cambiar `I=-14` por `-16` (podcast) o `-23` (broadcast) según plataforma.
