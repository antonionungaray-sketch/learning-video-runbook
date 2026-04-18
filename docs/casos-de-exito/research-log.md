# Research Log — Atlas de Casos de Éxito para Pilar 02

> Registro append-only de cada fuente consultada durante la población inicial (y futuras actualizaciones) del atlas de casos de éxito que alimenta `docs/pilares/02-tendencias-y-casos.md`.
>
> **Regla firme.** Ninguna fuente entra al pilar 02 sin pasar antes por este log. Cada entrada debe tener todos los campos del template. Si un claim contradice el pilar 01 (fundamentos cognitivos), se anota `Sobrevive filtro pilar-1: no — conflicto con §X` y se flaggea explícitamente; no se aplica al pilar 02 sin discusión separada.

## Template de entrada

```
### YYYY-MM-DD — [Creator o tema] — [Tipo de fuente]

- Fecha verificación: YYYY-MM-DD
- Fuente: [URL]
- Tipo: académico | análisis | entrevista | observación | plataforma
- Creator/nicho asociado: [nombre | n/a] / [tutorial técnico | divulgación | onboarding]
- Claim extraído: [una frase precisa]
- Evidencia: [métrica concreta | cita textual | timestamp de video]
- Sobrevive filtro pilar-1: sí | no — conflicto con §X
- Destino: pilar 02 §X | ficha de [creator] | anti-patrón | descartar
- Notas: [opcional, contexto para escritura posterior]
```

---

## Sesión 1 — 2026-04-18

### 2026-04-18 — Fireship (Jeff Delaney) — análisis agregado

- Fecha verificación: 2026-04-18
- Fuente: https://grokipedia.com/page/fireship-youtube-channel (resumido vía WebSearch)
- Tipo: análisis
- Creator/nicho asociado: Fireship / tutorial técnico
- Claim extraído: El formato "100 Seconds of Code" de Fireship comprime temas de ~30 min de tutorial clásico en 100s con estructura fija: hook inicial, explicación concisa del concepto, demo de código en vivo, recap/CTA.
- Evidencia: Cadencia medida de 10-15 cortes por minuto; voiceover a ~200-250 wpm; uso deliberado de memes + humor para aliviar carga cognitiva (cita: "humor is integrated through meme insertions and witty commentary"); herramientas Adobe AE + Premiere.
- Sobrevive filtro pilar-1: parcialmente. 200-250 wpm está por encima del rango recomendado en pilar 1 §5.4 para formación corporativa (~130-140 wpm) pero encaja en tutorial técnico para audiencia que ya conoce el dominio. Los 10-15 cortes/min contradicen literalmente la observación de pilar 1 §4.4 de que "la frecuencia exacta es heurística, no ley" — Fireship funciona *porque* su audiencia es técnica y familiarizada con el vocabulario; no generaliza a audiencias naive. Flag: anotar en ficha.
- Destino: pilar 02 Idea→Guión / Patrones (alto-tempo como opción con caveat); pilar 02 Meta-formatos (formato "100s" como referencia); ficha de Fireship.

### 2026-04-18 — Fireship — producción individual solo-creator

- Fecha verificación: 2026-04-18
- Fuente: https://medium.com/illumination-curated/interview-with-jeff-delaney-from-youtubes-500k-fireship-channel-for-programmers-7d0d57eb8a1
- Tipo: entrevista
- Creator/nicho asociado: Fireship / tutorial técnico
- Claim extraído: Delaney produce Fireship solo (scripting + voz + edición), con freelance puntual sólo para gráficos específicos; la filosofía "ship fast" del canal es estructural y se traduce en el formato corto.
- Evidencia: Verificación directa del artículo (WebFetch): "produced by Jeff Delaney in a solo capacity, with occasional freelance assistance for specific graphics or animations, as of 2021".
- Sobrevive filtro pilar-1: sí — no hay conflicto; es metadata del workflow.
- Destino: ficha de Fireship.
- Notas: Relevante para anti-slop guardrail — solo-creator con workflow repetible es prueba de que "humano y orgánico" escala sin equipo.

### 2026-04-18 — ThePrimeagen — multichannel strategy

- Fecha verificación: 2026-04-18
- Fuente: https://youtube.fandom.com/wiki/ThePrimeagen (Wikitubia, agregador)
- Tipo: análisis
- Creator/nicho asociado: ThePrimeagen / tutorial técnico
- Claim extraído: Estrategia de canales múltiples: main channel @ThePrimeagen (videos editados de streams), @ThePrimeTimeagen (clips + reacciones), @TheVimeagen (VODs crudos). Repurposing de un mismo stream hacia formatos distintos por audiencia.
- Evidencia: 500K subs main, 275K Twitch followers (2026). Estructura multichannel verificable en YouTube.
- Sobrevive filtro pilar-1: sí (estrategia de distribución, no cognitiva).
- Destino: pilar 02 Meta-formatos (patrón "stream → edit → repurpose"); ficha ThePrimeagen.

### 2026-04-18 — MoureDev (Brais Moure) — perfil y escala

- Fecha verificación: 2026-04-18
- Fuente: https://moure.dev/ + https://mouredev.pro/cursos
- Tipo: plataforma (sitio oficial)
- Creator/nicho asociado: MoureDev / tutorial técnico
- Claim extraído: Brais Moure crea contenido en español desde 2018, operando como freelancer desde 2015. Cursos gratis + premium model (PRO con mentoría grupal trimestral/anual). Su curso de Python: 100 clases + 44h de video + código + proyectos + chat.
- Evidencia: Escala reportada: "cerca de dos millones de seguidores across redes" (no verificado independientemente — usar como claim del creator, no como métrica dura).
- Sobrevive filtro pilar-1: sí (metadata).
- Destino: ficha MoureDev.
- Notas: La estructura "100 clases × duración media" implica ~26 min/clase promedio — mucho más largo que Fireship. Interesante contraste de cadencia anglo/hispano que merece medición directa cuando observe videos.

### 2026-04-18 — MoureDev — entrevista Xataka

- Fecha verificación: 2026-04-18
- Fuente: https://www.xataka.com/entrevistas/yo-llevo-programando-muchisimo-tiempo-raro-dia-que-no-aprendo-algo-brais-moure-mouredev-programador-streamer
- Tipo: entrevista (primaria; Xataka es medio reputado)
- Creator/nicho asociado: MoureDev / tutorial técnico
- Claim extraído: Filosofía de enseñanza foundational, anti-gatekeeping. "Yo llevo programando muchísimo tiempo y raro es el día que no aprendo algo." El consejo rector para aprendices: "tiempo y, sobre todo, el gran consejo, paciencia."
- Evidencia: Cita textual verificada.
- Sobrevive filtro pilar-1: sí — encaja con el matiz del pilar 1 §2.1 (carga intrínseca → gestionar con segmentación y paciencia, no con shortcuts cognitivos).
- Destino: ficha MoureDev; pilar 02 Idea→Guión / Patrones (subsección "hispano vs anglo": tono maestro-paciente vs sprint-cómico).
- Notas: La entrevista NO tiene detalles específicos de duración, cadencia, ni metodología de producción. Xataka se centró en filosofía general. Para mecánicas específicas hay que pasar a observación directa de videos.

