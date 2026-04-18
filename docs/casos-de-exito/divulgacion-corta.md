# Divulgación (corta y larga) — Atlas de casos de éxito

> Fichas de creators de divulgación analizados. Nota sobre el nombre: el archivo se llamó "divulgacion-corta" por convención inicial del atlas, pero los creators de divulgación rigurosa en YouTube operan mayoritariamente en long-form (20-60 min). Se mantiene el nombre de archivo por estabilidad de enlaces; el contenido cubre divulgación en cualquier duración.
>
> **Regla:** una afirmación entra aquí sólo si aparece en `research-log.md`. Si una celda dice `[no medido]` o `[pendiente]`, es porque la observación aún no se hizo. No se infieren métricas.

**Estado (Sesión 3, 2026-04-18):** 5 fichas (3Blue1Brown, Veritasium, Kurzgesagt, DotCSV, QuantumFracture). Observación directa de 10 videos vía VTT auto-subs. Cierra el nicho divulgación con 3 anglos y 2 hispanos — balance razonable para generalización.

---

## 3Blue1Brown (Grant Sanderson)

- **Canal:** https://www.youtube.com/@3blue1brown
- **Sitio:** https://www.3blue1brown.com
- **Nicho:** divulgación matemática (cálculo, álgebra lineal, transformadas, teoría de números, probabilidad, teoría de grupos, ML).
- **Escala:** 6M+ suscriptores, videos 1-5M+ views regulares. Líder absoluto del nicho matemático en YouTube.
- **Duración típica:** 15-50 min. Los 2 videos observados (2026-04-18) duran 29:40 y 34:41. Sanderson produce pocos videos al año (3-6) y cada uno es denso.
- **Hook pattern:** dos variantes observadas:
  - **Modo personal-anecdótico → matemático** ("The Hairy Ball Theorem", 29:40, 2.6M views, upload 2026-01-31): 0-30s entra por anécdota íntima — "These days, whenever I look at the back of my beloved 7-month-old baby's head, this little swirl of tiny hairs reminds me of one of the most ridiculously named facts in math, the hairy ball theorem." Patrón: detalle doméstico específico → conexión inesperada con objeto matemático. Funciona como entrada emocional antes de cualquier carga cognitiva.
  - **Modo visual-promesa** ("But what is a Laplace Transform?", 34:41, 1.5M views, upload 2025-10-12): 0-30s apunta al screen — "What you're looking at, a somewhat complicated diagram that you and I are going to build up in this video, is a visualization unpacking the meaning behind one of the most powerful tools..." Promesa visual + analogía pedagógica ("learning how to drive a car versus learning how an engine works").
- **Cadencia de voz:** ~183-192 WPM (medido vía VTT, 2026-04-18). **Rango alto-normal para anglo.** Llamativo porque la impresión subjetiva del canal es "pausado" — la sensación de lentitud viene de los **silencios visuales** entre ideas (la animación tarda en desplegarse), no de velocidad de habla.
- **Cadencia de cortes (visual):** [no medido directamente]. Observación: el canal usa **"Khan-style tablet drawings"** con animación Manim (motor custom de Sanderson, Python) — cada ilustración se dibuja/transforma en tiempo real, NO hay cortes de cámara (no hay cámara). Esto es exactamente el patrón validado por Guo et al. 2014 §pilar 1 §2.4 como SUPERIOR a screencasts o slides estáticas.
- **Visual style:** SIN cara on-camera (como Fireship), pero el canal visual está completamente ocupado por animación matemática densa. Pizarra negra + curvas coloreadas (paleta 3blue1brown) + texto matemático. Ningún meme ni humor visual. Thumbnails con ilustración central + título corto.
- **Scripting:** altamente scripted. Sanderson ha dicho en entrevistas que escribe guion palabra-por-palabra antes de animar. La narración en voz se coordina con la animación exactamente. Registro: segunda persona inclusiva ("you and I are going to build up"), tono de profesor que respeta al oyente.
- **CTA / cierre:** NO hay CTA de suscribirse. Los cierres son **promesa de continuación narrativa** ("In the final chapter of the sequence, I want to show you how you could reinvent the Laplace transform from scratch. I'll see you there."). Monetización vía **Patreon + no-ads** (cita en descripción: "Instead of sponsored ad reads, these lessons are funded directly by viewers"). Modelo de negocio contradice el default de YouTube — Sanderson puede permitírselo por escala consolidada.
- **Videos de referencia:**
  - "The Hairy Ball Theorem" (29:40, 2.6M views) — hook anecdótico + matemática topológica.
  - "But what is a Laplace Transform?" (34:41, 1.5M views) — hook visual-promesa + larga-forma didáctica.
