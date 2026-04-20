---
decision: edicion/08-render
etapa: edicion
pregunta: ¿Qué preset de export (codec, resolución, frame rate, bitrate) para la plataforma destino?
fuentes:
  - P2-publicacion-patrones
  - P3-edicion-editores        # DaVinci/Premiere/Kdenlive presets
  - P3-edicion-postproc        # FFmpeg para control fino
admite-variantes: false
varia-por-eje: [plataforma]
sync: 2026-04-19
version: 2
---

## Principio aplicable

**Cumplir la spec de la plataforma sin re-encoding adicional.** Cada
plataforma publica specs recomendadas; exceder o caer por debajo fuerza
un re-encoding que degrada calidad. El objetivo es entregar un archivo
que la plataforma acepta en primera pasada y re-encoda mínimo.

## Casos (specs vigentes 2026)

Fuente para estas specs: plataformas + stack de editores listado en
[P3-edicion-editores] y herramientas de post [P3-edicion-postproc].
Convenciones de plataforma observadas en el atlas [P2-publicacion-patrones].

- **YouTube horizontal 1080p:** 1920×1080, 30 o 60 fps, H.264 High
  Profile, bitrate 8-12 Mbps (30fps) / 12-18 Mbps (60fps), AAC 384 kbps
  estéreo, container MP4.
- **YouTube vertical Shorts:** 1080×1920, 30 fps, H.264, 8-12 Mbps,
  ≤60s.
- **YouTube 4K:** 3840×2160, 30 o 60 fps, H.264 o H.265, bitrate
  35-45 Mbps (H.264) / 15-25 Mbps (H.265).
- **Vimeo Pro:** 1080p o 4K, H.264, bitrate más flexible (hasta
  20 Mbps 1080p). Re-encoding menor.
- **LMS corporativo (Articulate, Moodle, Cornerstone):** verificar spec
  del LMS específico; típicamente MP4 H.264 1080p 30fps 5-8 Mbps para
  eficiencia de streaming interno.

## Anti-patrón

**Export con preset "por default" del editor** [P3-edicion-editores]
sin verificar spec destino. DaVinci export por default puede ser 4K si
el timeline es 4K, pero tu canal entrega 1080p → YouTube re-encoda y
pierde calidad. Siempre configurar preset explícito.

**Bitrate excesivo** (20 Mbps para 1080p YouTube): desperdicia banda
y storage sin ganancia perceptual; YouTube lo re-encoda igual.

**Frame rate variable (VFR).** Algunas plataformas no lo procesan bien.
Siempre export CFR (constant frame rate) explícito, verificable con
`ffprobe` [P3-edicion-postproc].

## Heurística numérica

- **Codec por default:** H.264 High Profile. H.265 si el editor +
  plataforma lo soportan sin fricción.
- **Container:** MP4 (.mp4) — universal. MOV solo en workflows
  específicos.
- **Audio:** AAC 192-384 kbps estéreo, 48kHz.
- **Frame rate:** coincidir con el del timeline original (no convertir
  30→60 ni viceversa excepto razón explícita).
- **Bitrate 1080p 30fps:** 8-12 Mbps.

## Ajuste por eje

### Por `plataforma`

- **`long-form-horizontal`:** 1920×1080 (FHD) o 3840×2160 (4K UHD) 16:9, H.264 (máx compatibilidad) o H.265/HEVC (mejor compresión). Bitrate: 8-12 Mbps FHD, 35-45 Mbps 4K. Audio AAC 192-320 kbps stereo. Target YouTube/Vimeo.
- **`shorts-vertical`:** 1080×1920 9:16, H.264, bitrate 4-8 Mbps. Subtítulos burned-in obligatorios (consumo silencioso). Duración ≤90s hard-clamp del encoder.
- **`podcast-audio-primario`:** render audio primario a -16 LUFS WAV/FLAC 48kHz; video acompañante en 1920×1080 H.264 baja complejidad (talking heads = poco movimiento, bitrate bajo acceptable).
- **`live-with-vod`:** live en RTMP con OBS encoder (NVENC/x264), bitrate 6000-9000 kbps YouTube Live, 3500-6000 Twitch. VOD re-render a long-form con normalización LUFS + cleanup.
- **`corporate-lms`:** render SCORM-compliant (paquete ZIP con manifest XML) o MP4 con metadata xAPI (tracking granular). Burned-in subs + transcript attach para WCAG AA compliance.

## Conflictos conocidos

Ninguno.

## Salida esperada

- Preset explícito usado (codec, bitrate, resolución, fps, container,
  audio codec + bitrate).
- Plataforma destino confirmada.
- Archivo exportado verificado con `ffprobe` o equivalente que los
  parámetros coinciden con el preset declarado.

## Snippet de verificación (ffprobe)

```
ffprobe -v quiet -show_streams -show_format output.mp4
```
Debe reportar: `codec_name=h264`, `profile=High`, `width=1920`,
`height=1080`, `r_frame_rate=30/1` (CFR, no VFR), `bit_rate` dentro de
±15% del target, audio `codec_name=aac`, `sample_rate=48000`,
`channels=2`, `format_name=mov,mp4,m4a,3gp,3g2,mj2`.
