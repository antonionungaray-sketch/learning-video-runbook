# Pilar 3 — Herramientas para producción de video explainer

> **Naturaleza dinámica.** Este documento lista herramientas vigentes para cada etapa del flujo. El status, las alternativas y el pricing cambian constantemente. Cada item lleva fecha de última verificación.
>
> **Agnóstico de hardware.** El toolkit no asume un sistema operativo, GPU o stack específico. Donde una herramienta tiene requisitos restrictivos, se anota. Las decisiones específicas del setup personal del creador van en la documentación de su propio proyecto, no aquí.
>
> **Cómo se actualiza.** Manualmente con asistencia: el skill `update-tools` busca releases recientes, deprecations y alternativas, resume y propone cambios para tu aprobación.

---

## Frescura

| Sección | Última revisión |
|---|---|
| Global | 2026-04-17 (creación) · 2026-04-18 (ampliación IA-forward) · 2026-04-19 (modalidades ampliadas v2) |
| Idea → Guión | 2026-04-17 |
| Pre-producción y grabación | 2026-04-18 |
| Edición y post | 2026-04-18 |
| Publicación y medición | 2026-04-17 |
| Modalidades ampliadas (live, podcast, documental, data viz) | 2026-04-19 |

---

## Idea → Guión [P3-idea-guion]

### Asistentes de escritura [P3-idea-guion-asistentes]
- **Claude / GPT** — generación y refinado de guiones, brainstorm de hooks, conversión bullet→prosa hablada. *Status: estable. Verificado: 2026-04-17.*
- **Notion / Obsidian / plain Markdown** — almacenamiento y versionado de guiones. Markdown es el formato más portátil y diff-friendly.

### Investigación y validación [P3-idea-guion-investigacion]
- **Perplexity / Claude con WebSearch** — investigación rápida con citaciones.
- **Google Scholar** — verificar claims científicos antes de afirmar algo en un explainer.

### Cuándo elegir qué
- Para tutoriales técnicos: editor Markdown plano + asistente IA para refinar.
- Para formación corporativa: idem + plantillas estructuradas (objetivo de aprendizaje, audiencia, pre-requisitos, evaluación).

---

## Pre-producción y grabación [P3-preprod]

### Captura de pantalla y cámara [P3-preprod-captura]
- **OBS Studio** — open source, cross-platform, scenes, encoders por hardware. Status: estable, líder de facto en captura.
- **Loom / Riverside / Descript Recorder** — capturas rápidas, sincronización a la nube. Mejor para sesiones cortas o entrevistas remotas.
- **Streamlabs Desktop** — fork de OBS con UI más amigable; menos flexible para casos avanzados.

### Audio [P3-preprod-audio]
- **Micrófono dinámico USB de gama media** (Shure MV7, Samson Q9U, Rode PodMic USB) — el upgrade técnico con mayor retorno por unidad de inversión en producción audiovisual.
- **Audacity** — edición y limpieza de audio offline, gratuito.
- **Krisp / NVIDIA Broadcast** — supresión de ruido en vivo (requisitos de hardware).

### Iluminación [P3-preprod-iluminacion]
- **Cualquier panel LED bicolor con difusor** — el principio importa más que la marca: luz suave, frontal, balance de blancos consistente.

### Teleprompter y corrección de mirada IA [P3-preprod-teleprompter]
- **Descript — teleprompter + Eye Contact AI** — teleprompter integrado + corrección de mirada en post; el presentador puede leer guion mirando ligeramente desviado y la IA reorienta el ojo a cámara sin deformar parpadeo/expresión. *Status: estable. Verificado: 2026-04-18.*
- **BIGVU** — mobile-first, teleprompter + Eye Contact Fix + auto-captions + Brand Kit en una sola app. Útil para grabación on-the-go sin setup de estudio. *Status: estable. Verificado: 2026-04-18.*
- **Cuándo elegir qué.** Presencia humana en cámara + guion leído: sin estas herramientas el espectador percibe lectura subconscientemente (mirada ligeramente fuera de eje). Descript encaja si ya se edita con transcripción; BIGVU si se graba desde móvil. Si la toma es puramente captura de pantalla sin cara, este bloque no aplica.

### Cuándo elegir qué
- Tutorial técnico de software: OBS + micrófono USB es suficiente. No requiere cámara.
- Formación corporativa con presencia en cámara: OBS o Riverside + micrófono USB + iluminación frontal + cámara webcam decente o réflex/mirrorless con captura HDMI.