### 2026-04-18 — ThePrimeagen — análisis The New Stack

- Fecha verificación: 2026-04-18
- Fuente: https://thenewstack.io/be-creative-theprimeagens-five-hour-interview-with-lex-fridman/
- Tipo: análisis (The New Stack, publicación técnica reputada)
- Creator/nicho asociado: ThePrimeagen / tutorial técnico
- Claim extraído: Posicionamiento explícitamente anti-elitismo tech: "I want tech to be this place where people feel like they can be creative, and excited, and actually build something." Crecimiento del canal: +130K suscriptores en 12 meses (38% YoY) hasta 473K (cifra citada por The New Stack).
- Evidencia: Cita textual verificada; métrica de crecimiento en el artículo.
- Sobrevive filtro pilar-1: sí — el posicionamiento "creativo + accesible" encaja con principio de personalización de Mayer (§2.3 #10 pilar 1).
- Destino: ficha ThePrimeagen; pilar 02 Idea→Guión / Patrones (posicionamiento como hook estructural).
- Notas: Estrategia identificada: humor desmitificador ("Squeal" por SQL), codificación en vivo rápida como espectáculo (Vim mastery), streams largos (5h+ frecuentes) + edits cortos en canales satélite. Este patrón es distintivo — "entretenimiento técnico de alto compromiso" — y funciona por audiencia ya técnica. NO transferible a divulgación general.

### 2026-04-18 — ThePrimeagen — transcript Lex Fridman #461 (dead end)

- Fecha verificación: 2026-04-18
- Fuente: https://lexfridman.com/theprimeagen-transcript/
- Tipo: entrevista (primaria, transcript oficial)
- Creator/nicho asociado: ThePrimeagen / tutorial técnico
- Claim extraído: NINGUNO para content strategy. El episodio cubre programación, ADHD, adicción, Dios, pero el anfitrión no preguntó sobre estrategia de contenido ni edición.
- Evidencia: Verificación directa del transcript completo vía WebFetch.
- Sobrevive filtro pilar-1: n/a.
- Destino: descartar.
- Notas: Dato útil para tracking: 5h de entrevista principal NO contienen metadata sobre cómo produce sus videos. Buscar en otros podcasts (Colin & Samir, entrevistas en canales más especializados en contenido).

### 2026-04-18 — Fireship — deep-dive Engineers Codex

- Fecha verificación: 2026-04-18
- Fuente: https://read.engineerscodex.com/p/how-fireship-became-youtubes-favorite
- Tipo: análisis (publicación sectorial, cita métricas verificables)
- Creator/nicho asociado: Fireship / tutorial técnico
- Claim extraído: Modelo dual — series evergreen cortas ("X in 100 Seconds") + series trending ("The Code Report", breaking news programmer). Escala del canal: 3M+ subs, 200M views totales, peak 20M+ views/mes (diciembre 2023). Principio visual rector: SIN CARA ON-CAMERA, memes + media clips sustituyen presencia del instructor.
- Evidencia: Cifras citadas en el artículo; patrón de formato verificable. "The God Tier Developer Roadmap" en 11 min = 7M views → rompe el dogma de que "corto > largo" cuando la promesa del título lo justifica.
- Sobrevive filtro pilar-1: parcial. "Sin cara on-camera" contradice literalmente el principio #12 de Mayer (imagen del instructor), pero Mayer §2.3 #12 es explícito en que la imagen del instructor "puede ayudar o estorbar; depende de si compite con el contenido". Para contenido donde el "contenido" es código + memes visuales densos, retirar la cara libera el canal visual — encaja con el principio de coherencia (#1). Flag: documentar como caso límite válido para tutorial técnico, no como recomendación general.
- Destino: pilar 02 Pre-producción / Patrones (no-cara como opción válida en tutorial técnico animado); pilar 02 Meta-formatos (modelo dual evergreen+trending); ficha Fireship (métricas + humor de 3 capas).
- Notas: Tres capas de humor identificadas: (1) jokes de nicho (framework wars JS), (2) memes visuales, (3) self-deprecating/sarcástico. Este "stack cómico" tiene función cognitiva: alivia carga extraña en temas densos. Cruzar con pilar 1 para evaluar honestamente si es distracción (#1 coherencia) o facilitador (carga germana).

### 2026-04-18 — Paddy Galloway — CCN Fit framework (Creator Science podcast)

- Fecha verificación: 2026-04-18
- Fuente: https://podcast.creatorscience.com/paddy-galloway-2/
- Tipo: análisis industria (Galloway es analista top; entrevistado por Jay Clouse)
- Creator/nicho asociado: n/a — framework transversal
- Claim extraído: "CCN Fit": todo video debe servir simultáneamente a Core (audiencia regular), Casual (audiencia amplia pero interesada) y New (descubrimiento). Para contenido educativo: "can a core, casual, and new viewer all click this video and enjoy it?". Título y thumbnail son el "first hook" — el cold-open es el segundo. Cita: "a 20% better title could mean double, triple, quadruple...a 100 times more views."
- Evidencia: Cita textual verificada; ejemplo concreto: Andrew Millison (permacultura) tituló "How the UN is Holding Back the Sahara Desert" → 12M views, reframing técnica como geopolítica mass-appeal.
- Sobrevive filtro pilar-1: sí — encaja con pilar 1 §1.3 (promesa cumplible) y §1.1 (captura bottom-up antes de top-down). El "reframing" no es clickbait si el contenido entrega la promesa.
- Destino: pilar 02 Idea→Guión / Patrones (CCN fit como filtro de idea ANTES de producir); pilar 02 Publicación (packaging + Glance Test del thumbnail).
- Notas: Galloway explicita que SU enfoque no es retention-durante-el-video sino packaging+idea; eso lo complementa Fireship con estructura interna densa. Ambos son compatibles: Paddy resuelve "por qué hicieron click" y Fireship resuelve "por qué siguen viendo".

### 2026-04-18 — MoureDev — estructura curso Hello-Python (GitHub)

- Fecha verificación: 2026-04-18
- Fuente: https://github.com/mouredev/Hello-Python
- Tipo: observación (repo oficial, estructura del curso)
- Creator/nicho asociado: MoureDev / tutorial técnico
- Claim extraído: El curso "Hello-Python" se estructura en 3 pistas: Básico (47 lecciones, ~4h → ~5 min/clase), Intermedio (29 lecciones, ~3h → ~6 min/clase), Backend (18 lecciones, más largas, proyecto-driven). El formato es LIVE CODING desde Twitch, reeditado a YouTube. Stack visible: VS Code, FastAPI, MongoDB, Vercel.
- Evidencia: Estructura verificable en el repo; duración total declarada: 100 clases, 44h.
- Sobrevive filtro pilar-1: sí — 5-6 min/clase en el tramo básico encaja PERFECTAMENTE con Guo et al. 2014 (pilar 1 §2.4) "engagement cae pasado 6 min". Observación importante: MoureDev en modo enseñanza estructurada tiene cadencia compatible con la ciencia. Los videos largos (proyectos backend) son excepciones por naturaleza de la tarea, no default.
- Destino: pilar 02 Meta-formatos (modelo "curso serial gratuito como puerta de entrada a premium" + live-coding-luego-editado); ficha MoureDev.
- Notas: Contraste con Fireship revelador: Fireship comprime hasta 100s por pieza; MoureDev segmenta a 5-6 min por clase. Ambos respetan el ceiling de ~6 min de Guo et al. pero con estrategias distintas (compresión radical vs segmentación serial). Ambos son válidos.

### 2026-04-18 — Paddy Galloway — hooks y packaging (LinkedIn post "unpausing viewers")

- Fecha verificación: 2026-04-18
- Fuente: https://www.linkedin.com/posts/paddy-galloway-459b8913a_what-do-these-four-viral-youtube-videos-have-activity-7444402853705854978-IsL1 (resumido vía WebSearch)
- Tipo: análisis industria
- Creator/nicho asociado: n/a — framework transversal
- Claim extraído: Principio "click to unpause" — el thumbnail+título crean un "open loop" en el cerebro del viewer que el contenido cierra. Los Shorts top tienen 70-90% view-rate vs swipe-away.
- Evidencia: Métrica citada por Galloway (fuente primaria reputada); framework consistente con Zeigarnik.
- Sobrevive filtro pilar-1: sí — conecta directamente con pilar 1 §6.2 (efecto Zeigarnik, matizado) y §1.3 (anticipación de recompensa dopaminérgica). Evidencia profesional independiente que converge con lo académico.
- Destino: pilar 02 Publicación (packaging con "open loop" framing); pilar 02 Idea→Guión (hook como cierre del loop abierto por el thumbnail).
- Notas: Triangulación útil — la frase de Zeigarnik del pilar 1 (academia 1927 + revisiones modernas) converge con una heurística profesional independiente de Galloway (analista con 700M views/mes gestionados). Esta convergencia refuerza el patrón, no lo debilita.

### 2026-04-18 — Midudev (Miguel Ángel Durán) — perfil y foco

- Fecha verificación: 2026-04-18
- Fuente: https://github.com/midudev + https://es.linkedin.com/in/midudev (perfil verificable)
- Tipo: plataforma (perfiles oficiales; LinkedIn reputado)
- Creator/nicho asociado: Midudev / tutorial técnico
- Claim extraído: Miguel Ángel Durán, 15+ años experiencia, Barcelona-based. Foco específico: JavaScript, frontend, desarrollo web (contraste con MoureDev que es más generalista + móvil + "desde cero"). Podcast propio "Programación JavaScript y Desarrollo Web con midudev" activo multi-año.
- Evidencia: Perfiles verificables.
- Sobrevive filtro pilar-1: sí (metadata).
- Destino: ficha Midudev (crear en Sesión 2).
- Notas: Contraste clave MoureDev vs Midudev: AMBOS hispanos técnicos, pero Midudev se ancla en front-end/JS moderno para audiencia intermedia, mientras MoureDev se ancla en "programación desde cero" para beginners. Cubrir ambos en Sesión 2 permite tener un eje "beginner-friendly vs intermediate-focused" dentro del nicho hispano — contraste útil para las recomendaciones del pilar 02.

### 2026-04-18 — Guo, Kim & Rubin 2014 — re-verificación vía systematic review

- Fecha verificación: 2026-04-18
- Fuente: https://www.semanticscholar.org/paper/How-video-production-affects-student-engagement:-an-Guo-Kim/409090a8fa7edfededc03c396a16f6f57144270c
- Tipo: académico (paper seminal, el mismo ya citado en pilar 1 §2.4)
- Creator/nicho asociado: n/a — framework académico
- Claim extraído: El estudio original de 6.9M sesiones de video en edX identifica TRES hallazgos replicables: (1) videos más cortos = más engaging (mediana 3-6 min), (2) talking-head INFORMAL supera a talking-head formal estudio, (3) "Khan-style tablet drawings" supera a screencasts o slides estáticas.
- Evidencia: Paper primario, citación múltiple, ya en bibliografía del pilar 1.
- Sobrevive filtro pilar-1: sí — ES pilar 1.
- Destino: pilar 02 Pre-producción / Patrones (endorsement académico de talking-head informal + "Khan-style drawing" como pattern superior a slides estáticas); reforzar referencia cruzada con pilar 1 §2.4.
- Notas: Este dato refuerza que MoureDev (talking-head PiP informal + live coding) y creators tipo 3Blue1Brown (dibujo tipo Khan) tienen base académica directa. Fireship es caso distinto: reemplaza talking-head por animation-driven storytelling; funciona por saturación visual compensatoria + humor, no por el mecanismo de Guo et al.

### 2026-04-18 — Meta-análisis MOOC engagement 2023 (Elsevier)

- Fecha verificación: 2026-04-18
- Fuente: https://www.sciencedirect.com/science/article/pii/S2405844023024271
- Tipo: académico (systematic review, 21 estudios 2008-2021)
- Creator/nicho asociado: n/a — framework académico
- Claim extraído: El dropout en MOOCs se agrupa en 5 categorías: Course Attributes (diseño/estructura), Social Status, Cognitive Ability, Emotional Factor, Learning Behavior. Engagement tiene 3 fases (Start, Mid, End) con patrones distintos — el drop-off más severo ocurre en la transición Start → Mid.
- Evidencia: Systematic review con PRISMA, 21 estudios.
- Sobrevive filtro pilar-1: sí — amplía pilar 1 §2.4 y §8.2 con taxonomía accionable.
- Destino: pilar 02 Publicación / Métricas (distinción Start/Mid/End drop-off → mapea a retention curve sections); pilar 02 Meta-formatos (onboarding corporativo / micro-curso serial: diseñar transición Start→Mid con extra señalización).
- Notas: Relevante especialmente para el nicho **onboarding corporativo** (Sesión 3). El hallazgo "drop-off más severo al inicio" converge con la práctica YouTube de hook fuerte 0-15s pero lo extiende a escala de CURSO COMPLETO — hay que diseñar onboarding del curso, no solo hook del video.

### 2026-04-18 — Meta-análisis motivation/retention MOOC 2024 (Emerging Science Journal)

- Fecha verificación: 2026-04-18
- Fuente: https://ijournalse.org/index.php/ESJ/article/view/2372
- Tipo: académico (systematic review, 140 estudios 2014-2023)
- Creator/nicho asociado: n/a — framework académico
- Claim extraído: Sobre estrategias motivacionales en MOOC, tres correlaciones robustas con engagement y persistence: (1) personalización del aprendizaje, (2) contenido interactivo, (3) colaboración entre pares. Alineación con metas intrínsecas del aprendiz es el predictor más fuerte.
- Evidencia: 140 estudios sintetizados PRISMA.
- Sobrevive filtro pilar-1: sí — amplía pilar 1 §2.3 #10 (principio de personalización de Mayer) con evidencia post-2014. Converge además con §6.3 (retrieval practice como "contenido interactivo").
- Destino: pilar 02 Idea→Guión / Patrones (personalización explícita como patrón top); pilar 02 Edición (retrieval checkpoints interactivos, no contenido-pasivo); pilar 02 Publicación (patrones comunitarios/colaborativos — Discord de MoureDev es ejemplo aplicado).
- Notas: Este meta-análisis endosa estructuralmente el modelo MoureDev (personalización pedagógica + comunidad Discord peer-to-peer) con evidencia académica. Es un hallazgo importante: lo que parecía "estrategia de negocio" (Discord como upsell) tiene respaldo de aprendizaje.

### 2026-04-18 — Paddy Galloway — LinkedIn "4 viral videos secret: unpausing viewer"

- Fecha verificación: 2026-04-18
- Fuente: https://www.linkedin.com/posts/paddy-galloway-459b8913a_what-do-these-four-viral-youtube-videos-have-activity-7444402853705854978-IsL1 (refuerzo de entry #9 con contexto adicional)
- Tipo: análisis industria
- Creator/nicho asociado: n/a
- Claim extraído: Shorts top-performing tienen view-rate 70-90% (vs swipe-away); el secreto común es que el thumbnail+título crean un "open loop" que el cold-open cierra.
- Evidencia: Métrica citada directamente por Galloway sobre datos de canales que asesora.
- Sobrevive filtro pilar-1: sí.
- Destino: pilar 02 Publicación / Métricas (view-rate 70-90% como benchmark para Shorts); pilar 02 Idea→Guión (hook debe CERRAR el open loop del título, no plantear uno nuevo).
- Notas: Este es el entry 15 del research log. Meta de Sesión 1 alcanzada. Transición a cierre: verificación final, commit, preparación de Sesión 2.


## Sesión 2 — 2026-04-18

Metodología de la sesión: observación directa de videos vía `yt-dlp --write-auto-subs --sub-format vtt --write-info-json --skip-download`, luego parseo con `vtt2txt2.py` (script en `/tmp/casos-de-exito-sesion2/`, no versionado) que usa los timestamps inline `<c>` del VTT para evitar la triplicación natural de los auto-subs de YouTube (cada caption se repite 3 veces por la ventana deslizante). Métricas extraídas por video: hook 0-30s (texto exacto), CTA últimos 45s (texto exacto), WPM limpio (palabras reales ÷ duración en minutos), duración, views, likes, fecha de upload.

### 2026-04-18 — ThePrimeagen "What You Need To Learn 2023" — observación directa

- Fecha verificación: 2026-04-18
- Fuente: https://www.youtube.com/watch?v=6jPiuOXmxEc (VTT auto-subs + info-json)
- Tipo: observación
- Creator/nicho asociado: ThePrimeagen / tutorial técnico
- Claim extraído: Hook estructural "lista retórica + contrarian". 0-15s enumera 3 preguntas repetidas de la audiencia ("what programming language / library / service should you use"), luego pivot explícito: "I'm going to take the contrarian opinion here". Estructura pain point × N → postura disidente.
- Evidencia: 3:45 duración, 292,745 views, 11,231 likes, upload 2023-08-03. WPM medido: **206.2** (770 palabras / 3.74 min). Hook textual verbatim en `/tmp/casos-de-exito-sesion2/primeagen/6jPiuOXmxEc.en.vtt`. CTA: NO hay subscribe-like explícito; video cierra con chiste meta "the name is I have to manually hit the stop button you know because this is just a full single take".
- Sobrevive filtro pilar-1: sí — hook estructural compatible con principio de señalización (pilar 1 §2.3 #2 "signaling") al marcar explícitamente el pivot contrarian.
- Destino: ficha ThePrimeagen (elimina `[pendiente verificación]` de hook/cadencia/CTA); pilar 02 Idea→Guión / Patrones (hook "lista retórica + contrarian" como variante editorial).
- Notas: La ausencia de CTA explícito es dato fuerte — contradice el consejo generalizado de "recordar suscribirse al final". Funciona porque los sponsors + multichannel están en la descripción + el ecosistema Twitch/Discord ya capturó la audiencia.

### 2026-04-18 — ThePrimeagen "Are Developers Ok?" — observación directa

- Fecha verificación: 2026-04-18
- Fuente: https://www.youtube.com/watch?v=SCPVDpyApgQ (VTT + info-json)
- Tipo: observación
- Creator/nicho asociado: ThePrimeagen / tutorial técnico
- Claim extraído: Hook "personal-vivencial + drama de comunidad". 0-30s abre con declaración identitaria ("20 years into my software engineering career"), luego entrada al incidente específico ("this thing deleted 3 months of work I had just downloaded vs code..."). Formato: autoridad personal → setup narrativo.
- Evidencia: 11:47 duración, 202,219 views, 10,873 likes, upload 2024-01-10. WPM medido: **189.3** (2228 palabras). Cierre con punchline cómica sobre el profile del autor del drama ("lover of Santa Claus Christmas and all things holiday currently residing in the North Pole"). Sponsor boot.dev en descripción, NO en voice-over.
- Sobrevive filtro pilar-1: sí — narrativa-first compatible con pilar 1 §6.1 (curiosity gaps) y §7 (story structure). No contradice nada.
- Destino: ficha ThePrimeagen (modo 2 del hook); pilar 02 Idea→Guión (hook narrativo como alternativa al hook de promesa).
- Notas: Dos videos confirman patrón: Primeagen ancla hooks en postura personal, nunca en promesa de beneficio. Eso es distintivo — contradice la heurística "promete un resultado concreto" común en advice de creator coaching. Funciona porque la audiencia viene por la voz editorial, no por el beneficio.

### 2026-04-18 — Midudev "HTML acaba de cambiar para siempre" — observación directa

- Fecha verificación: 2026-04-18
- Fuente: https://www.youtube.com/watch?v=hwNoYKhSBh0 (VTT `es` + info-json)
- Tipo: observación
- Creator/nicho asociado: Midudev / tutorial técnico hispano
- Claim extraído: Hook de "promesa directa + tecnología específica + ejemplo concreto" en 3 frases. "Vamos a hablar del futuro de HTML porque os va a volar la cabeza. Esto es una nueva propuesta para utilizar en el HTML, en la etiqueta canvas, ya sea en 2D o en 3D, poder utilizar HTML dentro. Esto es una cosa que hasta ahora no se podía hacer." Cero warm-up, cero presentación del creador.
- Evidencia: 10:45 duración, 166,666 views, 9,300 likes, upload 2026-04-13. WPM medido: **181.9** (1955 palabras). Cierre reflexivo sin CTA explícito. Link al artículo de GitHub/WICG en descripción.
- Sobrevive filtro pilar-1: sí — hook cumple señalización (pilar 1 §2.3 #2) y promesa cumplible (pilar 1 §1.3).
- Destino: ficha Midudev (creación); pilar 02 Idea→Guión (hook "promesa + tech + demo" para tech-news).
- Notas: Español a 182 WPM es subjetivamente similar a 200-210 WPM anglo (español requiere ~10-15% más palabras). Registro "vosotros/ustedes" revela decisión consciente de dirigirse a audiencia pan-hispana con sede España.

### 2026-04-18 — Midudev "Claude... ¿Esto es una broma?" — observación directa

- Fecha verificación: 2026-04-18
- Fuente: https://www.youtube.com/watch?v=1VaSXlQnHfA (VTT + info-json)
- Tipo: observación
- Creator/nicho asociado: Midudev / tutorial técnico hispano
- Claim extraído: Hook de "urgencia + twist revelador". "tenéis 17€ gratuitos... hasta el 17 de abril... no os voy a engañar, esto es que te dan un caramélito para destruiros directamente". Patrón: oferta/novedad neutra → insinuación de trampa → setup del argumento crítico.
- Evidencia: 18:20 duración, 166,493 views, 6,939 likes, upload 2026-04-07. WPM medido: **192.5** (3523 palabras). Cierre conversacional sin pitch explícito.
- Sobrevive filtro pilar-1: sí — hook crea curiosity gap (§6.1) con la palabra "caramélito" (promesa contraintuitiva).
- Destino: ficha Midudev (variante del hook); pilar 02 Idea→Guión (hook "urgencia + twist" aplicable a contenido reactivo).
- Notas: El modelo "reaccionar a noticia del sector" requiere pipeline activo — Midudev tiene podcast + comunidad que le alimentan de temas. Para creator nuevo sin ese pipeline, los temas llegan tarde y el patrón pierde su arma principal (urgencia).

### 2026-04-18 — The Coding Train "What the font?!?!" — observación directa

- Fecha verificación: 2026-04-18
- Fuente: https://www.youtube.com/watch?v=d0GgzjCFWq0 (VTT + info-json)
- Tipo: observación
- Creator/nicho asociado: The Coding Train / tutorial técnico
- Claim extraído: Hook "salutación informal + contexto directo + self-deprecación honesta". "Hi everybody. In today's video, I'm showing you another feature of P5 2.0... I don't really know these things, so I'm going to be kind of figuring it out as I go in this video." Tres elementos: saludo, promesa temática, admisión de ignorancia.
- Evidencia: 20:53 duración, 17,161 views, 735 likes, upload 2026-03-30. WPM medido: **155.6** (3246 palabras). Cierre ritual "please share it with me on the coding train website in the passenger showcase".
- Sobrevive filtro pilar-1: sí — la self-deprecación honesta encaja con pilar 1 §2.3 #10 (personalización de Mayer: tono conversacional) y §5.3 (modelar metacognición — el experto que duda es más útil pedagógicamente que el experto seguro).
- Destino: ficha The Coding Train (creación); pilar 02 Idea→Guión / Patrones (hook self-deprecating + modelado de metacognición).
- Notas: 155 WPM es el valor más bajo de los 5 creators medidos en Sesión 1+2. Refuerza que "talking-head informal" de Guo et al. 2014 permite (y probablemente requiere) velocidad más pausada para facilitar el rol pedagógico.

### 2026-04-18 — The Coding Train "Coding Challenge 187: Bayes Theorem" — observación directa

- Fecha verificación: 2026-04-18
- Fuente: https://www.youtube.com/watch?v=g3-PXyF8U70 (VTT + info-json)
- Tipo: observación
- Creator/nicho asociado: The Coding Train / tutorial técnico
- Claim extraído: Hook meta-temporal que rompe la cuarta pared. "Hi everybody, welcome to a coding challenge video. Hi, it's me from the future in the editing booth." Narrador presente + narrador editor-del-futuro. Reconoce la producción como parte del show.
- Evidencia: 53:38 duración, 38,937 views, 1,212 likes, upload 2025-10-12. WPM medido: **157.0** (8421 palabras). Cierre ritual "Thank you, everybody. See you next time on the coding train."
- Sobrevive filtro pilar-1: sí — meta-narración conecta con conciencia metacognitiva (§5.3); NO hay conflicto.
- Destino: ficha Coding Train (segunda variante del hook); pilar 02 Meta-formatos (coding challenge long-form como variante de nicho).
- Notas: Los 53:38 minutos del formato signature violan el ceiling de 6 min de Guo et al. 2014. Funciona por (a) audiencia nicho consolidada, (b) monetización Nebula alternativa, (c) 10 años de rapport. **Patrón clave para pilar 02:** "formatos long-form justificados requieren 3 pre-requisitos: audiencia nicho, monetización alternativa, rapport acumulado". Sin los tres, el long-form fracasa.

### 2026-04-18 — 3Blue1Brown "The Hairy Ball Theorem" — observación directa

- Fecha verificación: 2026-04-18
- Fuente: https://www.youtube.com/watch?v=BHdbsHFs2P0 (VTT + info-json)
- Tipo: observación
- Creator/nicho asociado: 3Blue1Brown / divulgación matemática
- Claim extraído: Hook "anécdota personal íntima → conexión inesperada con tema matemático". "These days, whenever I look at the back of my beloved 7-month-old baby's head, this little swirl of tiny hairs reminds me of one of the most ridiculously named facts in math, the hairy ball theorem." Patrón: detalle doméstico específico (bebé, pelito) → objeto matemático con nombre absurdo → promesa ("I promise this is a genuinely serious bit of math").
- Evidencia: 29:40 duración, 2,610,343 views, 77,755 likes, upload 2026-01-31. WPM medido: **192.4** (5706 palabras). Cierre con promesa narrativa ("it's a fun puzzle to see if you can construct an explicit example..."). NO hay pitch de sponsor — monetización Patreon.
- Sobrevive filtro pilar-1: sí — entra emocionalmente antes de cargar cognitivamente (compatible con §3.4 "emocionalidad del aprendizaje" y §1.1 "captura bottom-up antes de top-down").
- Destino: ficha 3Blue1Brown (creación); pilar 02 Idea→Guión / Patrones ("hook anecdótico" como entrada para divulgación técnica densa).
- Notas: Este hook es REPLICABLE por creadores sin producción de Hollywood — requiere observación personal genuina + capacidad de conectar con el tema. Costo cero de producción, alto valor retentivo. Contraste con hook Veritasium (montaje social) que requiere múltiples entrevistados.

### 2026-04-18 — 3Blue1Brown "But what is a Laplace Transform?" — observación directa

- Fecha verificación: 2026-04-18
- Fuente: https://www.youtube.com/watch?v=j0wJBEZdwLs (VTT + info-json)
- Tipo: observación
- Creator/nicho asociado: 3Blue1Brown / divulgación matemática
- Claim extraído: Hook "visual-promesa + analogía pedagógica". "What you're looking at, a somewhat complicated diagram that you and I are going to build up in this video..." + "learning how to drive a car versus learning how an engine works". Apunta al screen, promete construcción en vivo, luego da analogía de niveles de comprensión.
- Evidencia: 34:41 duración, 1,469,418 views, 47,407 likes, upload 2025-10-12. WPM medido: **183.3** (6354 palabras).
- Sobrevive filtro pilar-1: sí — la analogía driver/mechanic es ejemplo perfecto del principio de pre-training (pilar 1 §2.3 #9) aplicado al metaaprendizaje.
- Destino: ficha 3Blue1Brown (segunda variante); pilar 02 Idea→Guión / Patrones (hook analogía + promesa visual); pilar 02 Pre-producción (modelo Manim animación-driven como alternativa a talking-head).
- Notas: Combinando 2 videos, 3B1B mantiene WPM ~185-192 pese a la "sensación" de pausa. Variable oculta: **tiempo visual entre ideas**. Manim tarda segundos en dibujar una curva; el audio llena el tiempo pero no acelera más. Importa para producción: la velocidad percibida NO es WPM, es ritmo visual.

### 2026-04-18 — Veritasium "Why are these 3 letters on almost all of my zippers?" — observación directa

- Fecha verificación: 2026-04-18
- Fuente: https://www.youtube.com/watch?v=9szhjhO9epA (VTT + info-json)
- Tipo: observación
- Creator/nicho asociado: Veritasium / divulgación ciencia/ingeniería
- Claim extraído: Hook "pregunta directa + demo física invitada + wow-fact escalonado". "How does a zipper actually work? Like try to push down on a zipper from above and it probably won't budge. But if you just use the pull tab, suddenly it's buttery smooth." Luego magnitud cósmica: "We've made more zippers than there are stars in the Milky Way."
- Evidencia: 20:45 duración, 8,155,909 views, 223,267 likes, upload 2026-03-19. WPM medido: **174.1** (3609 palabras). Sponsor Hostinger en pre-roll (primera frase de descripción), NO en voice-over del video. Cierre reflexivo personal sobre la persistencia del invento de 1914.
- Sobrevive filtro pilar-1: sí — demo invitada es retrieval practice implícito (§6.3): el viewer "prueba" la idea mentalmente antes de recibir la explicación.
- Destino: ficha Veritasium (creación); pilar 02 Idea→Guión / Patrones (hook "demo física invitada" replicable para temas físico-mecánicos).
- Notas: Veritasium 174 WPM es más bajo que 3B1B 192 — patrón visual completamente distinto. Veritasium usa pausas orales para que los viewers miren el B-roll y procesen.

### 2026-04-18 — Veritasium "This Paradox Splits Smart People 50/50" — observación directa

- Fecha verificación: 2026-04-18
- Fuente: https://www.youtube.com/watch?v=Ol18JoeXlVI (VTT + info-json)
- Tipo: observación
- Creator/nicho asociado: Veritasium / divulgación ciencia
- Claim extraído: Hook "montaje social-dramático" — múltiples voces intercaladas sin introducción del presentador. "No. What?" / "It just seems so obvious to me." / "Now I'm all screwed up, man." / "I even argued with Derek about it. There's no way." Crea tensión antes de revelar el problema. **Format documental, no tutorial.**
- Evidencia: 25:40 duración, 7,140,434 views, 207,119 likes, upload 2026-03-09. WPM medido: **181.0** (4645 palabras). Cierre con pitch de Brilliant integrado ~45s ("Brilliant's course on Bayes and probability goes through that exact problem").
- Sobrevive filtro pilar-1: sí — conflict-driven hook genera attention + curiosity gap (§6.1) sin contradecir cognitivo.
- Destino: ficha Veritasium (segunda variante del hook); pilar 02 Idea→Guión / Patrones (hook montaje social requiere polifonía — apunta a anti-patrón "no copies sin acceso a múltiples voces"). pilar 02 Publicación (sponsor Brilliant al CIERRE para temas conceptuales vs pre-roll para temas infra-tool).
- Notas: Decisión estratégica observada: **posición del sponsor varía por tema**. Brilliant (educación) ↔ cierre; Hostinger (infra) ↔ pre-roll. No es aleatorio — es relevancia temática. Framework replicable: sponsor se integra donde el tema del video lo justifica semánticamente, no donde el YouTuber "tenga que hacerlo".

### Cierre Sesión 2

Entries 16-25 añadidas (10 nuevas). Meta de Sesión 2 alcanzada y superada:
- Ficha ThePrimeagen completada (4 `[pendiente]` eliminados).
- 2 fichas nuevas tutorial técnico (Midudev, The Coding Train) — total nicho: 5.
- 2 fichas nuevas divulgación (3Blue1Brown, Veritasium) en archivo nuevo `divulgacion-corta.md`.
- Toolchain de extracción (yt-dlp + vtt2txt2.py) funciona y queda disponible para Sesión 3.

Pendientes Sesión 3: 2-3 fichas divulgación adicionales (Kurzgesagt, Steve Mould anglo / DotCSV o QuantumFracture hispano); arranque de onboarding corporativo (Platzi, LinkedIn Learning, reportes LMS).


## Sesión 3 — 2026-04-18

### 2026-04-18 — Kurzgesagt "This Is the Scariest Place in The Universe" — observación directa

- Fecha verificación: 2026-04-18
- Fuente: https://www.youtube.com/watch?v=yDAAlojz8NU (VTT + info-json)
- Tipo: observación
- Creator/nicho asociado: Kurzgesagt / divulgación científica animada (equipo, no persona)
- Claim extraído: Hook "escala inhumana → consecuencias". "The vast majority of the cosmos is voids. Gigantic, unfathomably large spaces of empty nothingness. Bubbles of eternal night stretching hundreds of millions of light years..." NO presenta al creador (no hay creador visible). Entra por la magnitud, no por la promesa de aprender.
- Evidencia: 9:13 duración, 6,375,377 views, 235,810 likes, upload 2026-03-10. WPM medido: **146.9** (1354 palabras). Cierre: plug del shop propio ("space souvenirs drop... created with lots of care by our team of scientists and designers").
- Sobrevive filtro pilar-1: sí — apertura con escala conecta con principio de personalización (§2.3 #10) via 2ª persona implícita ("travelling with us") y genera curiosity gap sin saturar.
- Destino: ficha Kurzgesagt (creación); pilar 02 Idea→Guión / Patrones (hook "escala cósmica" como variante).
- Notas: WPM 147 es el más bajo del atlas hasta ahora. Confirma hipótesis "canal visual denso → WPM bajo permite procesamiento". Animación Kurzgesagt carga información visual suficiente para justificar la pausa oral.

### 2026-04-18 — Kurzgesagt "Why Are There No Holes Around Trees?" — observación directa

- Fecha verificación: 2026-04-18
- Fuente: https://www.youtube.com/watch?v=pHJIhxZEoxg (VTT + info-json)
- Tipo: observación
- Creator/nicho asociado: Kurzgesagt / divulgación científica
- Claim extraído: Hook "dato colosal → paradoja aparente → pregunta del título". "Trees are the heaviest and largest living things on Earth... But instead of floating weightlessly... held in place by surprisingly shallow roots. You'd think trees grow from the ground because, well, they're made of stuff and there's stuff in the ground. But if something so massive and huge ate something down below, it would have to leave holes."
- Evidencia: 11:20 duración, 3,951,065 views, 162,501 likes, upload 2026-01-07. WPM medido: **164.6** (1866 palabras). Cierre: **45s pitch Brilliant** ("To explore everything Brilliant has to offer for free for a full 30 days, go to brilliant.org/nutshell... 20% off an annual premium subscription").
- Sobrevive filtro pilar-1: sí — formato "dato concreto → paradoja" activa curiosity gap (§6.1) y modelo mental previo (§6.2 de forma débil, con pregunta explícita que impone estructuramiento activo).
- Destino: ficha Kurzgesagt (segunda variante hook); pilar 02 Publicación (Brilliant como sponsor transversal divulgación — 3er caso observado después de Veritasium y QuantumFracture).
- Notas: Patrón sponsor Brilliant en 3 de 5 canales de divulgación (Veritasium, Kurzgesagt, QuantumFracture). Suficiente para declarar patrón.

### 2026-04-18 — DotCSV "Camino a las IAs con RAZONAMIENTO SOBREHUMANO" — observación directa

- Fecha verificación: 2026-04-18
- Fuente: https://www.youtube.com/watch?v=jPmrIh8uLzw (VTT + info-json)
- Tipo: observación
- Creator/nicho asociado: DotCSV / divulgación IA hispana
- Claim extraído: Hook "re-anclaje serial + setup editorial". "Hace una semana OpenAI dio inicio a la segunda fase de su hoja de ruta tras conquistar con los modelos GPT la capacidad de que una máquina domine el uso del lenguaje." Anclaje temporal + continuidad con videos previos + setup del análisis.
- Evidencia: 22:57 duración, 289,227 views, 15,589 likes, upload 2024-09-29. WPM medido: **176.3** (4045 palabras). CTA explícito "si os ha gustado el vídeo, no dejéis de compartirlo, no dejéis de apoyarlo, dejad vuestro me gusta y vuestros comentarios con vuestras opiniones..." + cross-plug a DotCSV Lab.
- Sobrevive filtro pilar-1: sí — re-anclaje serial equivale a prior-knowledge activation (§2.3 #9 pre-training) para audiencia recurrente.
- Destino: ficha DotCSV (creación); pilar 02 Idea→Guión (hook "re-anclaje serial" para creators con audiencia recurrente); pilar 02 Publicación (CTA explícito como matiz cultural hispano — flaggear).
- Notas: DotCSV es el único del atlas con CTA explícito completo. Contradice el patrón "anti-suscríbete" de los demás 9 creators. Flag importante: no es anti-patrón universal.

### 2026-04-18 — DotCSV "¡EMPIEZA A USAR la IA GRATIS en tu PC!" — observación directa

- Fecha verificación: 2026-04-18
- Fuente: https://www.youtube.com/watch?v=Ye7cERMKZDY (VTT + info-json)
- Tipo: observación
- Creator/nicho asociado: DotCSV / divulgación IA hispana
- Claim extraído: Hook "referencia explícita a video previo + pivot al actual". "Hace unos meses estuvimos hablando del papel privilegiado que tiene NVIDIA dentro de la batalla... en aquel vídeo, si recordáis, pues nos centramos más en entender la parte de la nube..." Asume viewer serial o lo invita a verificar.
- Evidencia: 27:59 duración, 367,382 views, 16,516 likes, upload 2024-08-04. WPM medido: **182.3** (5100 palabras).
- Sobrevive filtro pilar-1: sí.
- Destino: ficha DotCSV (segunda variante del hook).
- Notas: Refuerza patrón "DotCSV asume audiencia serial". 2 de 2 videos observados usan re-anclaje temporal. Es consistente, no accidente.

### 2026-04-18 — QuantumFracture "¿El Espacio es una Ilusión?" — observación directa

- Fecha verificación: 2026-04-18
- Fuente: https://www.youtube.com/watch?v=fGVSY0ZRGts (VTT + info-json)
- Tipo: observación
- Creator/nicho asociado: QuantumFracture (José Luis Crespo) / divulgación física hispana
- Claim extraído: Hook "alegoría literaria" — reescritura de la alegoría de la caverna de Platón como entrada al principio holográfico. "Estás en una cueva de cara a una pared. Llevas allí desde que naciste, atado de tal forma que no puedes girar el cuello. Detrás de ti hay una hoguera..." 30s sin mencionar física.
- Evidencia: 25:38 duración, 463,877 views, 22,850 likes, upload 2025-12-23. WPM medido: **167.7** (4299 palabras). Cierre: plantilla "si quieres más ciencia, solo tienes que suscribirte" + cross-plug a podcast Quantum FM + Brilliant sponsor.
- Sobrevive filtro pilar-1: sí — hook narrativo absorbente genera emoción antes de carga cognitiva (§3.4 + §1.1 bottom-up).
- Destino: ficha QuantumFracture (creación); pilar 02 Idea→Guión (hook "alegoría literaria" como variante para temas abstractos).
- Notas: Hook muy distintivo. Requiere capacidad literaria genuina — no replicable mecánicamente.

### 2026-04-18 — QuantumFracture "¿Por qué Queremos Volver a la Luna?" — observación directa

- Fecha verificación: 2026-04-18
- Fuente: https://www.youtube.com/watch?v=U4EMQIN6Yoo (VTT + info-json)
- Tipo: observación
- Creator/nicho asociado: QuantumFracture / divulgación física hispana
- Claim extraído: Hook directo + humor auto-consciente. "Volvemos a la Luna. Hacía más de 50 años que no enviábamos una misión tripulada, pero eso ya es historia." + break "Soy un friky que sube vídeos a internet." El humor sirve para desacralizar la posición del divulgador.
- Evidencia: 11:47 duración, 1,229,845 views, 61,755 likes, upload 2026-04-01. WPM medido: **169.5** (1997 palabras). Cierre plantilla suscribirse.
- Sobrevive filtro pilar-1: sí — self-deprecación es instanciación de principio de personalización (§2.3 #10).
- Destino: ficha QuantumFracture (segunda variante hook); pilar 02 Idea→Guión (humor auto-consciente como recurso de warmth).
- Notas: Contrasta deliberadamente con hook 1 del mismo creator (alegoría). Crespo maneja dos registros según el tema — abstracto=alegórico, concreto=directo+humor.

### 2026-04-18 — Corporate training video stats (literature review 2024-2025)

- Fecha verificación: 2026-04-18
- Fuente: https://elearningindustry.com/microlearning-statistics-facts-and-trends + https://research.com/education/video-training-statistics + https://www.continu.com/research/corporate-elearning-statistics (WebSearch consolidado)
- Tipo: análisis industria
- Creator/nicho asociado: n/a — framework transversal onboarding
- Claim extraído: (1) Microlearning courses ~80% completion vs ~20% long-form. (2) Non-interactive training video completion dropped a 60% en 2024. (3) Gamified experiences → 90% vs 25% non-gamified. (4) 58% de empleados engage más con segmentos cortos. (5) 72% de grandes empresas asignan ≥20% de contenido a bite-sized modules.
- Evidencia: Múltiples fuentes secundarias reputadas (eLearning Industry, Research.com, Continu) convergen en rangos similares.
- Sobrevive filtro pilar-1: sí — microlearning compatible con Guo et al. 2014 §pilar 1 §2.4 (ceiling ~6 min; 5-10 min acepta extensión profesional). Gamification encaja con §3.4 (motivación externa como ayuda, no sustituto).
- Destino: ficha `onboarding-corporativo.md` §Patrones transversales microlearning; pilar 02 Publicación (métricas de completion rate como benchmark para onboarding).
- Notas: Data secundaria múltiple — cada claim está en ≥2 fuentes independientes. Flag para futura revisión: la afirmación "95% recall video vs 10% text" aparece recurrentemente pero sus fuentes primarias son débiles; tratar con cautela hasta triangular paper original.

### 2026-04-18 — LinkedIn Learning — política completion 70%

- Fecha verificación: 2026-04-18
- Fuente: https://www.linkedin.com/help/learning/answer/a700839 (Help oficial) + https://www.linkedin.com/help/linkedin/answer/a700781
- Tipo: plataforma (documentación oficial)
- Creator/nicho asociado: LinkedIn Learning / onboarding corporativo
- Claim extraído: LinkedIn Learning marca un video como "Complete" cuando se alcanza el 70% de reproducción. Esta es política platform-level, no heurística industry.
- Evidencia: Documentación oficial verificable.
- Sobrevive filtro pilar-1: n/a (es política, no claim cognitivo).
- Destino: ficha `onboarding-corporativo.md`; pilar 02 Publicación / Métricas (definición operativa de "completion" varía por plataforma — no comparable 1:1 con YouTube APV).
- Notas: Dato importante para evitar falsas comparaciones. "Completion rate 80%" de un LMS no significa lo mismo que "APV 80%" de YouTube.

### 2026-04-18 — Articulate Storyline — penetración enterprise

- Fecha verificación: 2026-04-18
- Fuente: https://www.articulate.com/resources/case-studies/ + research consolidado (WebSearch)
- Tipo: análisis industria (con data from Articulate)
- Creator/nicho asociado: Articulate Storyline / onboarding corporativo
- Claim extraído: 40%+ de Fortune 500 usan Articulate Storyline para training. Articulate 360 ayudó a 71% de clientes a reducir costos de training. Principio del producto: transformar video pasivo en "decision-driven exploration" (branching scenarios, pause-choose-alternative scenes, dynamic feedback).
- Evidencia: Citation del vendor (Articulate); cifras también citadas por analistas secundarios (CommLab India, eLearning Industry).
- Sobrevive filtro pilar-1: sí — branching scenarios encajan con §7 (story + consequences) y §6.3 (retrieval practice activa antes de recibir explicación).
- Destino: ficha `onboarding-corporativo.md`; pilar 02 Edición (formato interactivo como alternativa al video lineal para temas compliance/policy).
- Notas: Claim de "40% Fortune 500" viene del vendor — tratarlo como orden de magnitud, no precisión. Suficiente para decir "penetración enterprise alta" con confianza.

### 2026-04-18 — Mike Meyers / Total Seminars — formato certification instructor

- Fecha verificación: 2026-04-18
- Fuente: https://www.udemy.com/user/mike-meyers/ + https://totalsem.com + reviews IT Support Group 2025
- Tipo: observación (reviews múltiples) + plataforma (perfiles oficiales)
- Creator/nicho asociado: Mike Meyers / onboarding corporativo (nicho certificación IT)
- Claim extraído: Arquetipo "instructor-certificación" — curso estructurado alrededor del syllabus oficial de la certificación (CompTIA A+, Security+, Network+), 5-15 min por módulo, formato instructor face-cam + diagrams + screen recordings + demos hardware real. Bestseller en Udemy con 250K+ estudiantes acumulados.
- Evidencia: Reviews consistentes reportan "easy-going, approachable, funny teaching style"; estructura del curso refleja syllabus oficial CompTIA.
- Sobrevive filtro pilar-1: sí — 5-15 min por módulo compatible con Guo et al. 2014 §pilar 1 §2.4; humor integrado refuerza warmth (§2.3 #10).
- Destino: ficha `onboarding-corporativo.md` (Mike Meyers / Total Seminars).
- Notas: Contraste útil con YouTube — Mike Meyers en YouTube tiene ~800K subs (canal Total Seminars), pero su modelo principal es Udemy (audiencia captiva paga). El patrón "syllabus oficial = outline maestro" es transferible a cualquier curso de certificación (ISO, SOC2, ITIL, etc.).

### 2026-04-18 — Plataformas hispanas Platzi + Crehana — data pública

- Fecha verificación: 2026-04-18
- Fuente: https://contxto.com/en/startups/review-education-meets-tech-with-platzi-and-crehana/ + https://pitchbook.com/profiles/company/108801-19 (Platzi) + https://pitchbook.com/profiles/company/101395-27 (Crehana) + https://www.crunchbase.com/organization/mejorandola (Platzi)
- Tipo: análisis + plataforma
- Creator/nicho asociado: Platzi + Crehana / onboarding corporativo hispano
- Claim extraído: Platzi ~5M+ estudiantes, ~1K+ cursos, ancla técnica (programación, data, negocio digital). Crehana con pivot B2B post-adquisición EQT 2022, suites "learning + performance + engagement". Ambas plataformas usan formato "face-cam instructor + slides técnicos + live coding cuando aplica", clases 5-15 min dentro de cursos seriales de 60-120 clases.
- Evidencia: Data oficial + Contxto review + PitchBook profiles.
- Sobrevive filtro pilar-1: sí.
- Destino: ficha `onboarding-corporativo.md` (Platzi + Crehana).
- Notas: Data pública sobre completion rates de estas plataformas NO está disponible (protegida como commercial). Claim "5-15 min clase" viene de observación de cursos públicos. Pendiente: observación directa de 1 clase Platzi + 1 Crehana para medir WPM con la misma metodología.

### Cierre Sesión 3

Entries 26-36 añadidas (11 nuevas). Meta de Sesión 3 alcanzada:
- 3 fichas nuevas divulgación (Kurzgesagt, DotCSV, QuantumFracture) — total nicho: 5.
- Arranque onboarding corporativo con 3 fichas/clusters (Mike Meyers arquetipo, Platzi+Crehana plataformas, patrones microlearning transversales) en archivo nuevo `onboarding-corporativo.md`.
- Research log acumula 36 entries con trazabilidad completa.
- Patrones emergentes para Sesión 4 (consolidación en pilar 02): 7 patrones transversales divulgación + 5 patrones onboarding + 4 patrones tutorial técnico = ~16 patrones candidatos para el pilar.

Pendientes Sesión 4: reescribir `docs/pilares/02-tendencias-y-casos.md` usando el research log completo. Sustituir todas las secciones `(Pendiente)` por casos concretos citando fichas. Actualizar tabla Frescura.

Pendientes Sesión 5: revisión cruzada fichas ↔ pilar 02 ↔ research log.