- **Lo que NO copiar:** el modelo "escribo mi propio motor de animación (Manim) y hago 3-6 videos al año" es irreplicable para un creator nuevo. Manim tardó años en madurar y ahora existe versión comunitaria (ManimCommunity) — usar eso como atajo es válido, pero producir 30 minutos de animación matemática de calidad sigue requiriendo semanas de trabajo por video. Tampoco copiar la ausencia de sponsors si no tienes base de Patreon consolidada — el cierre "I'll see you there" solo funciona cuando la audiencia ya está comprometida.

**Fuentes en research-log.md:** Sesión 2 #22, #23 (observación directa VTT "The Hairy Ball Theorem" + "Laplace Transform").

---

## Veritasium (Derek Muller)

- **Canal:** https://www.youtube.com/@veritasium
- **Nicho:** divulgación científica general (física, ingeniería, paradojas matemáticas, historia de la ciencia, tecnología).
- **Escala:** 17M+ suscriptores. Videos top alcanzan 8-13M+ views. PhD en educación física de la Universidad de Sydney (tesis específica sobre videos educativos, 2008) — Muller publicó investigación académica sobre por qué los videos que confirman concepciones erróneas previas fallan en cambiar comprensión vs los que las exponen primero. Ese framework sigue siendo rector del canal.
- **Duración típica:** 15-30 min por video; algunos llegan a 50-60 min para temas históricos profundos.
- **Hook pattern:** dos variantes observadas, ambas estructuradas como **setup dramático en 0-30s**:
  - **Modo pregunta directa + demo física** ("Why are these 3 letters on almost all of my zippers?", 20:45, 8.1M views, upload 2026-03-19): "How does a zipper actually work? Like try to push down on a zipper from above and it probably won't budge. But if you just use the pull tab, suddenly it's buttery smooth." Sigue con wow-fact escalonado ("We've made more zippers than there are stars in the Milky Way"). Estructura: pregunta contraintuitiva → demo invitada ("try to") → magnitud cósmica.
  - **Modo montaje social-dramático** ("This Paradox Splits Smart People 50/50", 25:40, 7.1M views, upload 2026-03-09): 0-30s montaje de voces múltiples ("No. What?", "It just seems so obvious to me", "Now I'm all screwed up, man", "I even argued with Derek about it. There's no way."). Es CINE-documental, no tutorial. Genera tensión antes de revelar el problema.
- **Cadencia de voz:** ~174-181 WPM (medido, 2026-04-18). **Notablemente más pausada que 3Blue1Brown** — Muller usa pausas para énfasis, silencios para que la audiencia procese la pregunta. Narración cinematográfica, no expositiva.
- **Cadencia de cortes:** [no medido directamente]. Observación: alta variedad visual — face-cam on-location (Muller en escenarios físicos), B-roll denso (cámaras lentas, microscopía, animaciones), cortes a entrevistas con expertos. NO screencast.
- **Visual style:** cara ON-camera en campo + B-roll de alta producción + animaciones explicativas. Thumbnails con objeto físico + texto corto + color saturado. Estilo documental HBO/Netflix aplicado a ciencia.
- **Scripting:** altamente scripted. Muller y su equipo redactan guiones completos; las entrevistas se editan al script maestro. Registro: inclusivo ("we've made... than there are stars..."), pero más narrativo-documental que conversacional.
- **CTA / cierre:** **pitch de sponsor integrado al cierre** es el patrón dominante de Veritasium. "Paradox" cierra con 45s de Brilliant ("Brilliant's course on Bayes and probability goes through that exact problem... learn on Brilliant for free for a full 30 days..."). "Zipper" cierra con reflexión personal sobre el invento (sponsor está al INICIO via Hostinger "Host OpenClaw on Hostinger VPS"). **La posición del sponsor varía por video**: temas conceptuales (Brilliant) → cierre; temas producto-centrados (Hostinger con infra) → pre-roll. Esto es decisión estratégica, no consistente.
- **Videos de referencia:**
  - "Why are these 3 letters on almost all of my zippers?" (20:45, 8.1M views) — ejemplo de divulgación de objeto cotidiano.
  - "This Paradox Splits Smart People 50/50" (25:40, 7.1M views) — ejemplo de hook social-dramático + sponsor al cierre.
