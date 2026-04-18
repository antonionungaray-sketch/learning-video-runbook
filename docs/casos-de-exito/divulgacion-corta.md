# Divulgación (corta y larga) — Atlas de casos de éxito

> Fichas de creators de divulgación analizados. Nota sobre el nombre: el archivo se llamó "divulgacion-corta" por convención inicial del atlas, pero los creators de divulgación rigurosa en YouTube operan mayoritariamente en long-form (20-60 min). Se mantiene el nombre de archivo por estabilidad de enlaces; el contenido cubre divulgación en cualquier duración.
>
> **Regla:** una afirmación entra aquí sólo si aparece en `research-log.md`. Si una celda dice `[no medido]` o `[pendiente]`, es porque la observación aún no se hizo. No se infieren métricas.

**Estado (Sesión 2, 2026-04-18):** 2 fichas borrador (3Blue1Brown, Veritasium). Observación directa de 4 videos via VTT auto-subs. 2-3 fichas más pendientes para Sesión 3 (Kurzgesagt animado, Steve Mould, hispano DotCSV o QuantumFracture).

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

## Patrones cruzados preliminares divulgación (para consolidar en Sesión 4)

1. **Hook no vende el tema; pre-vende la curiosidad.** 3B1B entra por bebé (nada de matemáticas), Veritasium entra por "zipper not budging" (nada de metalurgia). El tema real viene a los 30-60s. Esto es distinto de tutorial técnico (Fireship/Midudev) donde el tema está en los primeros 5 segundos. **Divulgación vende por qué importa; tutorial vende qué se aprende.**
2. **Cadencia de voz no correlaciona linealmente con densidad percibida.** 3B1B a 190 WPM se siente más "pausado" que Veritasium a 175 WPM. Variable oculta: **tiempo visual entre ideas** (la animación Manim tarda; el B-roll Veritasium está montado denso). Para el creador, esto significa que el ritmo no se optimiza sólo por WPM — el ritmo visual importa tanto o más.
3. **Monetización divergente determina CTA.** 3B1B (Patreon no-ads) → cierre narrativo. Veritasium (sponsor integrado) → cierre con pitch de 30-45s. Para un creador hispano del nicho divulgación, la decisión "patreon vs sponsor vs ad-revenue" determina la estructura del cierre — no se copia el cierre sin copiar el modelo de negocio.
4. **Sin cara on-camera es una opción legítima en divulgación.** 3B1B sostiene 6M+ subs sin mostrar nunca al creador. Suficiente evidencia para añadir al catálogo de decisiones de producción: "cara vs animación" no es obligatorio. Pilar 1 §2.3 #12 (imagen del instructor) es condicional, no default.