---

## Edición y post [P3-edicion]

### Editores de video [P3-edicion-editores]
- **DaVinci Resolve** — gratuito (versión Studio de pago), nivel profesional. Requiere GPU competente.
- **Kdenlive** — open source, multiplataforma, trabaja bien sin GPU dedicada.
- **Adobe Premiere Pro** — estándar industrial, suscripción mensual.
- **CapCut Desktop** — edición rápida con plantillas, fuerte para formatos cortos verticales.
- **Descript** — edición de video editando la transcripción de texto. Excelente para contenido hablado.

### Composición programática [P3-edicion-composicion]
- **Remotion** — videos como código React. Ideal para variaciones masivas desde datos, lower thirds, intros dinámicos. *Nota de licencia: gratuita para uso individual/personal pero requiere licencia comercial para empresas con ≥3 personas.* *Status: estable. Verificado: 2026-04-18.*
- **Motion Canvas** — MIT, TypeScript con generator functions, scene graphs, editor en tiempo real. Diseñado para explainers animados hechos a mano al estilo 3Blue1Brown pero con tooling moderno. Alternativa libre a Remotion sin fricción de licencia. *Status: estable. Verificado: 2026-04-18.*
- **Revideo** — MIT, fork de Motion Canvas con rendering headless + server-side + sistema de templates. Pensado para pipelines de producción automatizada (generar decenas/miles de videos desde datos). *Status: estable. Verificado: 2026-04-18.*
- **HyperFrames (HeyGen)** — Apache 2.0, compone video vía HTML/CSS/JS y está diseñado para que agentes IA (p. ej. Claude Code) editen video con primitivas web estándar. Complementa a Remotion cuando la pipeline está orquestada por agentes más que por devs humanos. *Status: nuevo/cambia rápido. Verificado: 2026-04-18.*
- **Manim** — animación matemática estilo 3Blue1Brown.
- **Cuándo elegir qué.** Remotion si ya hay stack React y el licenciamiento no es problema; Motion Canvas / Revideo si necesitas open-source sin ataduras o si el equipo supera 3 personas; HyperFrames si el flujo es orquestado por un agente IA; Manim solo para matemáticas formales.

### Post-procesado puntual [P3-edicion-postproc]
- **FFmpeg** — el cuchillo suizo de procesamiento de video. Cortar, normalizar, transcoder, generar thumbnails. Imprescindible aprender mínimos comandos.
- **Handbrake** — front-end gráfico de FFmpeg para conversiones masivas.

### Subtítulos [P3-edicion-subtitulos]
- **Whisper (OpenAI) local o vía API** — transcripción automática multilenguaje, base de subtítulos. *Status: estable. Verificado: 2026-04-18.*
- **WhisperX** — wrapper open-source sobre Whisper con *diarization* multi-speaker y *word-level alignment*. Imprescindible cuando hay más de una voz (entrevistas, paneles, pair coding) o se necesitan subtítulos sincronizados palabra-a-palabra para captions kinetic. *Status: estable. Verificado: 2026-04-18.*
- **Aegisub** — editor de subtítulos profesional (timing, estilo SRT/ASS).
- **Subtitle Edit** — alternativa Windows con buena UX.

### Voiceover IA [P3-edicion-voiceover]
- **ElevenLabs** — voces realistas, clonación de voz, multilenguaje. Tier gratuito limitado. **Dubbing Studio** (add-on): traduce y redobla audio en 32+ idiomas conservando las características de voz del hablante original. Útil para internacionalizar un training existente sin regrabar. *Status: estable. Verificado: 2026-04-18.*
- **Coqui TTS** / **Piper** — open source, ejecución local, calidad menor pero suficiente para borradores.

### Cuándo elegir qué
- Tutorial técnico de bajo presupuesto: Kdenlive + FFmpeg + Whisper.
- Formación corporativa con muchas variaciones: Remotion + ElevenLabs.
- Edición rápida de hablado: Descript.

---

## Publicación y medición [P3-publicacion]

### Plataformas [P3-publicacion-plataformas]
- **YouTube** — ecosistema más maduro para contenido formativo largo. Analytics detallados.
- **Vimeo** — alternativa para alojamiento privado, mejor calidad de transcoding por defecto.
- **Loom Library** — para conocimiento interno corporativo.
- **LMS corporativos** (Synthesia, Articulate, TalentLMS, Moodle) — entornos completos de formación con tracking de progreso y evaluaciones.

