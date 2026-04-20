# Pilar 2 — Tendencias, formatos y casos de éxito

> **Naturaleza dinámica.** Este documento describe lo que está funcionando *ahora* en producción de contenido audiovisual de entrenamiento y divulgación. Su contenido caduca rápido —semanas o meses—. Cada item tiene fecha de última verificación. Los skills del toolkit consultan este pilar pero **siempre lo cruzan con el pilar 1 (fundamentos cognitivos)**: cuando una tendencia popular contradice un fundamento, el fundamento prevalece.
>
> **Cómo se actualiza.** Manualmente con asistencia: el skill `update-trends` busca novedades en fuentes definidas, resume y propone cambios para tu aprobación.
>
> **Trazabilidad de los patrones.** Todos los patrones y casos de esta versión provienen del atlas en `docs/casos-de-exito/` (fichas + research log con 36 entries al 2026-04-18). Cualquier claim aquí se puede rastrear a una entrada del research log. Si escribes o editas, mantén la regla.

---

## Frescura

| Sección | Última revisión |
|---|---|
| Global | 2026-04-19 (Fase 1 atlas + v2 modalidades ampliadas) |
| Idea → Guión | 2026-04-18 |
| Pre-producción y grabación | 2026-04-18 |
| Edición y post | 2026-04-18 |
| Publicación y medición | 2026-04-18 |
| Meta-formatos | 2026-04-18 |
| Modalidades ampliadas (v2) | 2026-04-19 (fichas ligeras) |

**Alcance del atlas que alimenta esta versión:** 3 nichos con fichas profundas (tutorial técnico, divulgación, onboarding corporativo), mix anglo/hispano, 10 fichas creator + 3 clusters onboarding, 36 entries trazadas. **+ 7 nichos con fichas ligeras (v2, 2026-04-19)** — ver §Modalidades ampliadas al final.

---

## Idea → Guión [P2-idea-guion]

### Patrones que funcionan ahora [P2-idea-guion-patrones]

- **El hook depende del nicho, no es universal.** Tutorial técnico vende *qué se aprende* (Fireship "React in 100 Seconds", Midudev "Vamos a hablar del futuro de HTML porque os va a volar la cabeza"). Divulgación vende *por qué importa* — el tema real aparece a los 30-60s (3Blue1Brown abre por su bebé, Veritasium abre por "try to push down on a zipper from above"). Onboarding corporativo casi no necesita hook — la audiencia es captiva. *Verificado 2026-04-18. Fuentes: research-log entries 26-31 (observación directa VTT divulgación), 16-21 (tutorial técnico).*

- **CCN Fit como filtro de idea antes de producir** (Paddy Galloway): cada video debe poder satisfacer simultáneamente al viewer Core (audiencia regular), Casual (audiencia amplia interesada) y New (descubrimiento). El título-thumbnail es el "first hook"; el cold-open es el segundo. Cita: "a 20% better title could mean double, triple, quadruple — a 100 times more views." *Verificado 2026-04-18. Fuente: research-log #9.*

- **Open loop título → cierre en cold-open** (Galloway "click to unpause"): el thumbnail+título crean un loop cognitivo que el video cierra. Shorts top-performing tienen 70-90% view-rate por este mecanismo. Converge con efecto Zeigarnik del pilar 1 §6.2 — evidencia profesional independiente endosando el mecanismo académico. *Verificado 2026-04-18. Fuente: research-log #14, #15.*