- **Lo que NO copiar:** la producción de Veritasium (viajes on-location, equipos de cámara, entrevistas con expertos, B-roll cinematográfico) tiene costos de decenas de miles de dólares por video. Creators nuevos que intenten copiar el formato sin equipo quedan atrapados en producción sin velocidad de publicación. Tampoco copiar el hook de "montaje de voces" sin tener acceso a múltiples entrevistados (funciona por la polifonía, no por el guion).

**Fuentes en research-log.md:** Sesión 2 #24, #25 (observación directa VTT "Zippers" + "Paradox").

---

## Kurzgesagt – In a Nutshell (Philipp Dettmer + team)

- **Canal:** https://www.youtube.com/@kurzgesagt
- **Sitio:** https://kurzgesagt.org
- **Nicho:** divulgación científica generalista (cosmología, biología, existencial-filosófica, riesgos globales). **Animación 2D full-team** — el único creator del atlas que es estudio, no persona.
- **Escala:** 20M+ suscriptores. Videos top alcanzan 6-40M+ views. Equipo de ~40 personas entre script, animación, música (Epic Mountain), narración.
- **Duración típica:** 9-13 min por video estándar; ocasionales 1h para retrospectives ("All Of Human History In One Hour", 63:23, 3M views).
- **Hook pattern:** "fact wow-scale + contradicción implícita". Dos ejemplos observados (2026-04-18):
  - "This Is the Scariest Place in The Universe" (9:13, 6.4M views, upload 2026-03-10): "The vast majority of the cosmos is voids. Gigantic, unfathomably large spaces of empty nothingness. Bubbles of eternal night stretching hundreds of millions of light years..." Escala inhumana primero, consecuencias después. Narrativa "descubre lo que te rodea". No hay presentador ni interlocutor.
  - "Why Are There No Holes Around Trees?" (11:20, 3.9M views, upload 2026-01-07): "Trees are the heaviest and largest living things on Earth, with the most massive tree weighing almost 2,000 tons, as much as 10 blue whales. But instead of floating weightlessly in the ocean, it reaches 25 stories into the sky, held in place by surprisingly shallow roots." Patrón: dato colosal → paradoja aparente → pregunta del título.
- **Cadencia de voz:** **147-165 WPM** medidos (2026-04-18). **El WPM más bajo del atlas** (junto con The Coding Train). Importante: scripted + animado dense NO correlaciona con WPM alto. La pausa oral da tiempo a procesar la imagen animada. El creador asume carga visual mayor → aligera carga auditiva.
- **Cadencia de cortes (visual):** [no medido directamente]. La animación 2D tiene cambios de escena frecuentes pero no "cortes" en sentido de cámara — son transiciones dibujadas. Rítmicamente, cada "idea" tiene 3-8s de ilustración antes de pasar a la siguiente.
- **Visual style:** SIN cara on-camera (como 3B1B y Fireship). Estilo visual unificado — personajes geométricos ("Duck & Co"), paleta pastel saturada, tipografía custom. El estilo es parte del branding; Kurzgesagt es reconocible en 2s.
- **Scripting:** 100% scripted por el equipo, sourceado (sources linkeados en descripción vía google sites — práctica rigurosa). El guion se coordina con la animación antes de producir.
- **CTA / cierre:** **sponsor Brilliant integrado al cierre** (idéntico a Veritasium "Paradox"): 45s completos con pitch "To explore everything Brilliant has to offer for free for a full 30 days, go to brilliant.org/nutshell..." Cuando NO hay sponsor, cierre es plug del shop propio ("space souvenirs drop... pick up a few souvenirs... created with lots of care by our team"). Modelo: sponsor externo O merch propio, nunca "suscríbete".
- **Videos de referencia:**
  - "This Is the Scariest Place in The Universe" (9:13, 6.4M views) — hook cosmológico puro.
  - "Why Are There No Holes Around Trees?" (11:20, 3.9M views) — hook paradoja + título con pregunta.
