---
decision: publicacion/07-metricas-plataforma
etapa: publicacion
pregunta: ¿Qué métricas de plataforma observas y cómo las interpretas?
fuentes:
  - P2-publicacion-metricas
  - P2-publicacion-antipatrones
  - P3-publicacion-analitica
  - P3-publicacion-plataformas
admite-variantes: false
varia-por-eje: [plataforma]
sync: 2026-04-20
version: 2
---

## Principio aplicable

**Las métricas de plataforma son proxies, no verdad del aprendizaje.**
Instrumentan comportamiento observable (click, view time, like) que
correlaciona imperfectamente con comprensión, retención y
transferencia. Útiles para iterar el packaging y el pacing; no
suficientes para medir si alguien aprendió.

**Benchmarks varían por nicho** [P2-publicacion-metricas]. Comparar
APV de tutorial técnico de 5 min con podcast de 90 min es error
categorial. Usar referencias del propio nicho.

## Casos (YouTube, proxies)

Herramientas para observar [P3-publicacion-analitica]: YouTube
Studio Analytics (nativo), TubeBuddy (deep-dive retention curves),
VidIQ (benchmarks vs canales similares del nicho).

- **Retention curve** [P2-publicacion-metricas]: caídas pronunciadas
  en 0-30s indican hook débil; caídas en mitad indican
  aburrimiento/confusión; **subidas** indican re-engagement
  spikes — momentos replicables en futuros videos.
- **APV (Average Percentage Viewed):** ≥40% saludable para contenido
  formativo >5 min. En divulgación-explainer referencia es 45-60%;
  tutorial técnico 35-50% [P2-publicacion-metricas].
- **Shorts view-rate:** 70-90% top-performing (Galloway). Para
  Shorts específicamente, no transferible a long-form.
- **Ratio views/subs ≥1.0:** indica que el video capta audiencia
  **más allá del Core** (CCN fit). <0.5 sugiere que solo fans
  comprometidos lo vieron.
- **CTR (Click-Through Rate):** 5-10% saludable en YouTube. <3%
  sugiere thumbnail+título débil; >15% puede ser clickbait
  (verificar con retention).

## Plataforma LMS (onboarding — NO comparable 1:1 con YouTube) [P3-publicacion-plataformas]

- **"Complete"** en LinkedIn Learning = 70% de reproducción.
  Política de plataforma, no heurística.
- **Completion microlearning (<5 min):** ~80% benchmark 2024-2025.
- **Completion long-form (≥30 min):** ~20% benchmark.
- **Completion gamified:** 90% vs 25% no-gamified (LMS Portals
  2024).

## Anti-patrón

**Optimizar solo APV sin medir aprendizaje real**
[P2-publicacion-antipatrones]: produce contenido entretenido que
no transfiere. APV alto + nada aprendido = video popular inútil
como formación.

**Confundir completion LMS con APV YouTube:** error categorial.
Reportar "mi curso tiene 80% completion" al lado de "mi video
tiene 40% APV" induce a comparar cosas incomparables.

**Reaccionar a métricas de 1 video** (especialmente <1 semana
post-publicación): muestra insuficiente. Esperar 7-14 días para
iterar decisiones de packaging; 30+ días para iterar formato.

## Heurística numérica

- **Ventana mínima para evaluar:** 7 días post-publicación
  (captura la mayoría del tráfico inicial + primera ola de
  recommendations).
- **Caída de retention 0-30s >30% del inicial:** hook débil,
  acción = regenerar thumbnail o editar intro.
- **APV <35%** por más de 2 semanas: considerar editar (acortar
  intro, mejorar hook) o documentar aprendizaje para el siguiente.
- **Re-engagement spike con delta >15%:** ese momento es oro —
  identificar qué pasó ahí y replicar el patrón.

## Ajuste por eje

### Por `plataforma`

- **`long-form-horizontal`:** retention curve, APV, CTR, sources, watch time. YouTube Studio.
- **`shorts-vertical`:** view-rate 70-90% benchmark, swipe-away rate, re-watches.
- **`podcast-audio-primario`:** play-through rate, drop-off por capítulo (Spotify Analytics), listens totales.
- **`live-with-vod`:** viewers concurrentes, avg session, chat activity (Twitch); VOD metrics aparte.
- **`corporate-lms`:** completion rate (70% visto = "complete" en LinkedIn Learning), quiz scores, time-to-complete. NO comparables con YouTube.

## Conflictos conocidos

Ninguno.

## Salida esperada

- Plan de métricas: cuáles vas a observar, en qué ventana
  temporal, qué benchmarks usás como referencia.
- Threshold de acción: a qué número vas a editar / regenerar /
  documentar como aprendizaje.
- Fuente de datos (YouTube Studio, TubeBuddy, VidIQ, LMS) y
  cadencia de revisión.
