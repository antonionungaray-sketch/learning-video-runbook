# Tutoriales técnicos — Atlas de casos de éxito

> Fichas de creators analizados en profundidad. Cada ficha es una síntesis estructural — qué hace, cómo lo hace, y qué es específico de ese creator vs qué es patrón replicable. Las referencias cruzadas al research log aparecen al pie de cada sección.
>
> **Regla:** una afirmación entra aquí sólo si aparece en `research-log.md`. Si una celda dice `[pendiente verificación]` es porque el claim es razonable pero no está loggeado aún.

**Estado de esta sesión (2026-04-18):** 3 fichas borrador (Fireship, ThePrimeagen, MoureDev). 2-3 fichas más pendientes para Sesión 2.

---

## Fireship (Jeff Delaney)

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

## ThePrimeagen (Michael Paulson)

- **Canal principal:** https://www.youtube.com/c/theprimeagen — 473K subs, +38% YoY (130K nuevos en 12 meses).
- **Canales satélite:** @ThePrimeTimeagen (clips + reacciones), @TheVimeagen (VODs Twitch crudos).
- **Nicho:** tutorial técnico (programación, herramientas, editor-wars, reacciones a posts técnicos).
- **Duración típica:** main channel ~20-40 min (videos editados de streams), canales satélite 5-15 min (clips), Twitch streams 4-6 h (base material).
- **Hook pattern:** [pendiente verificación en video directo]. Se infiere del posicionamiento "anti-elitismo creativo" que el hook apela a (a) relatability ("tú también puedes ser rápido con vim"), (b) humor desmitificador ("Squeal" por SQL), (c) espectáculo (Vim mastery en vivo).
- **Cadencia de cortes:** [pendiente medición directa]. Inferencia: cortes agresivos en el main channel (edit-from-stream a video digerible), cadencia natural de livestream en VODs crudos.
- **Visual style:** cara ON-camera constante, Vim/terminal como "escenario" visual principal. Overlays con reacciones o highlights.
- **Scripting:** NO scripting. Es reacción en vivo + comentario espontáneo. El material bruto viene del stream; la edición selecciona los picos. Esto es una inversión del flujo Fireship (scripted → producido) — aquí es producido → editado → distribuido.
- **CTA / cierre:** [pendiente verificación]. Ecosistema multi-canal implica que el CTA sea cross-channel ("si quieres el stream entero, vete a @TheVimeagen").
- **Videos de referencia:**
  - "ThePrimeagen & Rich Harris AMA" — formato entrevista.
  - "ThePrimeagen explains Neovim to Lex Fridman" — clip de alto view count.
- **Lo que NO copiar:** el modelo stream-first no es transferible sin una audiencia previa ya capturada. Es un endpoint, no un punto de entrada para creators nuevos. Además, 4-6h de material bruto para extraer 20-40 min editados implica ratio 6-9x — inviable sin workflow específico de edición.

**Fuentes en research-log.md:** entries 2026-04-18 #3, #5 (Wikitubia, The New Stack).

**Pendientes Sesión 2:** observación directa de 2-3 videos main channel, medición de cadencia, captura de hook específico, confirmación de estrategia de CTA.

---

## MoureDev (Brais Moure)

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

**Pendientes Sesión 2:** observación directa de una clase de Hello-Python (hook + cadencia), de un video temático (como "¿Va a desaparecer la programación?"), y comparación explícita MoureDev vs Midudev (otro hispano top) para contraste de estilos dentro del nicho hispano.

---

## Patrones cruzados preliminares (para consolidar en Sesión 4)

1. **Duración no es el eje — la cadencia relativa al contenido lo es.** Fireship (100s comprimido), MoureDev (5-6 min segmentado), ThePrimeagen (30-40 min editado de 4h) respetan el ceiling de ~6 min de Guo et al. 2014 con estrategias opuestas (compresión vs segmentación vs edit-down).
2. **Sin cara ≠ sin presencia.** Fireship prueba que sin cara on-camera funciona si memes + media clips + animaciones sustituyen la función de gaze guidance + warmth. Prime y MoureDev hacen lo contrario. Ambos caminos son válidos; la decisión depende del stack visual del tema.
3. **Humor como carga germana, no extraña.** Fireship usa 3 capas de humor; MoureDev usa calidez conversacional; Prime usa reacciones + sarcasmo. En los tres casos el humor sirve a la retención, no la interrumpe — porque es COHERENTE con el contenido, no decorativo. Esto es consistente con Mayer #1 (coherencia).
4. **CTA específico, no genérico.** Los 3 evitan "suscríbete" al inicio; los 3 cierran con CTA vinculado al ecosistema propio (fireship.io, mouredev.pro, multichannel Prime). ROI del CTA depende del funnel, no del volumen del pitch.