- **Cadencia de voz correlaciona con densidad del canal visual**, no con nicho. Rango observado en el atlas: 147-210 WPM. WPM bajo (Kurzgesagt 147, The Coding Train 155) requiere canal visual denso compensatorio. WPM alto (Fireship ~200-250, ThePrimeagen 200, 3Blue1Brown 190) funciona cuando hay espacio visual para procesar. Principio subyacente: modalidad de Mayer (pilar 1 §2.3 #4). *Verificado 2026-04-18. Fuentes: research-log entries 16-31.*

- **Personalización explícita > contenido genérico.** Meta-análisis 2024 (Emerging Science Journal, 140 estudios MOOC 2014-2023) identifica 3 correlaciones robustas con engagement y persistence: personalización del aprendizaje, contenido interactivo, colaboración entre pares. Alinear con metas intrínsecas del aprendiz es el predictor más fuerte. *Verificado 2026-04-18. Fuente: research-log #13.*

### Variantes de hook por patrón estructural [P2-idea-guion-hooks]

Observados en el atlas (lista no exhaustiva — consultar fichas para contexto):

1. **Promesa directa + tech específica + ejemplo** (Midudev "HTML acaba de cambiar para siempre"). Tutorial técnico con tech-news.
2. **Lista retórica + pivot contrarian** (ThePrimeagen "What You Need To Learn 2023"). Editorial en tutorial técnico.
3. **Personal-vivencial + drama de comunidad** (ThePrimeagen "Are Developers Ok?"). Editorial narrativo.
4. **Anécdota íntima → tema** (3Blue1Brown "These days, whenever I look at the back of my beloved 7-month-old baby's head..." → Hairy Ball Theorem). Divulgación abstracta.
5. **Pregunta directa + demo física invitada** (Veritasium "How does a zipper actually work? try to push down..."). Divulgación de objeto cotidiano.
6. **Montaje social-dramático** (Veritasium "Paradox"). Polifonía de voces antes de revelar el problema. Requiere acceso a múltiples entrevistados.
7. **Escala cósmica / fact wow** (Kurzgesagt "The vast majority of the cosmos is voids..."). Entrada por magnitud inhumana.
8. **Alegoría literaria → concepto duro** (QuantumFracture cueva de Platón → principio holográfico). Requiere capacidad literaria genuina.
9. **Re-anclaje serial + setup** (DotCSV "Hace una semana OpenAI dio inicio..."). Viable solo con audiencia recurrente.
10. **Salutación informal + self-deprecación honesta** (The Coding Train "I don't really know these things, so I'm going to be figuring it out as I go"). Instructor que modela metacognición.

Convergencia: en los 10 videos observados directamente (2026-04-18), **NINGUNO** abre con "Antes de empezar, suscríbete", ni con presentación del creador. El hook es contenido, postura o curiosidad — nunca administración del canal.

### Casos de éxito [P2-idea-guion-casos]

- **Tutorial técnico (anglo):** Fireship "React in 100 Seconds" (prototipo del formato comprimido), "The God Tier Developer Roadmap" (11 min, 7M+ views — prueba que largo funciona si la promesa es grande). ThePrimeagen "What You Need To Learn 2023" (3:45, 292K views, hook lista-retórica). Ficha en [docs/casos-de-exito/tutoriales-tecnicos.md](../casos-de-exito/tutoriales-tecnicos.md).
- **Tutorial técnico (hispano):** MoureDev Hello-Python (100 clases, 44h, 5-6 min/clase básica — segmentación serial alineada con Guo et al. 2014). Midudev "HTML acaba de cambiar para siempre" (10:45, 166K views, hook promesa + tech).
- **Divulgación (anglo):** 3Blue1Brown "The Hairy Ball Theorem" (29:40, 2.6M views — hook anecdótico + Manim animation). Veritasium "Why are these 3 letters on almost all of my zippers?" (20:45, 8.1M views — hook demo física invitada). Kurzgesagt "This Is the Scariest Place in The Universe" (9:13, 6.4M views — hook escala cósmica).
- **Divulgación (hispano):** QuantumFracture "¿El Espacio es una Ilusión?" (25:38, 463K views — hook alegoría Platón). DotCSV "Camino a las IAs con RAZONAMIENTO SOBREHUMANO" (22:57, 289K views — hook re-anclaje serial).
- **Onboarding corporativo:** Mike Meyers/Total Seminars CompTIA A+ curso (250K+ estudiantes en Udemy, 5-15 min por módulo, syllabus oficial = outline maestro). Fichas en [docs/casos-de-exito/onboarding-corporativo.md](../casos-de-exito/onboarding-corporativo.md).

### Anti-patrones [P2-idea-guion-antipatrones]

- **Intros largas con presentación del creador** antes del contenido — caen sistemáticamente en retention curves. Observación empírica: 10 de 10 creators del atlas evitan este patrón. *Verificado 2026-04-18.*
- **"Antes de empezar, suscríbete"** en los primeros 30 segundos — el espectador aún no decidió si vale la pena. 9 de 10 creators del atlas NO lo hacen. *Excepción documentada:* DotCSV (hispano, IA) hace CTA explícito completo al CIERRE ("dejad vuestro me gusta... compartidlo... comentarios...") y tiene engagement consistente — la expectativa cultural hispana de nicho técnico lo acepta. El anti-patrón es *ponerlo al inicio*, no la existencia del CTA en sí.
- **Hook de promesa genérica en tutorial técnico para audiencia ya-técnica** — Fireship funciona *sin* prometer beneficio concreto porque la audiencia sabe qué es "React in 100 Seconds". Para audiencia no-técnica el mismo hook es incomprensible. Matchear hook a nivel de familiaridad del viewer.
- **Copiar cadencia 200-250 WPM** cuando el contenido va a audiencia no-técnica (onboarding corporativo general, divulgación amplia). Saturación del canal auditivo si no hay canal visual compensatorio — viola modalidad (pilar 1 §2.3 #4).
- **Clickbait que la promesa no cumple** — el open loop del título se cierra con decepción. Anti-patrón absoluto: destruye autoridad. Galloway es explícito: reframing (Andrew Millison "How the UN is Holding Back the Sahara Desert" → 12M views) NO es clickbait si el video entrega.

---

## Pre-producción y grabación [P2-preprod]

### Patrones que funcionan ahora [P2-preprod-patrones]

- **Talking-head informal supera a talking-head formal estudio** (Guo, Kim & Rubin 2014 sobre 6.9M sesiones edX — endosado por 12 años de práctica). The Coding Train es el ejemplo vivo: WPM 155 + face-cam + live-coding con errores + self-deprecación ("I don't really know these things"). MoureDev aplica el mismo principio con live-coding desde Twitch → YouTube. *Verificado 2026-04-18. Fuente: research-log #11 (re-verificación Guo et al. 2014).*

- **"Khan-style tablet drawings" > screencasts o slides estáticas** (también Guo et al. 2014). 3Blue1Brown es el caso premium: motor custom Manim (Python) genera animación matemática en tiempo real que el audio acompaña. Funciona con 6M+ subs y 183-192 WPM. La animación tarda — el espacio visual permite procesar sin saturar. *Verificado 2026-04-18.*

- **Sin cara on-camera es opción legítima cuando hay canal visual compensatorio**. Fireship (memes + media clips + animaciones AE), 3Blue1Brown (animación Manim), Kurzgesagt (2D animation de equipo de 40) — 3 de los canales más grandes del atlas NUNCA muestran al creador. Condición: el canal visual sustituye la función de gaze guidance + warmth del instructor visible. Pilar 1 §2.3 #12 (imagen del instructor) es condicional, no default. *Verificado 2026-04-18.*

- **Face-cam PiP sobre el código** es default hispano de tutorial. MoureDev y Midudev usan PiP con code editor/navegador como escenario principal. Funciona para live-coding y code review. ThePrimeagen extrema el modelo con face-cam principal sobre terminal Vim como visual secundario. *Verificado 2026-04-18.*

- **Producir desde stream y editar down** es un endpoint, no un punto de entrada. ThePrimeagen destila 4-6h de Twitch a 4-12 min de main channel (ratio 20-30x); MoureDev reedita clases Twitch a YouTube 5-6 min. Requiere editor dedicado (Flip en caso Prime) y audiencia previa que ya alimente el stream. Creators nuevos que intentan este modelo sin esos pre-requisitos quedan atrapados en producción sin publicación. *Verificado 2026-04-18.*

- **Audio mono claro >> video 4K con audio mediocre** — la audiencia perdona pixelación, no audio sucio. Heurística industrial consolidada, observable en todos los creators del atlas (ninguno comprometió audio por ahorrar en imagen). *Sin cambio desde versión 2026-04-17.*

- **Iluminación frontal suave + fondo levemente más oscuro** para separar instructor del fondo sin chroma key — observable en face-cam de ThePrimeagen, MoureDev, QuantumFracture, DotCSV, Veritasium. *Sin cambio.*

### Variantes por nicho [P2-preprod-variantes]

- **Tutorial técnico (anglo):** 3 modelos viables — (a) **sin cara + animación densa** (Fireship), (b) **face-cam + editor PiP** (ThePrimeagen), (c) **face-cam + live-coding split** (The Coding Train). Ninguno es superior universalmente; decisión depende de si el tema soporta carga visual compensatoria.
- **Tutorial técnico (hispano):** face-cam PiP dominante (MoureDev, Midudev). Cultura de streaming + Twitch facilita el formato.
- **Divulgación (anglo):** bifurcación clara — (a) **sin cara + animación** (3B1B, Kurzgesagt) requiere competencia técnica de producción animada, (b) **cara on-location + B-roll cinematográfico** (Veritasium) requiere presupuesto de producción documental.
- **Divulgación (hispano):** face-cam estudio consistente (QuantumFracture, DotCSV) — más económico que animación Kurzgesagt-scale y más escalable que Veritasium-scale.
- **Onboarding corporativo:** face-cam dominante (Platzi, Crehana, LinkedIn Learning, Udemy). Hipótesis: la presencia del instructor señaliza "alguien responsable de esto" — útil cuando el contenido es obligatorio.

### Casos de éxito [P2-preprod-casos]

- **Sin cara + animación:** 3Blue1Brown Manim (6M+ subs), Kurzgesagt (20M+ subs, equipo de 40).
- **Face-cam on-location + B-roll:** Veritasium (17M+ subs), producción documental HBO-style aplicada a ciencia.
- **Face-cam + editor:** The Coding Train (1.77M+ subs, p5.js editor), MoureDev (Hello-Python con VS Code).
- **Stream → edit down:** ThePrimeagen (473K subs main, +38% YoY, multichannel), MoureDev (Twitch → YouTube cursos).

### Anti-patrones [P2-preprod-antipatrones]

- **Studio formal + teleprompter rígido** fracasa en engagement (Guo et al. 2014). El estudio pulido sin calidez humana produce la experiencia del e-learning corporativo de los 90. Anti-patrón establecido.
- **Forzar face-cam cuando el contenido visual debe llevar la carga.** Un curso de React con instructor dominando el frame y el código relegado a 30% es retrógrado — la persona vale en saludo/cierre, el código vale en el cuerpo. Invertir cuando corresponda (PiP pequeño, screen principal).
- **Música de fondo durante explicación verbal compleja** — viola principio de coherencia (pilar 1 §2.3 #1) y aumenta carga extraña. Observable por ausencia en los 10 videos del atlas: ningún creator usa música bajo voz en secciones de explicación crítica. *Sin cambio.*

---

## Edición y post [P2-edicion]

### Patrones que funcionan ahora [P2-edicion-patrones]

- **Cortes con ritmo variable por densidad del contenido.** Fireship observado en 10-15 cortes/min para formatos densos; The Coding Train cortes naturales sobre pausas/errores del live-coding (menos densos). El ritmo se adapta a la carga cognitiva del segmento, no es universal. *Verificado 2026-04-18.*

- **WPM ≠ velocidad percibida.** Kurzgesagt 147 WPM se siente más "pausado" que Veritasium 175 WPM — variable oculta: ritmo visual entre ideas. La animación Manim (3B1B) tarda; el B-roll Veritasium montado denso ocupa el canal visual. Principio subyacente: modalidad de Mayer (pilar 1 §2.3 #4) — balancear carga auditiva y visual, no maximizar ambos. *Verificado 2026-04-18. Entries 22-25.*

- **Humor como carga germana, no extraña.** Fireship usa 3 capas de humor (jokes de nicho, memes visuales, self-deprecating/sarcástico); The Coding Train usa self-deprecación honesta; ThePrimeagen usa reacciones + sarcasmo; QuantumFracture usa humor autoreferencial ("soy un friky que sube vídeos a internet"). En los 4 casos el humor sirve a la retención porque es **coherente con el contenido**, no decorativo. Consistente con Mayer #1 (coherencia, pilar 1 §2.3 #1). *Verificado 2026-04-18.*

- **B-roll funcional, no decorativo** — cada inserto ilustra algo dicho en ese momento (contigüidad temporal, pilar 1 §2.3 #5). Observable en Veritasium (B-roll científico alineado con la narración) y Kurzgesagt (animación alineada frase-a-frase con voz). *Sin cambio desde versión 2026-04-17.*

- **Subtítulos quemados (open captions)** para consumo silencioso en redes + closed captions accesibles paralelos. Observable en la mayoría del atlas — MoureDev, Midudev, DotCSV, QuantumFracture los incluyen por default. *Sin cambio.*

- **Zoom dinámico digital** sobre la zona explicada en lugar de mover el cursor — guía la mirada sin pedir esfuerzo al espectador. Observable en Fireship, The Coding Train, MoureDev. *Sin cambio.*

### Variantes por nicho [P2-edicion-variantes]

- **Tutorial técnico comprimido (Fireship 100-second):** 10-15 cortes/min, 200+ WPM, memes y overlays densos. Funciona para audiencia técnica ya-familiarizada.
- **Tutorial técnico largo (MoureDev, The Coding Train):** cortes naturales del live-coding, WPM moderado (155-170 anglo/hispano), formato serial.
- **Divulgación animada dense (Kurzgesagt, 3B1B):** NO hay cortes de cámara — hay transiciones de animación que ritman el video. Carga visual máxima, pausa oral proporcional.
- **Divulgación documental (Veritasium):** cortes editoriales entre face-cam on-location + B-roll + entrevistas. Ritmo cinematográfico.
- **Onboarding microlearning:** módulos 5-10 min con quiz integrado al final (Articulate/Storyline style). Interactividad > tono (pattern específico del nicho — ver §Meta-formatos).

### Casos de éxito [P2-edicion-casos]

- **Compresión radical:** Fireship "X in 100 Seconds" serie — ejemplo canónico de cadencia alta + humor-como-carga-germana.
- **Animation-driven:** 3Blue1Brown "But what is a Laplace Transform?" (34:41, 1.5M views) — Manim animation + analogía pedagógica + WPM 183.
- **B-roll documental:** Veritasium "Why are these 3 letters on almost all of my zippers?" (20:45, 8.1M views) — B-roll denso, on-location, entrevistas editadas al script maestro.
- **Branching interactivo:** casos de estudio Articulate Storyline (40%+ Fortune 500) — video lineal se transforma en decision-driven exploration para compliance.

### Anti-patrones [P2-edicion-antipatrones]

- **Transiciones decorativas (whoosh, glitch, spin) entre cada corte** — viola coherencia (pilar 1 §2.3 #1), aumenta carga extraña sin agregar valor. *Sin cambio; no observado en ninguno de los 10 creators del atlas.*
- **Música en loop a volumen alto bajo voz** — degrada inteligibilidad y aprendizaje. *Sin cambio.*
- **Forzar WPM alto sobre visuales densos** — Kurzgesagt a 200 WPM sería ilegible porque el viewer tiene que procesar animación saturada simultáneamente. Cada WPM alto observado (Fireship, Primeagen, 3B1B) coexiste con ritmo visual que lo permite.
- **"Video legal leído" en compliance corporativo** — 30-60 min de abogado leyendo política, zero interactividad. Completion 20-30%. Anti-patrón establecido en literatura onboarding 2024-2025. Remediación: reestructurar a microlearning + scenarios.

---

## Publicación y medición [P2-publicacion]

### Patrones que funcionan ahora [P2-publicacion-patrones]

- **Thumbnails con expresión facial + 2-3 palabras grandes** — la expresión humana captura bottom-up; el texto refuerza promesa. Excepción importante: canales sin cara on-camera (Fireship, 3B1B, Kurzgesagt) usan ilustración/logo + palabras grandes. El elemento humano es ventaja pero NO es requisito. *Actualizado 2026-04-18.*

- **Capítulos marcados** en videos largos — permite navegación y reduce abandono. 3Blue1Brown los incluye sistemáticamente (visible en descripción "0:00 - Un..."); Veritasium y Kurzgesagt también. *Sin cambio.*

- **Cross-funnel específico > CTA genérico.** Los creators del atlas cierran con enlace al ecosistema propio: Fireship → fireship.io; MoureDev → mouredev.pro (cursos premium + Discord); ThePrimeagen → boot.dev + multichannel (@ThePrimeTimeagen, @TheVimeagen); QuantumFracture → podcast Quantum FM; DotCSV → canal secundario DotCSV Lab. Cada funnel encaja con el modelo de negocio. ROI del CTA depende del funnel, no del volumen del pitch. *Verificado 2026-04-18.*

- **Sponsor integrado al tema > sponsor genérico.** Brilliant (educación matemática/ciencia) aparece en 3 de 5 creators de divulgación del atlas (Veritasium, Kurzgesagt, QuantumFracture) — converge por afinidad temática, no por maximizar dinero. Hostinger (infra) aparece en pre-roll de videos sobre infra; Brilliant aparece al cierre de videos conceptuales. La posición del sponsor varía por relevancia temática, no es mecánica. *Verificado 2026-04-18.*

- **CTA explícito "suscríbete/like/comparte" NO es anti-patrón universal — depende de comunidad.** 9 de 10 creators del atlas evitan o minimizan el pitch clásico. DotCSV (hispano, IA) es el único que lo hace completo y su engagement es consistente. Interpretación: en comunidades hispanas técnicas donde la expectativa cultural lo espera, omitirlo puede parecer distante. Matchear al canal objetivo. *Verificado 2026-04-18.*

- **Open loop título → cierre en cold-open** (ya citado en §Idea→Guión) — viable como principio de packaging. Shorts top-performing 70-90% view-rate por este mecanismo (Galloway).

### Variantes por nicho [P2-publicacion-variantes]

- **Tutorial técnico (anglo):** cross-funnel a cursos propios o plataformas de pago (Fireship, Primeagen). CTA explícito minimal.
- **Tutorial técnico (hispano):** funnel a comunidad Discord + curso premium (MoureDev). CTA explícito más frecuente (DotCSV).
- **Divulgación (anglo):** sponsor integrado + plug a merch/Patreon (3B1B Patreon, Kurzgesagt shop). Escalas grandes permiten monetización no-ads.
- **Divulgación (hispano):** sponsor + CTA + cross-plug a podcast (QuantumFracture Quantum FM). Modelo mixto.
- **Onboarding corporativo:** la "publicación" es dentro del LMS, no YouTube. El CTA es "completar quiz / pasar a siguiente módulo" no "suscribirse".

### Métricas a observar [P2-publicacion-metricas]

**Plataforma YouTube (proxies):**

- **Retention curve** — caídas pronunciadas en los primeros 30s indican hook débil; caídas en mitad indican aburrimiento/confusión; subidas indican momentos de interés replicables.
- **APV (Average Percentage Viewed)** ≥ 40% es saludable para contenido formativo >5 min. Referencia orientativa, depende del nicho.
- **Shorts view-rate 70-90%** como benchmark top-performing (Galloway).
- **Ratio views/subs ≥ 1.0** indica que el video capta audiencia más allá del Core (CCN fit).

**Plataforma LMS (onboarding corporativo — NO comparable 1:1 con YouTube):**

- **"Complete"** en LinkedIn Learning = 70% de reproducción. Política platform-level, no heurística.
- **Completion microlearning (<5 min):** ~80% es el benchmark 2024-2025 (eLearning Industry).
- **Completion long-form (≥30 min):** ~20% benchmark.
- **Completion gamified:** 90% vs 25% no-gamified (LMS Portals 2024).
- **Completion video no-interactivo dropped to 60% en 2024** (Research.com 2026) — la industria migra a formatos interactivos.

### Métricas que importan de verdad (pilar 1 §8.4) [P2-publicacion-metricas-core]

- Comprensión post-test, retención a 7-30 días, transferencia. Las métricas de plataforma son proxies imperfectos. En onboarding corporativo donde el LMS mide quiz scores, ya se está midiendo comprensión — pero la transferencia al puesto de trabajo sigue siendo el gap abierto.

### Anti-patrones [P2-publicacion-antipatrones]

- **Optimizar solo APV sin medir aprendizaje real** — produce contenido entretenido que no transfiere. *Sin cambio.*
- **"Antes de empezar, suscríbete" al inicio** (ya discutido en §Idea→Guión) — sabotea al viewer antes de que decida el valor.
- **Asumir "anti-suscríbete" como regla universal** sin evaluar la comunidad. DotCSV prueba que la regla tiene excepciones culturales.
- **Confundir completion LMS con APV YouTube** — métricas no comparables. Reportar "mi curso tiene 80% completion" al lado de "mi video tiene 40% APV" es error categorial.
- **Certificate theater** en onboarding corporativo — cursos diseñados para cumplir requisito legal, no para enseñar. Métrica de éxito = firma de completion, no transferencia. Anti-patrón establecido; literatura 2024-2025 lo identifica como driver del giro a microlearning + gamification.

---

## Meta-formatos [P2-meta-formatos]

Formatos contenedores con convenciones aprendidas. Cada uno con referencias al atlas para ejemplos canónicos y caveat de replicabilidad.

### Tutorial técnico [P2-meta-tutorial]

- **100 Seconds of Code (Fireship signature):** 80-120s, compresión radical, memes + overlays densos, 200+ WPM, sin cara. Requiere audiencia técnica ya-familiarizada con el vocabulario. *Caveat:* aplicar a audiencia non-técnica produce carga extraña ingestionable.
- **Tutorial segmentado serial (MoureDev Hello-Python):** 5-6 min por clase, live-coding Twitch → YouTube, 47+ lecciones por módulo. Segmentación alineada con Guo et al. 2014 (pilar 1 §2.4). *Caveat:* requiere pipeline Twitch + comunidad activa.
- **Editorial / reacción editada (ThePrimeagen):** 4-15 min, face-cam + terminal, stream-edit-down (ratio 20-30x), CTA en descripción no en voice-over. *Caveat:* endpoint, no entrada — requiere editor dedicado + audiencia previa.
- **Live-coding largo (The Coding Train Coding Challenge):** 30-90 min, face-cam + editor, self-deprecación honesta, cortes naturales. *Caveat:* requiere 3 pre-requisitos — audiencia nicho consolidada, monetización alternativa (Nebula, Patreon), rapport acumulado (5-10 años).
- **Tech-news hispano reactivo (Midudev, DotCSV):** 10-28 min, formato screencast + face-cam, hook urgencia + twist. *Caveat:* requiere pipeline activo de noticias — creators nuevos publican tarde y pierden momentum.

### Divulgación [P2-meta-divulgacion]

- **Explainer conceptual corto animado (Kurzgesagt):** 9-13 min, 2D animation team, sin cara, WPM pausado (147-165), sponsor integrado al cierre. *Caveat:* equipo de 40 personas; imposible replicar individualmente.
- **Animation-driven long-form (3Blue1Brown):** 15-50 min, motor custom (Manim), sin cara, WPM alto con pausas visuales, Patreon + no-ads. *Caveat:* años de dominio + Manim no es plug-and-play.
- **Documental científico on-location (Veritasium):** 15-30 min, cara + B-roll cinematográfico + entrevistas, sponsor integrado flexible. *Caveat:* presupuesto decenas de miles por video.
- **Face-cam estudio + animaciones ad-hoc (QuantumFracture, DotCSV):** 10-28 min, equivalente hispano escalable — un creador + post-producción ligera. Más replicable que Veritasium o Kurzgesagt.
- **Hilo vertical (Shorts / Reels / TikTok):** ≤90s × N partes, cada parte cierra con open loop hacia la siguiente (Zeigarnik aplicado, pilar 1 §6.2). Benchmark: 70-90% view-rate top-performing (Galloway). *Caveat:* formato plataforma-específico; el mismo contenido necesita re-edit por plataforma.

### Onboarding corporativo [P2-meta-onboarding]

- **Microlearning modular (5-10 min):** default industria 2024-2025. Cada módulo auto-contenido con objetivo + demo/ejemplo + checkpoint. Completion ~80% vs ~20% long-form. *Caveat:* microlearning NO es truncar un curso largo — requiere rediseño desde el objetivo de cada módulo.
- **Microlearning job-aid (1-3 min):** video de referencia task-specific que el empleado consulta durante el flujo de trabajo. Opera como retrieval practice implícito (pilar 1 §6.3).
- **Scenarios interactivos con ramificación (Articulate Storyline style):** video lineal se transforma en decision-driven. El empleado elige, ve consecuencias. Usado en 40%+ de Fortune 500. Completion gamified ≈ 90% vs 25% pasivo.
- **Instructor-certificación (Mike Meyers / Total Seminars, Platzi, Crehana):** curso serial 60-120 clases, 5-15 min por módulo, syllabus oficial = outline maestro (CompTIA, ISO, SOC2, ITIL). *Caveat:* competencia técnica del instructor + plataforma con quiz/certificado — sin LMS el formato pierde sus pilares.
- **Webinar asíncrono reeditado:** alternativa al webinar en vivo de 50+ min. Grabación → edit a 5-8 min → entrega como microlearning. Completion sube de ~50% (webinar) a ~80% (microlearning).

### Meta-patrones transversales [P2-meta-transversales]

- **Duración no es el eje — la cadencia relativa al contenido lo es.** Fireship (100s comprimido), MoureDev (5-6 min segmentado), 3B1B (34 min denso), ThePrimeagen (4-12 min edit-from-stream) respetan el ceiling de ~6 min de Guo et al. 2014 con estrategias distintas: compresión radical, segmentación serial, segmentación natural dentro del video largo, o edit-down.
- **Presencia del instructor es condicional, no obligatoria.** 6 de 10 creators del atlas muestran cara; 4 no. Ambos funcionan según el contenido.
- **Humor con función cognitiva > humor decorativo** — los creators que usan humor (Fireship, Primeagen, Coding Train, QuantumFracture) lo hacen con coherencia temática, no como ornamento.

---

## Modalidades ampliadas — fichas ligeras v2 [P2-modalidades-ampliadas]

> **Estado:** 2026-04-19. Fase 3 de la reforma a `video-explainer-guide` agregó cobertura para las 7 modalidades que el atlas original no tocaba explícitamente: documental narrativo, video-ensayo, periodismo analítico visual, conferencia grabada, live stream educativo, podcast audiovisual educativo, personal essay pedagógico.
>
> **Profundidad:** estas fichas son **análisis general** del canal (sin observación VTT + WPM medido). Son suficientes para alimentar el rediseño de briefs con ajuste por eje (fase 4) y para evitar contaminar modalidades no cubiertas. La iteración empírica (VTT + WPM + quotes exactos al nivel de las 10 fichas pioneras) queda como mantenimiento continuo vía `update-trends`.

### Cobertura por modalidad [P2-modalidades-cobertura]

Cada modalidad del arquitectura ([docs/arquitectura/modalidades-y-ejes.md](../arquitectura/modalidades-y-ejes.md#3-las-12-modalidades-como-presets)) mapea a una ficha del atlas:

| Modalidad | Ficha principal del atlas | Fichas ejemplares |
|---|---|---|
| Instruccional / formativa | `tutoriales-tecnicos.md` (v1 profunda) | Fireship, ThePrimeagen, MoureDev, Midudev, The Coding Train |
| Divulgativa | `divulgacion-corta.md` (v1 profunda) | 3Blue1Brown, Veritasium, Kurzgesagt, DotCSV, QuantumFracture |
| Explainer comercial / producto | (pendiente ficha explícita — patrones inferidos desde divulgación) | — |
| How-to / performance | (pendiente ficha explícita — patrones inferidos desde tutorial técnico) | — |
| Onboarding | `onboarding-corporativo.md` (v1 profunda) | Mike Meyers / Total Seminars, Platzi, Crehana |
| Documental narrativo pedagógico | `documental-narrativo.md` (v2 ligera) | Adam Curtis, Asianometry |
| Video-ensayo | `video-ensayo.md` (v2 ligera) | Nerdwriter, Contrapoints |
| Periodismo analítico visual | `periodismo-visual.md` (v2 ligera) | Johnny Harris, Vox Atlas |
| Conferencia / charla grabada | `conferencia-grabada.md` (v2 ligera) | Simon Sinek, Brené Brown |
| Live stream educativo | `live-stream-educativo.md` (v2 ligera) | Casey Muratori, Tsoding (+ ThePrimeagen modo live ref cruzada) |
| Podcast audiovisual educativo | `podcast-audiovisual.md` (v2 ligera) | Lex Fridman, Huberman Lab |
| Personal essay pedagógico | `personal-essay.md` (v2 ligera) | Ali Abdaal, Matt D'Avella |

**Cobertura:** 10 de 12 modalidades con ficha explícita. Explainer comercial y how-to quedan para ronda siguiente de fichaje (el patrón actual los aproxima suficientemente desde divulgación + tutorial).

### Patrones transversales v2 (a confirmar empíricamente) [P2-modalidades-patrones-v2]

Observaciones no-verificadas empíricamente pero inferidas del análisis general de las 14 fichas ligeras — candidatas a validación en ronda empírica siguiente:

- **`grado-edicion: zero` (live stream) invalida >50% de las decisiones de post-producción.** El formato live no admite pacing editado, overlays auxiliares programáticos ni retrieval explícito planeado. Su equivalente: "peer instruction via chat" — el streamer pregunta y lee respuestas en vivo. Ver pilar 1 §12.2.
- **Podcast audiovisual invierte la ingeniería YouTube estándar.** Hook 0-3s no aplica (2-5h de duración); APV como métrica es engañoso (escucha en background es común); capítulos en descripción son crítico. El canal visual es complemento del audio, no primario.
- **Video-ensayo y personal essay convergen en rol (`narrador-1a-persona`) pero divergen en arco.** Ensayo = argumentativo (Nerdwriter, Contrapoints); personal essay = narrativo + apreciativo (D'Avella, Abdaal). La distinción del brief de estructura (`guion/03-estructura`) debe reconocer esto.
- **Documental narrativo y conferencia grabada son los únicos dos presets con `rol: narrador-omnisciente` o `experto-neutral` sin edit heavy que compense.** La carga cognitiva la lleva el speaker (conferencia) o el archivo + voice-over (documental) — diferente estrategia compensatoria del canal visual.
- **El "formato largo" (>30 min) aparece en 4 modalidades distintas** (documental narrativo, video-ensayo Contrapoints, podcast, ciertos personal essays). Los principios de engagement por segundo no escalan linealmente a este tamaño. Pilar 1 §2.4 (Guo et al. ≤6min) aplica a instrucción formal; el formato largo se sostiene por otros mecanismos (narrativa, conversación, intimidad autoral) — el pilar 1 expandido (§9-§12) cubre el por qué.

---

## Fuentes para revisar al actualizar

*(Lista que el skill `update-trends` consulta)*

**Análisis industria (prioridad alta):**

- Paddy Galloway (YouTube + Substack + LinkedIn) — framework CCN Fit, click-to-unpause.
- Colin & Samir (podcast + long-form entrevistas con creators top).
- Creator Hooks (Substack).
- YouTube Creator Insider (canal oficial).

**Academia (prioridad alta):**

- ACM L@S proceedings 2022-2026 (Learning at Scale).
- Mayer bibliografía viva (Multimedia Learning).
- Guo, Kim & Rubin 2014 — re-citado regularmente; buscar follow-ups de los mismos autores o citaciones recientes.
- Meta-análisis MOOC — último ingested: Emerging Science Journal 2024 (140 estudios), Elsevier 2023 (21 estudios).

**Creators primarios (observación directa):**

- Los 10 del atlas + cualquier nuevo que entre por actualización.
- Investigación de Derek Muller / Veritasium en educación científica (PhD 2008 sobre videos que exponen misconceptions).

**Plataformas y herramientas:**

- Tubebuddy / VidIQ blog.
- Reportes anuales de retention (Wistia, Vidyard).
- Reportes LMS corporativos (Articulate case studies, LinkedIn Learning Help oficial, eLearning Industry, Research.com).
- Synthesia / Articulate / Platzi / Crehana para onboarding.

**Toolchain propio (no caduca, sólo mantener):**

- `yt-dlp` + `vtt2txt2.py` parser para observación directa con WPM limpio. Flujo documentado en `docs/casos-de-exito/research-log.md` §Sesión 2.
