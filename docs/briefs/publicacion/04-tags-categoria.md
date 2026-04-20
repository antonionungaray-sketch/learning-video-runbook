---
decision: publicacion/04-tags-categoria
etapa: publicacion
pregunta: ¿Cómo categorizar para que la plataforma muestre a la audiencia correcta?
fuentes:
  - P2-publicacion-patrones
  - P2-ficha-fireship
  - P2-ficha-theprimeagen
  - P2-ficha-mouredev
  - P2-ficha-midudev
  - P2-ficha-coding-train
  - P2-ficha-veritasium
  - P2-ficha-3b1b
  - P2-ficha-kurzgesagt
  - P2-ficha-quantumfracture
  - P3-publicacion-analitica   # TubeBuddy / VidIQ
  - P3-publicacion-plataformas # categorías YouTube / Vimeo / LMS
admite-variantes: false
varia-por-eje: [plataforma]
sync: 2026-04-20
version: 2
---

## Principio aplicable

**Tags y categoría son señales débiles al algoritmo**, no
determinantes. YouTube 2020+ dio más peso al título, descripción y
retention que a los tags; VidIQ y TubeBuddy siguen siendo útiles
como investigación pero el ROI es menor que optimizar thumbnail o
hook.

**Categoría correcta importa más que tags exhaustivos.** "Science
& Technology" para tutorial técnico vs "Education" cambia el grupo
de recomendaciones inicial. Error de categoría → audiencia mal
calibrada → retention cae → algoritmo reduce distribución.

## Casos

- **Tutorial técnico software** [P3-publicacion-plataformas]: categoría
  YouTube "Science & Technology" (ID 28) o "Education" (ID 27) —
  depende del nicho exacto. Fireship [P2-ficha-fireship] /
  Primeagen [P2-ficha-theprimeagen] → Science & Tech;
  MoureDev [P2-ficha-mouredev] / Midudev [P2-ficha-midudev] /
  Coding Train [P2-ficha-coding-train] → Education.
- **Divulgación de ciencia:** "Science & Technology" (28).
  Veritasium [P2-ficha-veritasium], 3B1B [P2-ficha-3b1b],
  Kurzgesagt [P2-ficha-kurzgesagt], QuantumFracture
  [P2-ficha-quantumfracture].
- **Onboarding corporativo:** fuera de YouTube público típicamente;
  el LMS no usa "categorías de plataforma" sino taxonomía interna
  (role, tema, compliance vs skill-building).
- **Herramientas de investigación** [P3-publicacion-analitica]:
  TubeBuddy (Keyword Explorer), VidIQ (Competitor tags) para ver
  qué usan los canales del nicho. Gratuito/tier bajo suficiente.

## Anti-patrón

**Spam de tags irrelevantes** para capturar trending searches:
plataforma detecta y castiga en distribución.

**Categoría "Entertainment" para contenido educativo:** error de
señal; el algoritmo lo mezcla con gaming/vlogs.

**Copiar tags de un video viral del nicho sin relevancia real:** no
suma; puede restar si la señal es inconsistente con el contenido.

## Heurística numérica

- **Número de tags:** 8-15 típicamente. Más es spam percibido.
- **Orden:** el primer tag pesa más — poner el más específico y
  relevante primero.
- **Combinación de granularidad:** mezcla de tags amplios
  ("programming", "tutorial") + específicos ("bun install", "bun
  runtime") + long-tail ("how to install bun for node developers").

## Ajuste por eje

### Por `plataforma`

- **`long-form-horizontal`:** tags YouTube (8-15, mix anglo+español), categoría oficial ("Education", "Science & Technology", "Howto & Style").
- **`shorts-vertical`:** hashtags #shorts + tema (5-10); menos peso que long-form.
- **`podcast-audio-primario`:** categorías Spotify/Apple Podcasts ("Technology", "Science", "Education"). Sin tags equivalentes.
- **`corporate-lms`:** taxonomía interna del LMS (curso / módulo / nivel / departamento). Sin algoritmo de discovery.

## Conflictos conocidos

Ninguno.

## Salida esperada

- Categoría elegida (con ID de plataforma si aplica).
- Lista de 8-15 tags ordenados por relevancia (el más específico
  primero).
- Nota de investigación si se usó TubeBuddy/VidIQ (qué canales de
  referencia se miraron).