- **Lo que NO copiar:** el modelo "equipo de 40 con animación 2D unificada" tarda años en construirse y requiere inversión sostenida. La pausa oral (147 WPM) funciona SÓLO porque la animación lleva la carga. Intentar 147 WPM con screencast sin equivalente visual produce aburrimiento. Tampoco copiar "sin cara" sin alternativa visual compensatoria — Kurzgesagt tiene ejército de Ducks; si tu video sólo tiene slides, el canal visual está vacío.

**Fuentes en research-log.md:** Sesión 3 #26, #27 (observación directa VTT Kurzgesagt).

---

## DotCSV (Carlos Santana Vega)

- **Canal:** https://www.youtube.com/@DotCSV
- **Canal secundario:** NotCSV / DotCSV Lab (cadencia mayor, cobertura de actualidad IA).
- **Nicho:** divulgación especializada en **Inteligencia Artificial** — papers, anuncios corporativos, explainers técnicos de arquitecturas ML. Español peninsular, audiencia intermedio-avanzada.
- **Escala:** ~850K suscriptores, videos 150-370K views. Referente hispano top del nicho IA.
- **Duración típica:** 18-28 min. Formato "análisis completo" o "explainer técnico" — no videos cortos.
- **Hook pattern:** "re-anclaje serial + setup editorial". Patrón característico:
  - "Camino a las IAs con RAZONAMIENTO SOBREHUMANO" (22:57, 289K views, upload 2024-09-29): "Hace una semana OpenAI dio inicio a la segunda fase de su hoja de ruta tras conquistar con los modelos GPT la capacidad de que una máquina domine el uso del lenguaje. Su objetivo ahora con la salida de los nuevos modelos o1 es darle a la Inteligencia artificial la capacidad de razonar..." Re-anclaje temporal ("hace una semana") + continuidad con videos previos ("tras conquistar...").
  - "¡EMPIEZA A USAR la IA GRATIS en tu PC!" (27:59, 367K views, upload 2024-08-04): "Hace unos meses estuvimos hablando del papel privilegiado que tiene NVIDIA dentro de la batalla... en aquel vídeo, si recordáis, pues nos centramos más en entender la parte de la nube..." Literal referencia explícita a video previo del canal.
  - **Patrón distintivo:** el canal asume audiencia recurrente. NO hay onboarding de newbies en el hook — entras al serial por el medio o desde el inicio, pero el hook no te espera.
- **Cadencia de voz:** **176-182 WPM** (medido, 2026-04-18). **Dentro del rango alto hispano**, similar a Midudev. Consistente con audiencia IA técnica ya familiarizada con el vocabulario.
- **Cadencia de cortes:** [no medido directamente]. Formato: face-cam + slides con gráficos + papers + screenshots. Cortes editoriales donde cambia la visualización.
- **Visual style:** face-cam en estudio + slides tipo presentación académica + papers reales embedded + screenshots de arquitecturas/benchmarks. Thumbnails sobrios: cara + título corto + logo de la tecnología.
- **Scripting:** semi-scripted. Hay estructura clara (el "análisis en profundidad" tiene secciones predecibles: contexto → arquitectura → demo/benchmark → implicaciones), pero entrega conversacional-académica.
- **CTA / cierre:** **explícito y completo** — único creator del atlas con pitch clásico "si os ha gustado el vídeo, no dejéis de compartirlo, no dejéis de apoyarlo, dejad vuestro me gusta y vuestros comentarios con vuestras opiniones..." + cross-plug al canal secundario DotCSV Lab. CONTRADICE el patrón mayoritario anti-"suscríbete" de los demás creators del atlas. Flag para pilar 02: **el CTA explícito sigue siendo válido en comunidades hispanas intermedias donde la expectativa cultural lo espera**. No es anti-patrón universal.
- **Videos de referencia:**
  - "Camino a las IAs con RAZONAMIENTO SOBREHUMANO" (22:57, 289K views) — ejemplo de explainer técnico de paper/anuncio.
  - "¡EMPIEZA A USAR la IA GRATIS en tu PC!" (27:59, 367K views) — ejemplo de utility-video orientado a acción.