### Análisis y métricas [P3-publicacion-analitica]
- **YouTube Studio Analytics** — retention curves, APV, CTR, sources.
- **TubeBuddy / VidIQ** — auditoría de SEO de video, A/B testing de thumbnails.
- **Hotjar / FullStory** (para video embebido en sitio propio) — mapas de calor sobre interacción.

### Thumbnails y arte [P3-publicacion-thumbnails]
- **Figma / Canva** — composición rápida con plantillas.
- **Photopea** — alternativa gratuita web a Photoshop.
- **Generadores IA de imagen** (Midjourney, DALL·E, Imagen) — base para thumbnails creativos.

### Cuándo elegir qué
- Contenido público abierto: YouTube + TubeBuddy.
- Formación interna: LMS corporativo + Loom.
- Auditoría de mejora continua: YouTube Studio + comparación con histórico.

---

## Modalidades ampliadas — herramientas específicas [P3-modalidades]

> **Estado:** 2026-04-19. Fase 3 de la reforma agregó cobertura para modalidades que la versión base no atendía — live streaming, podcast audiovisual multi-mic, documental narrativo con color/sonido avanzados, periodismo de datos con data viz programable.

### Live streaming educativo [P3-modalidades-live]

Setup para `modalidad: live-stream-educativo` (ejes: zero edit + improvisado + demostrador). La decisión técnica dominante es **capturar, mostrar, interactuar** en tiempo real sin post.

- **OBS Studio** — ya listado en [P3-preprod-captura]; es la base del streaming open source. Configuración típica live incluye 2-3 escenas (intro / código / stand-up) + transiciones + browser sources (chat overlay, alerts). *Status: estable. Verificado: 2026-04-19.*
- **Stream Deck (Elgato)** — controlador físico de 6-32 botones programables. Cambia escenas, activa alertas, inicia/pausa grabación sin salir del foco técnico. Integraciones nativas con OBS. *Status: estable. Verificado: 2026-04-19.*
- **StreamYard** — SaaS cloud-based para streaming multi-plataforma simultáneo (YouTube + Twitch + LinkedIn). Fortalece entrevistas remotas con invitados sin setup técnico propio. *Status: estable. Verificado: 2026-04-19.*
- **Restream** — análogo a StreamYard con foco en multi-destination; útil cuando el creator sube el mismo stream a 5+ plataformas. *Status: estable. Verificado: 2026-04-19.*
- **Cuándo elegir qué.** OBS + Stream Deck para streamer técnico solo (ThePrimeagen, Muratori-style). StreamYard/Restream para podcast en vivo con invitados o conferencias híbridas. Claude Code live debugging / pair coding: OBS + Stream Deck son la norma.

### Podcast audiovisual multi-mic [P3-modalidades-podcast]

Setup para `modalidad: podcast-audiovisual-educativo` (ejes: light edit + improvisado + anfitrion-de-experto). Dos o más hablantes en mismo estudio o remotos; audio es primario, video secundario.

- **Rodecaster Pro II** — consola de audio dedicada a podcast, 4 canales mic con procesado on-device (compresión, EQ, noise gate), multitrack USB al DAW. Estándar de facto en podcast audiovisual 2024-2025. *Status: estable. Verificado: 2026-04-19.*
- **Shure SM7B + interfaz con Cloudlifter** — micrófono dinámico de referencia para voz hablada en estudio. SM7B requiere preamp con alto gain (Cloudlifter agrega +25dB limpios). Usado por Lex Fridman, Huberman, Rogan. *Status: estable. Verificado: 2026-04-19.*
- **Zoom H6 / H8** — grabador portátil multi-pista para podcast on-location o backup simultáneo a la consola. 4-8 XLR + phantom + SD card. *Status: estable. Verificado: 2026-04-19.*
- **Riverside.fm** — SaaS de grabación multi-participante remota, graba localmente en cada extremo (no comprimido por Zoom/Meet) y sube al cloud. Salida multi-track + video por cámara. *Status: estable. Verificado: 2026-04-19.*
- **SquadCast (ahora Descript)** — análogo a Riverside, integración nativa con edit-by-transcription de Descript. *Status: estable (adquirido por Descript 2023). Verificado: 2026-04-19.*
- **Cuándo elegir qué.** In-studio multi-mic: Rodecaster Pro II + SM7B. Remoto con invitados: Riverside o SquadCast (evitar Zoom/Meet — comprimen audio). On-location entrevista única: Zoom H6 portátil + shotgun + lav. El video 4K multi-cam (estilo Lex Fridman) se suma *encima* de este audio baseline; invertir el orden produce episodios visualmente pulidos con audio amateur.

