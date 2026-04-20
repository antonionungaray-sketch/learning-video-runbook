---
decision: grabacion/01-audio
etapa: grabacion
pregunta: ¿Qué micrófono, qué ganancia, qué tratamiento acústico del espacio?
fuentes:
  - P1-§5.4                    # voz cálida y prosódicamente natural
  - P1-§2.3-#11                # voz humana supera a sintética
  - P1-§2.3-#1                 # coherencia (música de fondo bajo voz)
  - P2-preprod-patrones        # audio mono limpio >> video 4K con audio malo
  - P2-preprod-antipatrones    # música de fondo sobre voz
  - P3-preprod-audio           # micro dinámico USB de gama media
  - P3-modalidades-podcast     # setup multi-mic para podcast
  - P3-modalidades-documental  # iZotope RX + restauración audio
admite-variantes: false
varia-por-eje: [rol-presentador]
sync: 2026-04-20
version: 2
---

## Principio aplicable

**Audio es el upgrade de mayor retorno por unidad de inversión**
[P2-preprod-patrones] [P3-preprod-audio]. La audiencia perdona pixelación
pero no audio sucio — ruido de fondo, clipping, reverberación excesiva
o nivel inconsistente degradan la inteligibilidad de la narración y
por tanto el aprendizaje.

**Voz cálida y prosódicamente natural** [P1-§5.4] [P1-§2.3-#11]: el
micrófono y el tratamiento acústico deben preservar la prosodia del
creador — comprensión del sentido sufre más con audio plano/robótico
que con micro de gama media bien usado.

## Casos

- **Dinámico USB de gama media** [P3-preprod-audio]: Shure MV7, Samson
  Q9U, Rode PodMic USB. Rechaza ruido de fondo por diseño (patrón
  cardioide + respuesta limitada), funciona en espacios no tratados,
  plug-and-play. Upgrade con mayor retorno por $.
- **Condensador + tratamiento acústico:** Blue Yeti, AT2020 USB y
  similares. Mejor claridad pero capturan todo — exige cuarto tratado
  con paneles absorbentes o grabar de noche. Riesgo para principiantes.
- **Lavalier cableado/inalámbrico:** Rode Wireless GO, Sennheiser MKE.
  Útil si grabas moviéndote o a cierta distancia del setup principal.
  Menor retorno que dinámico USB para el uso típico sentado en el
  escritorio.
- **Audio del atlas:** ningún creator del atlas (Fireship, Primeagen,
  Midudev, 3B1B, Kurzgesagt, Veritasium, etc.) usa audio sucio. Es
  patrón universal [P2-preprod-patrones].

## Anti-patrón

**Usar el micrófono del portátil o de webcam** para contenido
publicable. Noise floor alto, latencia hacia mini-mix del portátil,
coloreado nasal. Hasta el dinámico USB más barato ($70) es
cualitativamente superior.

**Música de fondo durante narración crítica** [P2-preprod-antipatrones]:
viola coherencia [P1-§2.3-#1] y degrada inteligibilidad. Observable por
ausencia en los 10 videos del atlas.

**Grabar en espacio reverberante sin intentar tratamiento mínimo.**
Cerrar puertas/ventanas, colgar una manta detrás del mic como barrera,
ponerse cerca del micro (5-20cm) — mitigaciones de $0 con impacto real.

## Heurística numérica

- **Niveles de grabación:** picos **-6 a -3 dB** (headroom para evitar
  clipping), promedio de voz **~-18 dB** (nominal broadcast).
- **Distancia al micro dinámico:** 5-15 cm, off-axis 15° para evitar
  plosivas sin filtro pop.
- **Noise floor objetivo:** ≤ -60 dBFS en silencios (aire acondicionado,
  ventilador de PC, tráfico).
- **Sample rate:** 48 kHz, 24-bit para producción; 16-bit suficiente
  para podcasting.

## Ajuste por eje

### Por `rol-presentador`

- **`experto-neutral`:** 1 mic dinámico USB gama media (Shure MV7, Samson Q9U, Rode PodMic USB) sobre voz en estudio controlado. LUFS target -14 (YT) / -16 (podcast) / -23 (EBU R128).
- **`narrador-1a-persona`:** mismo setup que experto-neutral. En re-grabación de voice-over (Nerdwriter), booth tratado acústicamente o blanket-fort. Tomas múltiples para elegir.
- **`narrador-omnisciente`:** grabación de voice-over post (no en cámara). Sesión de booth con director + revisión; suele ir a estudio profesional cuando el budget lo permite.
- **`investigador` on-location:** lavalier clip-on + recorder portátil (Zoom H6) + shotgun de respaldo. Ambiente no controlable — priorizar claridad sobre "quality". Editar noise reduction con iZotope RX [P3-modalidades-documental].
- **`demostrador`:** 1 mic dinámico cerca de la boca (SM7B con Cloudlifter ideal) + aislamiento del ruido del teclado/trackpad. Gaming mouse movement es fuente típica de ruido.
- **`conversador` / `anfitrion-de-experto`:** multi-mic (1 por persona) + consola tipo Rodecaster Pro II o interfaz multi-canal; grabación multitrack para editar cada voz independiente. Remoto: Riverside.fm o SquadCast (graban local en cada extremo). Ver [P3-modalidades-podcast].

## Conflictos conocidos

Ninguno.

## Salida esperada

- Micrófono elegido + modelo específico.
- Niveles de prueba grabados y verificados (pico, promedio, noise
  floor).
- Estrategia de tratamiento del espacio (cerrar puertas, manta,
  distancia al mic, horario de grabación).
- Sample rate + bit depth de captura.
