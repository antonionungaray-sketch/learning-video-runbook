---
decision: concepto/04-formato-y-duracion
etapa: concepto
pregunta: ¿Long, mid, short — y qué ratio de aspecto?
fuentes:
  - P1-§2.4                     # cuánto dura una unidad útil (Guo et al. 2014)
  - P1-§2.3-#6                  # principio de segmentación
  - P2-idea-guion-patrones      # cadencias por nicho
  - P2-meta-tutorial            # duraciones típicas de tutorial
  - P2-meta-divulgacion         # duraciones típicas de divulgación
  - P2-meta-onboarding          # microlearning ~5-10 min, completion ~80%
  - P2-meta-transversales       # duración no es el eje, cadencia sí
  - P2-ficha-fireship           # 100s comprimido
  - P2-ficha-midudev            # mid-form 5-15 min
  - P2-ficha-kurzgesagt         # long 9-13 min con WPM bajo
admite-variantes: true
varia-por-eje: [grado-edicion, plataforma]
sync: 2026-04-19
version: 2
---

## Principio aplicable

**Engagement promedio cae marcadamente pasados los ~6 min en contenido
lectivo continuo** (Guo, Kim & Rubin 2014, 6.9M sesiones edX)
[P1-§2.4]. Esto **no** significa "todo video debe durar 6 min" — los
videos largos con segmentación interna explícita siguen funcionando.
El principio de segmentación de Mayer [P1-§2.3-#6] dice exactamente
eso: dividir en unidades manejables, idealmente con control del usuario
sobre el avance.

**Duración no es el eje — la cadencia relativa al contenido lo es**
[P2-meta-transversales]. Fireship (100s comprimido), MoureDev (5-6 min
segmentado), 3B1B (34 min denso), ThePrimeagen (4-12 min edit-from-stream)
respetan el ceiling de Guo et al. con estrategias distintas: compresión
radical, segmentación serial, segmentación natural dentro del video
largo, o edit-down.

El **ratio de aspecto** se decide aquí porque condiciona todo lo
downstream: 16:9 horizontal (YouTube long), 9:16 vertical (Shorts /
Reels / TikTok), cuadrado (LinkedIn feed). El ratio influye en
encuadre, ubicación de overlays, y cómo se consume — silencioso o no.

## Casos

- **Compresión radical 80-120s** [P2-ficha-fireship]: 200+ WPM, memes y
  overlays densos, sin cara. Requiere audiencia ya-familiarizada.
  Replicar para audiencia non-técnica produce carga ingestionable.
- **Mid-form 5-15 min hispano** [P2-ficha-midudev]: tech-news reactivo,
  hook urgencia + twist, screencast + face-cam. Cadencia ~188 WPM con
  pausas para pre-entrenamiento on-the-fly.
- **Long-form animado 9-13 min** [P2-ficha-kurzgesagt]: explainer
  conceptual, WPM pausado (147-165), animación isotype densa
  compensando. Requiere equipo de producción.
- **Microlearning corporativo 5-10 min** [P2-meta-onboarding]: default
  industria 2024-2025. Cada módulo auto-contenido con objetivo + demo +
  checkpoint. Completion ~80% vs ~20% en long-form.
- **Vertical hilo Shorts/Reels** [P2-meta-divulgacion]: ≤90s × N partes,
  cada parte cierra con open loop hacia la siguiente.

## Anti-patrón

**Microlearning como truncamiento de un curso largo** [P2-meta-onboarding].
Cortar un video de 60 min en seis pedazos no es microlearning —
requiere rediseño desde el objetivo de cada módulo.

**Replicar duración Fireship sin las condiciones que la habilitan**
[P2-idea-guion-patrones]: 200+ WPM exige audiencia técnica
pre-entrenada y canal visual denso compensatorio. Sin esos
pre-requisitos, satura el canal auditivo.

**El mismo edit para todas las plataformas.** El contenido necesita
re-edit por plataforma — el formato es plataforma-específico.

## Heurística numérica

- **Tutorial técnico ejecutable:** 5-12 min, 16:9, WPM 180-220 según pre-entrenamiento [P2-meta-tutorial].
- **Divulgación general:** 8-15 min, 16:9, WPM 150-180 compensado por canal visual [P2-meta-divulgacion].
- **Onboarding microlearning:** 5-10 min, 16:9, WPM 160-180, un objetivo por módulo [P2-meta-onboarding].
- **Vertical (Shorts/Reels):** ≤90s, 9:16, silencioso por default.

## Ajuste por eje

### Por `grado-edicion`

- **`heavy`:** la duración la decide el editor. Rango típico 8-30 min en long-form editado, 5-12 min en explainer comprimido, ≤2 min en Shorts.
- **`medium`:** 8-20 min (how-to, Ali Abdaal, Matt D'Avella).
- **`light`:** la duración la decide el speaker o la conversación — 18 min TED, 1-5h podcast, 30-90 min conferencia académica.
- **`zero`:** la duración es la sesión en vivo — 1-6h típico en live stream educativo; las piezas re-publicadas son edit-down (mute a `medium`).

### Por `plataforma`

- **`long-form-horizontal`:** 5-60 min, 16:9, audio asumido activo.
- **`shorts-vertical`:** ≤90s, 9:16, silencioso por default + subtítulos obligatorios. Hook <1s.
- **`podcast-audio-primario`:** 30 min-5h; el video es accesorio; metadata (capítulos) crítica.
- **`live-with-vod`:** 1-6h live + edit-down opcional a 5-30 min para VOD long-form.
- **`corporate-lms`:** 5-15 min por módulo (microlearning); SCORM compliance; tracking.

## Conflictos conocidos

**Plataforma vertical pide ≤60-90s** vs **objetivo medible que requiere
contexto** [P1-§2.4]. Para tutoriales ejecutables el formato vertical
suele ser insuficiente — flaggear al usuario y proponer hilo de N
partes con open loop entre piezas, o aceptar que el formato no encaja
con este objetivo.

**Cliente pide "lo más corto posible"** vs cadencia que el contenido
soporta [P2-meta-transversales]. Comprimir más allá de la cadencia
viable rompe modalidad [P2-idea-guion-patrones].

## Salida esperada

Tres datos:

- **Duración aproximada:** "[N min — rango si admite variantes]".
- **Ratio:** "[16:9 | 9:16 | 1:1]".
- **Modo de consumo asumido:** "[con audio default | silencioso default
  | LMS captivo]".