- **Lo que NO copiar:** el modelo "canal de actualidad especializada" requiere mantener pipeline con papers + releases + benchmarks. Ritmo de 18-28 min por video es exigente. Tampoco copiar el hook "hace una semana..." sin tener audiencia serial ya capturada — un creador nuevo necesita hooks self-contained. El CTA explícito de suscribirse es válido pero NO es universal — evaluar la comunidad antes de aplicarlo.

**Fuentes en research-log.md:** Sesión 3 #28, #29 (observación directa VTT DotCSV).

---

## QuantumFracture (José Luis Crespo)

- **Canal:** https://www.youtube.com/@QuantumFracture
- **Nicho:** divulgación de física (relatividad, cosmología, cuántica, filosofía de la ciencia) — español. Persona identificable, autoría única.
- **Escala:** 3M+ suscriptores. Videos con 150K-1.2M views. Referente hispano en física divulgativa.
- **Duración típica:** 10-25 min para videos estándar; series largas ocasionales (podcast Quantum FM aparte).
- **Hook pattern:** dos variantes observadas:
  - **Modo alegórico-literario** ("¿El Espacio es una Ilusión?", 25:38, 463K views, upload 2025-12-23): 0-30s reescribe la alegoría de la caverna de Platón — "Estás en una cueva de cara a una pared. Llevas allí desde que naciste, atado de tal forma que no puedes girar el cuello. Detrás de ti hay una hoguera..." No menciona física en los primeros 30s. Segunda persona absorbente + narración ficticia → preparación para el concepto duro (principio holográfico).
  - **Modo directo + humor autoconsciente** ("¿Por qué Queremos Volver a la Luna?", 11:47, 1.2M views, upload 2026-04-01): "Volvemos a la Luna. Hacía más de 50 años que no enviábamos una misión tripulada, pero eso ya es historia. Hace nada ha despegado Artemis 2..." + break self-aware: "Para mí es muy emocionante. Es normal. Soy un friky que sube vídeos a internet."
- **Cadencia de voz:** **167-170 WPM** (medido, 2026-04-18). **Rango medio hispano**, entre Kurzgesagt (bajo) y DotCSV (alto). Ritmo escogido permite pausas dramáticas y narración.
- **Cadencia de cortes:** [no medido directamente]. Formato: face-cam en estudio + animaciones 3D (física/espacio) + B-roll NASA + gráficos. Producción alta pero única-persona (no equipo Kurzgesagt).
- **Visual style:** face-cam con estudio identificable (librería/muralla colorida) + overlays animados + material real de agencias (NASA, ESA). Thumbnails con cara + título intrigante + imagen impactante (galaxia, nave).
- **Scripting:** altamente scripted. Crespo publica los guiones a veces como posts o los adapta al podcast. Registro: literario-accesible, segunda persona ocasional, humor autoreferencial ocasional ("soy un friky...").
- **CTA / cierre:** plantilla cerrada — "Y ya sabes, si quieres más ciencia, solo tienes que suscribirte. Y gracias por vernos." Directo pero ritual-breve (no los 45s de Kurzgesagt/Veritasium). Adicionalmente cross-plug a **Quantum FM** (podcast complementario) + Brilliant sponsor integrado ocasional. Modelo: sponsor + suscripción clásica + cross-promoción a formato largo.
- **Videos de referencia:**
  - "¿El Espacio es una Ilusión?" (25:38, 463K views) — ejemplo de hook alegórico.
  - "¿Por qué Queremos Volver a la Luna?" (11:47, 1.2M views) — ejemplo de hook directo + humor self-aware.