### Documental narrativo — color grading, mezcla y edición avanzada [P3-modalidades-documental]

Setup para `modalidad: documental-narrativo-pedagogico` (ejes: heavy edit + guionado + narrador-omnisciente). La especificidad viene en **color, sonido mezclado cinematográficamente y gestión de archivo**.

- **DaVinci Resolve Studio** — ya listado en [P3-edicion-editores]; en el contexto documental importa especialmente **Color Page** (color grading profesional con curves, qualifiers, tracker, Power Windows) y **Fairlight Page** (mix-to-picture con bus routing y ADR). La versión Studio (pago único ~$295) desbloquea neural engine, surround, noise reduction. *Status: estable. Verificado: 2026-04-19.*
- **Pro Tools (Avid)** — DAW estándar industrial para mezcla cinematográfica y doblaje. Usado en post-producción de documentales de difusión. Suscripción. *Status: estable. Verificado: 2026-04-19.*
- **iZotope RX** — suite de restauración de audio (noise removal, dialogue isolation, de-click). Imprescindible para documental con archivo de audio degradado. *Status: estable. Verificado: 2026-04-19.*
- **Kyno / Post Haste / Adobe Bridge** — gestión de archivo y metadata. Documental largo con cientos de horas de raw footage requiere sistema de logging + transcripción + tagging desde el inicio. *Status: estable. Verificado: 2026-04-19.*
- **Cuándo elegir qué.** DaVinci Resolve Studio cubre ~90% del pipeline documental en un solo tool (edición + color + Fairlight). Pro Tools sólo cuando el mix va a cine/broadcast con estándares Dolby Atmos. iZotope RX es obligatorio en cualquier documental con archivo; skip produce audio sucio imposible de rescatar en mezcla final.

### Periodismo de datos y data viz programable [P3-modalidades-data-viz]

Setup para `modalidad: periodismo-analitico-visual` (ejes: heavy edit + guionado + investigador). La especificidad es **visualización de datos narrativos, no dashboards**.

- **Flourish** — SaaS web-based para crear charts y scrollytelling interactivos. Formato "explainable visualization" con plantillas (bar chart races, maps, networks, Gantt). Exporta video o HTML interactivo. Usado ampliamente en periodismo visual. *Status: estable. Verificado: 2026-04-19.*
- **Datawrapper** — análogo a Flourish con foco en charts publication-ready rápidos (sin interactividad compleja). Estándar en newsrooms. Integración nativa con CMS. *Status: estable. Verificado: 2026-04-19.*
- **After Effects + Data-Driven Animation (expressions, JSON input)** — permite alimentar animaciones AE desde un JSON con datos, generando animaciones de datos programáticas (bar chart races, trayectorias). *Status: estable. Verificado: 2026-04-19.*
- **Lottie (dotLottie)** — formato de animación vectorial JSON exportable desde After Effects o Rive. Ligero para web + video; útil para data viz animada que se inserta en edit final. *Status: estable. Verificado: 2026-04-19.*
- **Mapbox / Mapbox Studio** — mapas custom con zoom animado, capas temáticas, estilos programables. Usado por Johnny Harris, Vox Atlas, Bloomberg Originals. *Status: estable. Verificado: 2026-04-19.*
- **D3.js / Observable** — librería JavaScript para data viz web programable. Observable es notebook-based y facilita prototipado + export a video via headless rendering. *Status: estable. Verificado: 2026-04-19.*
- **Cuándo elegir qué.** Flourish para charts rápidos con plantillas. Datawrapper para charts publication-grade embebidos. AE + JSON cuando la anim es parte del montaje de video heavy-edit (Kurzgesagt-style, Johnny Harris). Mapbox para cualquier video con mapas como elemento estructural. D3 cuando se necesita control total y hay dev con skills front-end.

---

## Fuentes para revisar al actualizar

*(Lista que el skill `update-tools` consulta)*

- Release notes oficiales de cada herramienta listada
- Product Hunt y Hacker News para alternativas emergentes
- Reddit r/videography, r/editors, r/instructionaldesign
- Newsletters: TLDR Marketing, Stratechery, Ben's Bites para herramientas IA
- Reportes anuales de stack del creador (Tubebuddy State of Creator)
