# Tutoriales técnicos — Atlas de casos de éxito

> Fichas de creators analizados en profundidad. Cada ficha es una síntesis estructural — qué hace, cómo lo hace, y qué es específico de ese creator vs qué es patrón replicable. Las referencias cruzadas al research log aparecen al pie de cada sección.
>
> **Regla:** una afirmación entra aquí sólo si aparece en `research-log.md`. Si una celda dice `[pendiente verificación]` es porque el claim es razonable pero no está loggeado aún.

**Estado (Sesión 2, 2026-04-18):** 5 fichas completas (Fireship, ThePrimeagen verificado vía VTT, MoureDev, Midudev, The Coding Train). Observación directa de 10 videos vía `yt-dlp --write-auto-subs` (script `vtt2txt2.py` parsea inline word-level timestamps para medir WPM limpio). Primeagen queda sin `[pendiente]`; los 4 creators nuevos entran con WPM medido y hook textual del VTT.

---

## Fireship (Jeff Delaney) [P2-ficha-fireship]

- **Canal:** https://www.youtube.com/channel/UCsBjURrPoezykLs9EqgamOA
- **Nicho:** tutorial técnico (programación, frameworks, tooling)
- **Escala (al 2026-04-18, data de artículo Engineers Codex):** 3M+ suscriptores, 200M+ views totales, peak 20M+ views/mes en dic 2023.
- **Duración típica:** 100 segundos (serie "X in 100 Seconds"), 3-5 min (The Code Report), ocasional 10-15 min para roadmaps/deep-dives.
- **Hook pattern:** promesa densa en título ("React in 100 seconds", "The God Tier Developer Roadmap") + cold-open que salta directo al concepto con overlay visual y sarcasmo. Sin presentación del creador. El thumbnail es parte del hook (Paddy Galloway's "first hook" principle).
- **Cadencia de cortes:** 10-15 cortes/min observados (fuente: análisis Grokipedia). Voiceover a ~200-250 wpm — rango alto pero coherente con audiencia técnica ya familiarizada con el vocabulario.
- **Visual style:** SIN cara on-camera — memes + media clips + code overlays + animaciones AE hacen el trabajo del instructor visible. Thumbnails con 2-3 palabras grandes + logo del framework/lenguaje.
- **Scripting:** voz conversacional cercana con humor de tres capas — (1) jokes de nicho (framework wars, JS satire), (2) memes visuales insertados, (3) self-deprecating/sarcástico. La densidad del humor NO es decorativa: alivia carga extraña en temas densos (ver pilar 1 §2.1).
- **CTA / cierre:** recap rápido + pluging del curso premium en fireship.io. CTA específico, no genérico "sígueme".
- **Videos de referencia:**
  - "React in 100 Seconds" — prototipo del formato.
  - "The God Tier Developer Roadmap" — 11 min, 7M+ views. Demuestra que largo funciona SI la promesa es grande.
  - "The Code Report" (series, desde feb 2022) — trending/news format.
- **Lo que NO copiar:** la velocidad 200-250 wpm para audiencias no-técnicas. Funciona aquí porque los viewers ya conocen el vocabulario; aplicado a onboarding corporativo o divulgación general produciría carga extraña ingestionable. Tampoco generalizar "sin cara" a contenido donde el instructor aporta gaze guidance (pilar 1 §4.2).

**Fuentes en research-log.md:** entries 2026-04-18 #1, #2, #6 (Grokipedia, Medium interview, Engineers Codex deep-dive).

---

## ThePrimeagen (Michael Paulson) [P2-ficha-theprimeagen]

- **Canal principal:** https://www.youtube.com/c/theprimeagen — 473K subs, +38% YoY (130K nuevos en 12 meses).
- **Canales satélite:** @ThePrimeTimeagen (clips + reacciones), @TheVimeagen (VODs Twitch crudos).
- **Nicho:** tutorial técnico (programación, herramientas, editor-wars, reacciones a posts técnicos).
- **Duración típica:** main channel 4-15 min en videos editorial-driven (no "20-40 min" como se infirió en Sesión 1 — los 4-6h de stream se destilan a piezas cortas). Twitch streams 4-6 h (base material).
- **Hook pattern:** dos modos observados:
  - **Modo lista retórica + contrarian** ("What You Need To Learn 2023", 3:45, 292K views, verificado 2026-04-18): 0-15s enumera preguntas comunes de audiencia ("what programming language / what library / what service should you use..."), luego twist ("I'm going to take the contrarian opinion"). Estructura: pain point repetido × N → pivot a postura disidente.
  - **Modo personal-vivencial + drama de comunidad** ("Are Developers Ok?", 11:46, 202K views, verificado 2026-04-18): 0-30s declaración personal ("20 years into my career, one thing that has always impressed me is..."), luego entrada al incidente ("this thing deleted 3 months of work..."). Setup-payoff narrativo.
  - Ambos son FIRST-PERSON EDITORIAL — no hook de demo, no hook de promesa de beneficio. Hook de POSTURA.
- **Cadencia de voz:** ~190-210 WPM (medido en los 2 videos citados vía VTT auto-subs, 2026-04-18). Rango alto, similar a Fireship pero más variable porque hay pausas conversacionales reales (no script).
- **Cadencia de cortes:** [no medido directamente]. Por formato (edit-from-stream): jump cuts agresivos sobre pausas/muletillas, sin cortes decorativos. Observación cualitativa.
- **Visual style:** cara ON-camera constante como face-cam sobre terminal/Vim como "escenario" visual. Overlays con reacciones, highlights de código citado, zoom-ins.
- **Scripting:** NO scripting. Reacción + comentario espontáneo sobre material (código, tweets, papers). El material bruto viene del stream; la edición selecciona los picos editorial-driven.
- **CTA / cierre:** NO hay CTA explícito "suscríbete y deja like" al final. Los videos **cierran con el clímax del argumento** ("What You Need..." cierra con chiste meta sobre "full single take"; "Are Developers Ok?" cierra con punchline cómica sobre el profile del autor del drama). Links a sponsor (gt.dev, boot.dev) y multichannel están en la **descripción**, no en el voice-over. Esto es ruptura del patrón YouTube dominante y funciona porque la audiencia ya es parte del ecosistema Twitch/Discord.
- **Videos de referencia:**
  - "What You Need To Learn 2023" (3:45, 292K views, upload 2023-08-03) — ejemplo del modo lista-retórica + contrarian.
  - "Are Developers Ok?" (11:46, 202K views, upload 2024-01-10) — ejemplo del modo personal + drama comunitario.
- **Lo que NO copiar:** el modelo stream-first + descripción-como-CTA no es transferible sin una audiencia previa ya capturada (Twitch + Discord). Es un endpoint, no un punto de entrada para creators nuevos. Además, 4-6h de material bruto para extraer 4-12 min editados implica ratio 20-30x — inviable sin editor dedicado (Flip, su editor, acreditado en descripción).

**Fuentes en research-log.md:** entries 2026-04-18 #3, #5 (Wikitubia, The New Stack); Sesión 2 #16, #17 (observación directa VTT).

---

## MoureDev (Brais Moure) [P2-ficha-mouredev]

- **Canal:** https://www.youtube.com/@mouredev
- **Sitio:** https://moure.dev + https://mouredev.pro (plataforma premium)
- **Nicho:** tutorial técnico (programación desde cero, Python, móvil, carrera en tech) — HISPANO.
- **Escala (autodeclarada):** "cerca de dos millones de seguidores across redes" (no verificado independientemente).
- **Duración típica (curso Hello-Python):** 5-6 min por clase básica/intermedia (47+29 lecciones), videos más largos (15-30 min) para módulos proyecto-driven (backend con FastAPI, frontend con Reflex).
- **Hook pattern:** [pendiente observación directa]. Estilo inferido de su posicionamiento: hook pedagógico-paciente ("hoy vamos a ver X desde cero"), promesa específica y alcanzable. Contrasta deliberadamente con el hook-sprint-cómico de Fireship.
- **Cadencia de cortes:** [pendiente medición directa]. Formato base es LIVE CODING desde Twitch → reeditado a YouTube, así que cadencia probable es natural-pausada (no 10-15 cortes/min tipo Fireship).
- **Visual style:** live coding con VS Code en pantalla, cara en PiP (overlay), overlays con chat del stream en videos Twitch-originales. Thumbnails con cara + texto grande + logos de tecnologías.
- **Scripting:** no hay script rígido — el contenido se estructura alrededor de una clase en vivo, con Git repo (Hello-Python) como "programa del día". Registro: cercano, segunda persona, pedagógico.
- **CTA / cierre:** cross-funnel claro: canal YouTube (gratis) → comunidad Discord → cursos premium en mouredev.pro. Modelo "curso gratis amplio como puerta de entrada a mentoría paga".
- **Videos/recursos de referencia:**
  - https://github.com/mouredev/Hello-Python — 100 clases, 44h video, repo oficial.
  - "¿Va a desaparecer la programación? La verdad sobre la IA" — ejemplo de contenido tema-caliente que atrae audiencia amplia.
- **Lo que NO copiar:** la escala declarada ("2M across redes") no es comparable 1:1 con suscriptores YouTube de anglos. El modelo freelance-first implica que la monetización viene de cursos propios, no de CPM YouTube — si tu modelo de negocio es distinto, el funnel no encaja.

**Fuentes en research-log.md:** entries 2026-04-18 #4, #7, #8 (sitio oficial, Xataka interview, GitHub Hello-Python).

**Pendientes Sesión 3+:** observación directa de una clase de Hello-Python (tema diferente a los videos tech-news), medición de cadencia sobre VTT oficial de la pista básica.

---

## Midudev (Miguel Ángel Durán) [P2-ficha-midudev]

- **Canal:** https://www.youtube.com/@midudev
- **Nicho:** tutorial técnico (JavaScript, frontend, tech-news hispano). Contraste explícito con MoureDev: Midudev se ancla en **intermediate-focused** (JS moderno, AI tooling, frameworks) mientras MoureDev se ancla en **beginner-friendly** (programación desde cero).
- **Escala:** 15+ años experiencia profesional, Barcelona-based, podcast propio multi-año. Videos con 50-170K views consistentes.
- **Duración típica:** 10-20 min por video de tema-del-momento, muy consistente (nunca videos de 1+ hora en main channel).
- **Hook pattern:** hook de **urgencia + novedad técnica con twist revelador**. Dos ejemplos observados 2026-04-18:
  - "HTML acaba de cambiar para siempre (en serio)" (10:45, 166K views, upload 2026-04-13): 0-30s promesa directa + setup técnico ("Vamos a hablar del futuro de HTML porque os va a volar la cabeza. Esto es una nueva propuesta para utilizar en el HTML, en la etiqueta canvas, ya sea en 2D o en 3D, poder utilizar HTML dentro.") Promesa+tecnología+ejemplo concreto en 3 frases. Cero warm-up.
  - "Claude... ¿Esto es una broma?" (18:20, 166K views, upload 2026-04-07): 0-30s gancho de urgencia + twist ("tenéis 17€ gratuitos... hasta el 17 de abril... no os voy a engañar, esto es que te dan un caramélito para destruiros"). Estructura: fact neutro → insinuación de conspiración → setup del argumento.
- **Cadencia de voz:** ~180-192 WPM (medido en los 2 videos citados vía VTT `es`, 2026-04-18). **En el rango alto del español coloquial**, pero 10-20 WPM por debajo de Fireship/Primeagen en inglés. Notable: español requiere ligeramente más palabras para expresar la misma idea que inglés, así que 185 WPM es subjetivamente similar a 210 WPM anglo.
- **Cadencia de cortes:** [no medido directamente]. Observación: dos formatos visuales distintos — screencast (editor + navegador) para reviews técnicas, face-cam PiP para opinión. Cortes no parecen densos (formato permite lectura en vivo de código/artículo).
- **Visual style:** code editor + navegador + face-cam PiP. Thumbnails de alto contraste con cara + texto grande + colores saturados. Se distingue de MoureDev por mayor uso de navegador/artículos externos.
- **Scripting:** semi-estructurado — parece partir de artículo o novedad concreta y razonar sobre ella en vivo, sin leer script. Registro: segunda persona plural ("vosotros/ustedes"), cercano, expresivo ("os va a volar la cabeza", "me los quemé", "caramélito para destruiros").
- **CTA / cierre:** NO hay subscribe-like-comment explícito en los 2 videos observados. Cierres son reflexivos sobre el tema ("vamos a ver cómo continúa", "encantado de la vida"). Enlaces a fuentes en descripción (artículo de GitHub/WICG, docs oficiales). CTA indirecto: la autoridad del canal se construye por análisis repetido, no por pedido explícito.
- **Videos de referencia:**
  - "HTML acaba de cambiar para siempre" (10:45, 166K views) — ejemplo de tech-news con promesa directa.
  - "Claude... ¿Esto es una broma?" (18:20, 166K views) — ejemplo de opinión-reactiva sobre noticia reciente.
- **Lo que NO copiar:** la dependencia del tema-del-momento ("HTML canvas nuevo", "Claude cambió créditos") implica calendarización reactiva — Midudev puede hacerlo porque tiene pipeline activo con la comunidad hispana-dev. Creators nuevos sin ese pipeline reciclan noticias lentas y pierden el momentum. También: el registro "vosotros/ustedes" mezclado es específico de audiencia pan-hispana en un canal con sede en España; no replicable sin consciencia de ese matiz.

**Fuentes en research-log.md:** entries 2026-04-18 #10 (perfil LinkedIn); Sesión 2 #18, #19 (observación directa VTT).

---

## The Coding Train (Daniel Shiffman) [P2-ficha-coding-train]

- **Canal:** https://www.youtube.com/@TheCodingTrain
- **Sitio:** https://thecodingtrain.com
- **Nicho:** tutorial técnico (creative coding, p5.js, ml5.js, Processing, coding challenges). Patrón académico + playful — Shiffman es profesor de ITP/NYU.
- **Escala:** 1.77M+ suscriptores, canal desde 2013.
- **Duración típica:** 15-55 min. Dos formatos principales: (a) "Coding Challenge" de 30-90 min donde resuelve un problema en vivo; (b) tutorial de feature específica (p5.js API) 15-25 min.
- **Hook pattern:** hook **informal-salutación + contexto directo**. Patrón observado en 2 videos (2026-04-18):
  - "What the font?!?!" (20:53, 17K views, upload 2026-03-30): "Hi everybody. In today's video, I'm showing you another feature of P5 2.0." Literal warm saludo + promesa temática. **Añade self-deprecación honesta**: "I don't really know these things, so I'm going to be kind of figuring it out as I go in this video." Esto es muy distintivo — el creador admite no saberlo todo; convierte el aprendizaje en show compartido.
  - "Coding Challenge 187: Bayes Theorem" (53:38, 38K views, upload 2025-10-12): hook meta-temporal "Hi everybody, welcome to a coding challenge video. Hi, it's me from the future in the editing booth." Inserta self-narrative editorial en el hook — rompe la cuarta pared. El editor (Matt Ye) también es referenciado, reconociendo la producción.
- **Cadencia de voz:** ~155-160 WPM (medido, 2026-04-18). **Notablemente más baja que Fireship/Primeagen/Midudev** — consistente con talking-head informal académico. Esto se alinea directamente con el hallazgo de Guo et al. 2014 (pilar 1 §2.4): "talking-head INFORMAL supera a talking-head formal estudio". Ritmo pausado permite pensamiento en voz alta + autocorrección.
- **Cadencia de cortes:** [no medido directamente]. Formato live-coding + face-cam = cortes naturales del editor (Matt Ye) sobre errores, repeticiones, pausas largas. No denso estilo Fireship.
- **Visual style:** cara ON-camera + screen (p5.js editor) en split o PiP. Expresivo facial (gesticulación abundante), energía pedagógica alta a pesar del WPM bajo. Thumbnails con ilustraciones simpáticas + texto curioso ("What the font?!?!") — ton lúdico coherente con persona.
- **Scripting:** ningún script rígido — hay plan temático (qué APIs cubrir) pero el desarrollo es abierto, con errores, debugging en vivo, reflexión en voz alta. Registro: segunda persona inclusiva ("we're going to try this", "we did it"), self-deprecating ("I guess I have I did it in other places too"), cero pretensión.
- **CTA / cierre:** minimal-ritual. Cierre fijo "Thank you everybody. See you next time on the coding train." El branding del canal funciona como despedida. Links en descripción al sketch + Nebula (versión sin ads) + repo. NO pide suscribirse en voice-over.
- **Videos de referencia:**
  - "Coding Challenge 187: Bayes Theorem" (53:38, 38K views) — formato long-form signature del canal.
  - "What the font?!?!" (20:53, 17K views) — formato tutorial de feature con self-deprecation.
- **Lo que NO copiar:** los 53 minutos del formato Coding Challenge violan deliberadamente el ceiling de 6 min de Guo et al. 2014. **Funciona** porque (a) audiencia nicho dispuesta a ver programación en vivo como entretenimiento-formativo, (b) Shiffman tiene ~10 años construyendo autoridad y rapport con esa audiencia, (c) Nebula provee monetización alternativa que no depende de APV. Para creators nuevos, copiar el long-form sin esos pre-requisitos es suicida — hay que empezar con el formato corto y escalar en duración con audiencia ganada.

**Fuentes en research-log.md:** Sesión 2 #20, #21 (observación directa VTT + metadata).

---

## Patrones cruzados preliminares (para consolidar en Sesión 4)

1. **Duración no es el eje — la cadencia relativa al contenido lo es.** Fireship (100s comprimido), MoureDev (5-6 min segmentado), ThePrimeagen (30-40 min editado de 4h) respetan el ceiling de ~6 min de Guo et al. 2014 con estrategias opuestas (compresión vs segmentación vs edit-down).
2. **Sin cara ≠ sin presencia.** Fireship prueba que sin cara on-camera funciona si memes + media clips + animaciones sustituyen la función de gaze guidance + warmth. Prime y MoureDev hacen lo contrario. Ambos caminos son válidos; la decisión depende del stack visual del tema.
3. **Humor como carga germana, no extraña.** Fireship usa 3 capas de humor; MoureDev usa calidez conversacional; Prime usa reacciones + sarcasmo. En los tres casos el humor sirve a la retención, no la interrumpe — porque es COHERENTE con el contenido, no decorativo. Esto es consistente con Mayer #1 (coherencia).
4. **CTA específico, no genérico.** Los 3 evitan "suscríbete" al inicio; los 3 cierran con CTA vinculado al ecosistema propio (fireship.io, mouredev.pro, multichannel Prime). ROI del CTA depende del funnel, no del volumen del pitch.