- **Lo que NO copiar:** el hook alegórico requiere capacidad literaria genuina — entrar por Platón y aterrizar en el principio holográfico es difícil. Los creators que intentan "hook narrativo" sin conexión real con el concepto terminan en pretención vacía. Tampoco copiar el cross-plug a podcast si no existe el podcast — Quantum FM es pilar de la monetización del ecosistema Crespo y NO se improvisa.

**Fuentes en research-log.md:** Sesión 3 #30, #31 (observación directa VTT QuantumFracture).

---

## Patrones cruzados preliminares divulgación (para consolidar en Sesión 4)

1. **Hook no vende el tema; pre-vende la curiosidad.** 3B1B entra por bebé (nada de matemáticas), Veritasium entra por "zipper not budging" (nada de metalurgia). El tema real viene a los 30-60s. Esto es distinto de tutorial técnico (Fireship/Midudev) donde el tema está en los primeros 5 segundos. **Divulgación vende por qué importa; tutorial vende qué se aprende.**
2. **Cadencia de voz no correlaciona linealmente con densidad percibida.** 3B1B a 190 WPM se siente más "pausado" que Veritasium a 175 WPM. Variable oculta: **tiempo visual entre ideas** (la animación Manim tarda; el B-roll Veritasium está montado denso). Para el creador, esto significa que el ritmo no se optimiza sólo por WPM — el ritmo visual importa tanto o más.
3. **Monetización divergente determina CTA.** 3B1B (Patreon no-ads) → cierre narrativo. Veritasium (sponsor integrado) → cierre con pitch de 30-45s. Para un creador hispano del nicho divulgación, la decisión "patreon vs sponsor vs ad-revenue" determina la estructura del cierre — no se copia el cierre sin copiar el modelo de negocio.
4. **Sin cara on-camera es una opción legítima en divulgación.** 3B1B sostiene 6M+ subs sin mostrar nunca al creador; Kurzgesagt lleva el extremo al tener equipo de 40 personas y NUNCA mostrar a ninguna. Suficiente evidencia para añadir al catálogo de decisiones de producción: "cara vs animación" no es obligatorio. Pilar 1 §2.3 #12 (imagen del instructor) es condicional, no default.

5. **CTA explícito "suscríbete" NO es anti-patrón universal — depende de comunidad.** Los 4 anglos (3B1B, Veritasium, Kurzgesagt) + 1 hispano (QuantumFracture) evitan el pitch explícito o lo reducen a una frase ritual. **DotCSV es el único que hace el pitch completo "dejad vuestro me gusta, comentarios, compartid..."** y tiene engagement consistente. Interpretación: en comunidades hispanas de nicho técnico (IA), el CTA explícito sigue siendo expectativa cultural; el creador que lo omite puede parecer distante. Flag para skill `publicacion-entrenamiento`: evaluar la comunidad objetivo antes de aplicar el default "anti-suscribete".

6. **Sponsor Brilliant como patrón transversal de divulgación.** 3 de 5 creators en divulgación (Veritasium, Kurzgesagt, QuantumFracture) integran Brilliant como sponsor recurrente. Es el canal preferido para divulgación técnica por ser producto afín (cursos online de temas mathy/sciency). Aporta framework replicable: "el sponsor que encaja con la promesa del tema converge naturalmente al nicho". Brillante para divulgación, Hostinger para dev, Skillshare para creativo.

7. **WPM bajo no es lentitud — es gestión de carga total.** Kurzgesagt 147 WPM + The Coding Train 156 WPM demuestran que el WPM baja cuando el canal visual carga más (animación densa o live-coding). El creador intuye el principio de modalidad de Mayer (pilar 1 §2.3 #4): no saturar los dos canales simultáneamente. Creators que forcejean WPM alto sobre visuales densos producen cansancio — lo han medido sólo por feedback, no por experimentación.
