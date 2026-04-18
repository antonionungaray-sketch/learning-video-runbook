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


