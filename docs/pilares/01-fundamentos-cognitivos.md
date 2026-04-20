# Arquitectura de la Atención y Neuropsicología del Aprendizaje en Medios Audiovisuales

Referencia conceptual sobre cómo el cerebro humano percibe, atiende y aprende a partir de contenido audiovisual. Pensada para informar el diseño de video con intención pedagógica —tutoriales técnicos, divulgación, formación corporativa, onboarding, contenido explicativo para público general— basado en evidencia.

> **Alcance.** Este documento describe procesos cognitivos del aprendiz humano. No prescribe software, codecs ni flujos de producción concretos. La aplicación a un pipeline específico se aborda en documentos separados.
>
> **Niveles de evidencia.** Toda afirmación de base empírica cita autor y año, con la referencia completa en la bibliografía final. Las prescripciones que provienen de la práctica profesional —no de estudios— se marcan explícitamente como **heurística** o **convención de diseño**. Donde la literatura está en debate, el texto lo señala en lugar de presentar consenso.

---

## 1. Arquitectura de la atención

### 1.1 Sistemas y redes atencionales [P1-§1.1]

La atención no es un recurso único. Posner & Petersen (1990; revisión en Petersen & Posner 2012) describen tres redes funcionalmente distintas:

- **Alerting** — mantenimiento del estado de vigilia y prontitud para detectar estímulos.
- **Orienting** — selección de información del entorno, dirigir el foco hacia un punto.
- **Executive** — resolución de conflicto entre estímulos, control voluntario sostenido.

Sobre esa arquitectura, Corbetta & Shulman (2002) distinguen dos modos de control:

- **Top-Down (endógeno):** dirigido por metas, lento y metabólicamente costoso. Lo activa el aprendiz cuando decide concentrarse.
- **Bottom-Up (exógeno):** automático, reactivo a estímulos salientes (movimiento, contraste, novedad). Es lo que los publicistas llamarían "captar la atención".

**Implicación de diseño.** El contenido debe primero enganchar al sistema bottom-up con un estímulo saliente, y luego ceder el control al sistema top-down para el procesamiento profundo. Si el contenido se queda en estímulos salientes (ruido visual continuo) impide el procesamiento profundo. Si nunca activa el bottom-up, no captura la atención inicial.

### 1.2 La duración del foco: dato real y mito [P1-§1.2]

Es frecuente leer que "la atención humana ha caído a 8 segundos, menos que la de un pez dorado". Es **falso**. El dato del pez no existe en ninguna fuente verificable y la idea de un colapso atencional generalizado no tiene respaldo empírico.

El dato real proviene del trabajo de Gloria Mark (UC Irvine, 2004-2023). Mark mide *tiempo en una sola pantalla antes de cambiar a otra* en trabajadores de oficina. Esa ventana cayó de ~2.5 minutos en 2004 a ~47 segundos en estudios recientes (Mark, 2023). Es una métrica de **patrones de cambio de tarea en entornos digitales**, no una métrica de "capacidad de atención" cognitiva.

**Implicación de diseño.** El aprendiz puede sostener atención voluntaria mucho más tiempo que 47 segundos cuando el contenido lo recompensa. Pero opera por defecto en un entorno de cambio frecuente, así que el contenido compite con todo lo demás abierto en la misma pantalla.

### 1.3 Anticipación, recompensa y motivación de continuar [P1-§1.3]

El sistema dopaminérgico mesolímbico no codifica "placer" sino **error de predicción de recompensa** (Schultz, 1997, *Science*; Schultz, Dayan & Montague, 1997). La dopamina se libera cuando una recompensa esperada llega antes o es mayor de lo previsto, y se inhibe cuando una recompensa esperada no llega.

Aplicado a contenido formativo: cuando el título o el hook prometen una solución y el video la pospone indefinidamente, se genera un **error de predicción negativo acumulado**. Esto degrada la motivación de continuar viendo. No causa un "abandono inmediato" automático —ese es un claim sin evidencia directa— pero sí erosiona la disposición a invertir más esfuerzo.

**Implicación de diseño.** Cumplir progresivamente la promesa del hook. Entregar pequeñas victorias intermedias (mini-resoluciones) para mantener la curva de predicción positiva.

---

## 2. Carga cognitiva y diseño multimedia

### 2.1 Teoría de la Carga Cognitiva (CLT) [P1-§2.1]

Sweller (1988, *Cognitive Science*) y Sweller, van Merriënboer & Paas (1998) postulan que la memoria de trabajo es severamente limitada (~4 elementos simultáneos en estimaciones modernas; Cowan 2001), mientras que la memoria de largo plazo es prácticamente ilimitada. El aprendizaje ocurre cuando la información se transfiere de la memoria de trabajo a esquemas en la memoria de largo plazo.

Tres tipos de carga compiten por la memoria de trabajo:

- **Carga intrínseca** — complejidad inherente del material y nivel previo del aprendiz. Se gestiona segmentando el contenido y secuenciando de simple a complejo.
- **Carga extraña** — distracciones, redundancias, presentación deficiente. Es la que el diseño puede y debe minimizar.
- **Carga germana** — esfuerzo productivo dedicado a construir esquemas. Es lo que se quiere maximizar dentro del presupuesto disponible.

### 2.2 Codificación dual [P1-§2.2]

Paivio (1971, 1986) propone que el cerebro procesa información verbal y visual en dos canales diferenciados pero conectados. Información codificada en ambos canales se recuerda mejor que información codificada en uno solo.

Esta es la base teórica de por qué texto + imagen relevante supera a texto solo (o imagen sola) para aprendizaje, siempre que ambos canales presenten contenido complementario, no redundante.

### 2.3 Los 12 principios de Mayer [P1-§2.3]

Mayer (2009, *Multimedia Learning*, Cambridge UP; revisado en Mayer 2014) integra CLT y codificación dual en doce principios derivados de ~100 experimentos. Versión sintética:

1. **Coherencia** — eliminar palabras, imágenes y sonidos irrelevantes. [P1-§2.3-#1]
2. **Señalización** — destacar información esencial con flechas, contornos, énfasis tipográfico. [P1-§2.3-#2]
3. **Redundancia** — texto en pantalla idéntico a la narración degrada el aprendizaje (compite por el canal verbal). [P1-§2.3-#3]
4. **Contigüidad espacial** — texto e imagen relacionados deben estar visualmente cerca. [P1-§2.3-#4]
5. **Contigüidad temporal** — narración y animación correspondientes deben presentarse simultáneamente. [P1-§2.3-#5]
6. **Segmentación** — dividir el contenido en unidades manejables, idealmente con control del usuario sobre el avance. [P1-§2.3-#6]
7. **Pre-entrenamiento** — introducir nombres y características de componentes clave antes del flujo principal. [P1-§2.3-#7]
8. **Modalidad** — texto narrado supera a texto en pantalla cuando acompaña a un gráfico (libera el canal visual). [P1-§2.3-#8]
9. **Multimedia** — palabras + imágenes superan a palabras solas. [P1-§2.3-#9]
10. **Personalización** — lenguaje conversacional ("tú", "nosotros") supera al lenguaje formal. [P1-§2.3-#10]
11. **Voz** — voz humana cálida supera a voz sintética genérica para aprendizaje (la brecha se ha estrechado con TTS modernos; ver §5.4). [P1-§2.3-#11]
12. **Imagen del instructor** — la presencia visual del instructor en pantalla puede ayudar o estorbar; depende de si compite con el contenido. [P1-§2.3-#12]

### 2.4 Segmentación: cuánto dura una unidad útil [P1-§2.4]

Guo, Kim & Rubin (2014) analizaron 6.9 millones de sesiones de video en cuatro cursos masivos de edX. El engagement promedio cayó marcadamente pasados los **6 minutos**, con una mediana de tiempo de visualización entre 3 y 6 minutos según la duración total. Videos más largos no aumentaron el aprendizaje proporcionalmente.

**No** establece que "cada video debe durar exactamente entre 2 y 6 minutos", pero sí que para contenido lectivo segmentado, las unidades cortas mantienen mejor el engagement que las largas continuas.

---

## 3. Percepción visual: color, forma, contraste

> Esta sección requiere especial cuidado porque la "psicología del color" comercial mezcla hallazgos modestos con afirmaciones pseudocientíficas. La cromoterapia (la idea de que colores específicos estimulan glándulas y curan condiciones) **no tiene base mecánica en neurociencia** y se omite aquí.

### 3.1 Color: efectos modestos y context-dependent [P1-§3.1]

Elliot & Maier (2014) revisan el estado de la investigación en color y comportamiento. Conclusión: existen efectos reales de ciertos colores sobre desempeño y emoción, pero son **modestos, dependen del contexto** y muchas veces dependen de la asociación cultural más que de propiedades físicas universales.

Generalizaciones operativas razonables (con esa cautela):

- **Rojos saturados** se asocian con urgencia y atraen la fijación visual; pueden interferir con desempeño en tareas de logro percibidas como evaluativas.
- **Azules y verdes** se perciben generalmente como menos arousadores; útiles para fondos en contenido denso.
- **Amarillo de alta saturación** sobre fondo oscuro maximiza la captura visual periférica por su luminancia, pero satura rápidamente si se sobreusa.

**No** se sostiene que "cada color tenga un efecto fisiológico universal predecible" ni que "los colores estimulan glándulas". Lo que opera es una mezcla de saliencia perceptual (luminancia, contraste cromático) y aprendizaje cultural.

La regla **60/30/10** (un dominante, un secundario, un acento) es una **convención de diseño** popularizada en interiorismo y trasladada a interfaces. No proviene de un estudio empírico sobre aprendizaje. Funciona como heurística para evitar paletas caóticas, no como prescripción científica.

### 3.2 Contraste: estándares objetivos [P1-§3.2]

Hay un único marco de referencia objetivo y útil: **WCAG 2.2 (W3C 2023)**, criterio 1.4.3 *Contrast (Minimum)*:

- Texto normal: ratio mínimo **4.5:1** sobre el fondo.
- Texto grande (≥18pt o ≥14pt en negrita): mínimo **3:1**.
- Componentes de UI no-textuales: mínimo **3:1**.

El nivel AAA pide 7:1 / 4.5:1 respectivamente, pero sacrificar legibilidad de cuerpo extenso por contraste extremo puede aumentar la fatiga visual. **Amarillo sobre negro** alcanza ratios cercanos a 19:1 (depende del tono exacto) y es excelente para señalización puntual; usado como cuerpo de texto extenso es agotador.

### 3.3 Forma: una observación específica, no una doctrina [P1-§3.3]

Bar & Neta (2006, *Psychological Science*) reportan que sujetos prefieren objetos con contornos curvos sobre objetos visualmente equivalentes con vértices agudos, y muestran mayor activación de la amígdala frente a los segundos. La interpretación es que los ángulos agudos, evolutivamente, indicaban amenaza potencial.

Este hallazgo es real y replicado en algunos contextos, pero **no autoriza** las generalizaciones que se ven en literatura comercial ("los círculos comunican comunidad", "los triángulos hacia abajo simbolizan riesgo"). Esas son convenciones culturales del diseño gráfico, no hallazgos cognitivos.

**Implicación honesta.** Bordes ligeramente redondeados en interfaces y elementos gráficos pueden reducir la sensación de tensión visual. Las asociaciones simbólicas de formas (cuadrado = estabilidad, círculo = unidad) son convenciones útiles de diseño, no leyes psicológicas.

---

## 4. Movimiento y guía de la atención visual

### 4.1 Movimiento como activador bottom-up [P1-§4.1]

El sistema visual humano detecta movimiento con prioridad evolutiva, especialmente en la periferia (Franconeri & Simons, 2003, *Perception & Psychophysics*). Un cambio inesperado en una zona estática captura la atención bottom-up de forma involuntaria, incluso cuando el aprendiz intenta mantener foco en otro lugar.

**Implicación de diseño.** Movimiento estratégico y escaso re-enfoca al aprendiz; movimiento continuo (animaciones decorativas perpetuas) lo agota y compite con el contenido sustantivo (viola el principio de coherencia de Mayer).

### 4.2 Guía de mirada (gaze guidance) [P1-§4.2]

van Gog, Jarodzka, Scheiter, Gerjets & Paas (2009) demostraron en estudios de eye-tracking que cuando el aprendiz observa a un instructor experto y la mirada del instructor se dirige hacia el punto explicado, el aprendiz tiende a fijar el mismo punto antes y por más tiempo. Este fenómeno de **atención conjunta mediada por mirada** se traslada a video instruccional: cuando el rostro del instructor en pantalla mira hacia el contenido —no a cámara— mejora la transferencia visual al elemento relevante.

### 4.3 Direccionalidad de lectura [P1-§4.3]

En culturas con sistemas de escritura izquierda-a-derecha existe un sesgo bien documentado para esperar progresión temporal y causal en esa misma dirección (Chatterjee 2002; Maass & Russo 2003). En culturas con escritura derecha-a-izquierda (árabe, hebreo) el sesgo es opuesto.

**Implicación.** Diagramas de flujo, líneas de tiempo y secuencias causales deben respetar la direccionalidad esperada por la audiencia. Romper este sesgo deliberadamente puede usarse para sorpresa, pero introduce una pequeña carga extraña.

### 4.4 La frecuencia de cortes: heurística, no ley [P1-§4.4]

Es habitual leer recomendaciones del tipo "haz un corte o cambio visual cada 15-30 segundos para evitar el zombie-scrolling". Esto es **heurística de creadores** —especialmente popularizada en YouTube y formatos cortos— no un hallazgo experimental. La evidencia disponible sobre engagement (Guo et al. 2014) opera a escala de minutos, no de segundos, y depende fuertemente del contenido y la audiencia.

Lo defendible: **la habituación visual es real**. Una toma estática prolongada deja de capturar el sistema bottom-up, y el aprendiz se desliza hacia distracciones competidoras. La cadencia exacta es un parámetro a validar empíricamente con la propia audiencia (curvas de retención), no a prescribir de forma universal.

---

## 5. Lenguaje, tipografía y voz

### 5.1 Tipografía para pantalla [P1-§5.1]

El consenso en legibilidad digital favorece **fuentes sans-serif** para cuerpo en pantallas de baja densidad de píxeles, y serif o sans-serif indistintamente en pantallas de alta densidad y para texto extenso (Beier 2016, *Reading Letters*). La diferencia objetiva es pequeña; la elección importa más para coherencia visual y carga de marca que para legibilidad.

### 5.2 Subtítulos y velocidad de lectura [P1-§5.2]

Los estándares de la industria fijan la velocidad sostenible de subtítulos en **15-20 caracteres por segundo (CPS)** (BBC Subtitle Guidelines; Netflix Timed Text Style Guide). Velocidades superiores degradan comprensión, especialmente en audiencias no nativas. La regla práctica complementaria es **2 líneas máximo, ~37-42 caracteres por línea**, exhibidas mínimo ~1 segundo y máximo ~7 segundos.

### 5.3 Posición de subtítulos y lower thirds [P1-§5.3]

La convención de ubicar subtítulos en el tercio inferior de la pantalla proviene de la práctica televisiva (broadcast), no de un estudio cognitivo específico. Tiene base en que el centro vertical típicamente contiene el sujeto principal de la toma, y la periferia inferior es lo suficientemente cercana al centro para lectura sin sacudir la fijación, pero sin ocluir lo importante. Es **convención sólida**, no ley empírica.

### 5.4 Voz y personalización [P1-§5.4]

El **principio de voz** de Mayer (#11) reportaba que voz humana cálida supera a voz sintética para aprendizaje. Estudios más recientes con TTS de alta calidad muestran que la brecha se ha estrechado considerablemente (Davis, Vincent & Park 2019; Craig & Schroeder 2017): lo que importa es la naturalidad prosódica y la ausencia de artefactos, más que el origen humano vs sintético per se.

El **principio de personalización** (#10) sí mantiene un efecto robusto: lenguaje conversacional, segunda persona y registro cercano superan al lenguaje formal e impersonal en transferencia de aprendizaje, sin sacrificar autoridad percibida (Mayer 2009, capítulo de personalización).

---

## 6. Estructura narrativa y motivación

### 6.1 Confusión productiva y cambio conceptual [P1-§6.1]

Muller, Bewes, Sharma & Reimann (2008, *Journal of Computer Assisted Learning*) compararon dos formatos de video instruccional en física: una versión clara que explicaba directamente el concepto correcto, y una versión que presentaba primero las concepciones erróneas comunes y las desafiaba. Resultado: la versión que abordaba los misconceptions produjo mayor ganancia de aprendizaje en post-test, **a pesar de** ser percibida como más confusa por los participantes.

El hallazgo concuerda con la **teoría del cambio conceptual** (Posner, Strike, Hewson & Gertzog 1982): el aprendiz no absorbe ideas nuevas en un vacío; las superpone sobre concepciones previas que pueden ser incompatibles. Para que el aprendizaje real ocurra, las concepciones erróneas deben hacerse visibles y ser explícitamente desafiadas.

**Atención al matiz.** El estudio de Muller no demuestra que "presentar errores duplica la retención" (afirmación que circula en literatura divulgativa). Demuestra una mejora significativa en condiciones específicas. La magnitud depende del tipo de contenido y de la audiencia.

### 6.2 El efecto Zeigarnik y los bucles abiertos [P1-§6.2]

Zeigarnik (1927) reportó que sujetos recordaban mejor tareas interrumpidas que tareas completadas. El efecto ha sido replicado y matizado a lo largo de décadas (revisión en Schiffman & Greist-Bousquet 1992): no es universal, depende de la motivación inicial por la tarea y de si el sujeto espera retomarla.

La traslación a video —"plantea una pregunta y resuélvela 30 segundos después para mantener atención"— es **extrapolación práctica**, no demostración directa. La evidencia narrativa más cercana proviene del estudio de la **transportación narrativa** (Green & Brock 2000, *Journal of Personality and Social Psychology*): la inmersión en una narración reduce la contraargumentación y aumenta la persuasión y el recuerdo.

**Síntesis aplicable.** Estructurar el contenido con tensión narrativa (curiosidad → desarrollo → resolución), abrir bucles que se cierran más tarde, y mantener al aprendiz en estado de "estoy a punto de saber algo" funciona —no por una sola ley psicológica sino por la convergencia de varios mecanismos: anticipación de recompensa, transportación, y el simple hecho de que las preguntas formuladas activan procesamiento más profundo que las respuestas presentadas.

### 6.3 Tres hallazgos para retención y transferencia que la guía original omitía [P1-§6.3]

Las siguientes tres líneas de investigación tienen meta-análisis robustos y son centrales para diseño de aprendizaje. Su ausencia en una guía sobre "entrenamiento basado en ciencia" es notable.

**Desirable difficulties (Bjork & Bjork 2011).** Condiciones que hacen el aprendizaje *más difícil* en el momento (espaciamiento, intercalado de temas, recuperación activa) producen mejor retención y transferencia a largo plazo que condiciones que lo hacen *más fácil* (masificación, bloqueo de un solo tema, relectura pasiva). La sensación subjetiva de fluidez es un mal predictor del aprendizaje real.

**Retrieval practice / testing effect (Roediger & Karpicke 2006, *Psychological Science*).** Recuperar activamente información de la memoria —a través de preguntas, ejercicios, auto-explicación— produce mucho mejor retención a largo plazo que releer o re-ver el mismo material. El efecto es robusto a través de meta-análisis (Adesope, Trevisan & Sundararajan 2017). En contenido audiovisual, esto implica diseñar momentos explícitos de recuperación —preguntas integradas, pausas con micro-ejercicios— y no relegar la práctica al final.

**Spacing effect (Cepeda, Pashler, Vul, Wixted & Rohrer 2006, *Psychological Bulletin*).** Distribuir el estudio en sesiones espaciadas en el tiempo supera consistentemente al estudio masificado en una sola sesión, para la misma cantidad total de tiempo. La ratio óptima entre intervalo de espaciamiento y demora hasta el test de retención es del orden de 10-20%. En diseño de cursos esto implica fragmentar contenido en sesiones espaciadas y reintroducir conceptos clave varias veces a lo largo del programa.

### 6.4 El problema de la transferencia [P1-§6.4]

Barnett & Ceci (2002, *Psychological Bulletin*) documentan que la **transferencia de aprendizaje** —aplicar lo aprendido en un contexto a otro contexto distinto— es notoriamente débil sin diseño explícito. Aprender un concepto en un dominio no garantiza saber aplicarlo en otro. La transferencia mejora cuando el contenido se presenta en múltiples contextos variados, cuando se hace explícita la estructura subyacente que se generaliza, y cuando se entrena con problemas variados, no con repetición del mismo ejemplo.

**Implicación.** Para formación que aspire a producir aplicación real (no solo aprobación de un cuestionario al final del módulo), el contenido debe incluir variedad contextual y práctica deliberada en escenarios diversos.

---

## 7. Principios de diseño basados en evidencia [P1-§7]

Síntesis aplicable, todavía agnóstica de herramientas:

| Elemento | Principio operativo | Base científica |
|---|---|---|
| **Apertura (primeros segundos)** | Confirmar la promesa del título con un estímulo visual saliente; entregar un anclaje cognitivo claro de qué se obtendrá. | Captura bottom-up (Corbetta & Shulman 2002, Franconeri & Simons 2003); evitar error de predicción temprano (Schultz 1997). |
| **Cadencia visual** | Cambios visuales periódicos para sostener engagement bottom-up; calibrar con curvas de retención reales, no por reglas universales. | Habituación atencional; engagement decae a escala de minutos (Guo et al. 2014). Frecuencias de segundos son heurística, no ley. |
| **Señalización** | Resaltar lo esencial con flechas, contornos, color de acento, contraste tipográfico. | Principio de señalización de Mayer (#2). |
| **Coherencia** | Eliminar música decorativa, gráficos sin función, narración redundante con texto idéntico en pantalla. | Principios de coherencia (#1) y redundancia (#3) de Mayer. |
| **Contigüidad** | Texto e imagen relacionados juntos en espacio y tiempo. | Contigüidad espacial (#4) y temporal (#5) de Mayer. |
| **Modalidad** | Cuando hay un gráfico complejo, prefiere narración a texto en pantalla competidor. | Modalidad (#8) de Mayer; codificación dual de Paivio. |
| **Segmentación** | Unidades cortas con cierres parciales; control del aprendiz sobre el avance cuando sea posible. | Segmentación (#6) de Mayer; engagement decae pasado ~6 min (Guo et al. 2014). |
| **Voz y registro** | Voz cálida (humana o TTS de calidad), lenguaje conversacional en segunda persona. | Personalización (#10) y voz (#11) de Mayer; Davis, Vincent & Park 2019. |
| **Confusión productiva** | Presentar y desafiar concepciones erróneas comunes en lugar de sólo enseñar lo correcto. | Muller et al. 2008; cambio conceptual (Posner et al. 1982). |
| **Bucles narrativos** | Abrir preguntas, mantener tensión, cerrar después. | Anticipación de recompensa (Schultz 1997); transportación narrativa (Green & Brock 2000); efecto Zeigarnik con matices. |
| **Retrieval checkpoints** | Insertar momentos explícitos de recuperación activa dentro del contenido, no sólo al final. | Roediger & Karpicke 2006; Adesope et al. 2017. |
| **Espaciamiento** | Estructurar el aprendizaje en sesiones espaciadas, reintroducir conceptos clave en intervalos crecientes. | Cepeda et al. 2006. |
| **Variedad contextual** | Presentar el mismo concepto en múltiples contextos para favorecer transferencia. | Barnett & Ceci 2002; desirable difficulties (Bjork & Bjork 2011). |
| **Accesibilidad** | Contraste WCAG 2.2 AA mínimo, subtítulos a 15-20 CPS, jerarquía tipográfica clara. | WCAG 2.2; estándares BBC/Netflix. |

---

## 8. Diseño para retención y transferencia a largo plazo [P1-§8]

La mayoría de las recomendaciones para video instruccional se centran en captar y mantener la atención dentro de un solo video. Eso es necesario pero insuficiente para producir aprendizaje real. Esta sección sintetiza los elementos de diseño que operan a escalas más largas.

### 8.1 Retrieval checkpoints dentro del contenido [P1-§8.1]

Diseñar momentos explícitos donde el aprendiz debe recuperar activamente lo aprendido —responder una pregunta, predecir un resultado, generar un ejemplo propio— produce mejor retención que continuar exponiendo nueva información (Roediger & Karpicke 2006). Implicaciones operativas:

- Insertar al menos un momento de recuperación cada 5-10 minutos de contenido sustantivo.
- La pregunta debe ser *generativa* (requiere producir la respuesta) más que reconocedora (elegir entre opciones).
- El feedback inmediato refuerza el efecto.

### 8.2 Espaciamiento en cursos y series [P1-§8.2]

Para programas formativos compuestos por múltiples piezas, distribuir el contenido en sesiones espaciadas es preferible a maratones intensivos (Cepeda et al. 2006). Reintroducir los conceptos centrales en intervalos crecientes (espaciamiento expandido) mantiene la accesibilidad de la información en memoria a largo plazo.

### 8.3 Variedad contextual [P1-§8.3]

Presentar el mismo principio aplicado en múltiples contextos diferentes facilita la **transferencia lejana** (Barnett & Ceci 2002): la capacidad de aplicar lo aprendido en situaciones distintas a las del entrenamiento. El opuesto —repetir el mismo ejemplo varias veces— produce sensación subjetiva de dominio sin la transferencia correspondiente.

### 8.4 Métricas que importan vs. métricas que se miden fácil [P1-§8.4]

Las plataformas exponen métricas conductuales: tiempo de visualización, porcentaje promedio visto, retención por segundo, click-through rate. Son **proxies imperfectos del aprendizaje**: alguien puede ver un video completo sin aprender, o aprender mucho de un video que abandona temprano porque ya entendió.

Las métricas relevantes para *aprendizaje* son:

- **Comprensión inmediata** (post-test al terminar la unidad).
- **Retención diferida** (test a 24h, 7 días, 30 días).
- **Transferencia** (capacidad de aplicar en un contexto nuevo, idealmente medido con una tarea, no con un test de reconocimiento).

El diseño orientado a maximizar métricas de plataforma puede divergir del diseño orientado a maximizar aprendizaje. Un creador de formación profesional debería instrumentar al menos un test diferido para validar que las decisiones de diseño producen el efecto buscado, no sólo que el video se ve completo.

---

> **Nota de alcance (§9-§12).** Las cuatro secciones siguientes expanden este pilar más allá del núcleo de cognición multimedia instruccional (Mayer, Sweller, Bjork, Roediger) hacia cuatro cuerpos teóricos que informan modalidades no puramente instruccionales: cine documental, ensayo fílmico, retórica visual / periodismo de datos, y conferencia efectiva. La convocatoria de estas tradiciones no sustituye al núcleo cognitivo; lo complementa cuando el video no es un tutorial. Las secciones §1-§8 siguen siendo la base universal; §9-§12 son la capa genérica que permite calibrar decisiones por modalidad (ver `docs/arquitectura/modalidades-y-ejes.md`).

---

## 9. Teoría del cine documental [P1-§9]

Los fundamentos cognitivos por sí solos no bastan para diseñar un documental narrativo pedagógico. La tradición del documental —un siglo de práctica y unas décadas de teoría— ofrece un vocabulario específico para decisiones que el modelo instruccional no cubre: cómo se relaciona la voz autoral con el mundo representado, qué modos de dirigirse al espectador existen, qué problemas éticos plantean el archivo y la recreación. Esta sección sintetiza lo aplicable a video con intención pedagógica cuando el `arco-dominante` es narrativo o el `rol-presentador` es narrador-omnisciente / investigador.

### 9.1 Los seis modos documentales de Nichols [P1-§9.1]

Nichols (2001/2017, *Introduction to Documentary*) propone seis **modos documentales** que describen diferentes posturas del cineasta frente al mundo representado. Cada modo implica convenciones distintas de voz, estructura y relación con el espectador.

| Modo | Postura autoral | Ejemplos | Ejes asociados |
|---|---|---|---|
| **Poético** | Evocación, fragmentación, ritmo visual antes que argumento. | Koyaanisqatsi; experimentales pedagógicos. | arco narrativo, objetivo apreciar |
| **Expositivo** | Voz de autoridad dirige al espectador con argumento directo. Voice-of-god. | Docus BBC clásicos; Cosmos de Sagan; Kurzgesagt largos. | arco expositivo o narrativo, rol narrador-omnisciente |
| **Observacional** | Cámara como mosca en la pared; mínima intervención. | Frederick Wiseman; direct cinema. | Rara vez pedagógico puro; raramente aplicable al scope |
| **Participativo** | El cineasta aparece e interactúa con los sujetos. | Michael Moore; Louis Theroux; Vice docs. | rol investigador, arco argumentativo |
| **Reflexivo** | El documental comenta sobre su propia construcción. | Man with a Movie Camera; ciertos video-ensayos reflexivos. | rol narrador-1a-persona, arco argumentativo |
| **Performativo** | Experiencia subjetiva, emocional, en primera persona; el cineasta es el material. | Agnès Varda; personal essay documental. | rol narrador-1a-persona, arco narrativo |

**Implicación de diseño.** La elección de modo es una decisión estructural que antecede al guión: configura qué puede y no puede hacer el video. Un expositivo que de pronto se vuelve participativo sin preparación quiebra el contrato tácito con el espectador. El modo debería quedar declarado como parte del Concept Brief (vía el eje `rol-presentador` y `arco-dominante`).

**Atención al matiz.** Los modos son *tendencias dominantes*, no etiquetas puras. La mayoría de los documentales modernos mezclan (Kurzgesagt: expositivo + poético; Johnny Harris: participativo + expositivo). La utilidad del vocabulario es nombrar la combinación dominante y las desviaciones conscientes.

### 9.2 La voz del documental: autoridad vs encuentro [P1-§9.2]

Nichols distingue dos grandes posturas de la voz autoral documental:

- **Voice-of-god (voz de dios).** 3a persona, fuera de cuadro, tono autoritativo, ocultación del proceso de investigación. Asume un punto de vista objetivo. Es el default del modo expositivo. Ventaja cognitiva: maximiza el principio de coherencia (Mayer #1) — ninguna distracción por el cineasta como personaje. Desventaja: invisibiliza la subjetividad real del corte y la edición, puede sonar dogmática.

- **Voice of encounter (voz de encuentro).** 1a persona, visible o escuchable, revela el proceso. El espectador ve al cineasta preguntar, dudar, ajustar su tesis. Es característica de los modos participativo y performativo. Ventaja: transparencia epistémica, identificación emocional. Desventaja: suma carga extraña si el cineasta compite con el contenido central.

**Implicación.** Para videos con `objetivo-cognitivo: orientarse` (divulgación, periodismo visual), la voz de encuentro funciona cuando el cineasta es parte del descubrimiento (Johnny Harris investigando). Para `objetivo: corregir-intuicion` (Veritasium), la voz expositiva o semi-participativa suele ser más eficiente: el cineasta interviene para desafiar al espectador, no para narrar su propio proceso. Para `arco: argumentativo` + `rol: narrador-1a-persona` (video-ensayo), la voz de encuentro es inherente al género.

**Relación con §2.3-#11 (voz de Mayer).** El principio de voz de Mayer opera en la dimensión prosódica (cálida vs sintética). La dimensión autoral de Nichols opera en la dimensión enunciativa (quién habla, desde dónde). Son ortogonales: un voice-of-god puede ser cálido; un voice-of-encounter puede ser plano. Ambas dimensiones afectan la recepción.

### 9.3 Las cuatro tendencias de Renov [P1-§9.3]

Renov (2004, *The Subject of Documentary*) identifica cuatro **tendencias fundamentales** del modo documental, que funcionan como propósitos retóricos superpuestos:

1. **Registrar / revelar / preservar.** Función archivística; el documental como testimonio. Base de docus históricos, de memoria colectiva. Objetivo cognitivo dominante: `orientarse`.
2. **Persuadir / promover.** Función retórica; el documental argumenta una tesis o promueve una causa. Base del video-ensayo político, documental de campaña. Objetivo: `formar-opinion`.
3. **Analizar / interrogar.** Función epistémica; el documental pregunta y examina. Base del periodismo visual, investigativo. Objetivo: `orientarse` con matiz argumentativo.
4. **Expresar.** Función estética y subjetiva; el documental como vehículo de expresión autoral. Base del ensayo fílmico, personal essay. Objetivo: `apreciar` o `formar-opinion`.

Renov argumenta que estas cuatro tendencias están *siempre presentes* en cualquier documental, en proporciones distintas. El diseño deliberado del Concept Brief debería declarar cuál es la dominante y cuáles son las subordinadas, para evitar videos que persiguen todas a la vez y no logran ninguna.

**Implicación de diseño.** El campo `objetivo-cognitivo` del Concept Brief mapea aproximadamente a la tendencia dominante de Renov. Los briefs de fase 4 pueden referenciar esta sección cuando la decisión varíe por objetivo (retrieval, CTA, métricas de efecto, voz-registro).

### 9.4 Ética documental y honestidad material [P1-§9.4]

La tradición documental ha codificado, con grados variables de consenso, una serie de principios éticos que aplican a cualquier video con pretensión factual —incluidos divulgación, periodismo visual y documental narrativo pedagógico:

- **Distinción explícita entre material original, archivo y recreación.** Una toma de archivo presentada como observación directa del presente, o una recreación presentada como documento, viola el contrato factual. La convención profesional es etiquetar archivo ("Archivo · 1987") y recreación ("Recreación") en pantalla cuando haya ambigüedad.
- **Consentimiento informado de sujetos.** Personas identificables filmadas deben entender que serán parte del material. En contextos pedagógicos con menores, vulnerables o contextos sensibles, el estándar es más estricto.
- **Fidelidad al sentido del material.** Editar una cita de un entrevistado de modo que distorsione su posición es una falta documental tradicional, independientemente de si las palabras literales aparecen. Aplica también a clips descontextualizados de archivo.
- **Declaración de conflictos de interés.** Un video que promueve un producto, una institución o una tesis con interés comercial o político del creador debe declararlo —no por corrección externa, sino porque el espectador no puede evaluar el argumento sin esa información.

**Relación con fundamentos cognitivos.** La ética documental no es un anexo moralista — es una condición de posibilidad del aprendizaje. Un espectador que descubre que fue engañado sobre la fuente del material experimenta un error de predicción masivo (§1.3) que contamina retrospectivamente todo lo aprendido. El costo reputacional es para el creador; el costo cognitivo es para el espectador.

---

## 10. Teoría del ensayo fílmico [P1-§10]

El video-ensayo, el personal essay pedagógico y ciertos tramos de divulgación con voz autoral fuerte caen en la categoría del **ensayo fílmico** (*essay film*). Esta tradición tiene su propia teoría —distinta de la documental— que ilumina decisiones que la cognición multimedia no cubre: cómo estructurar un argumento sin resolverlo dogmáticamente, cómo fusionar la voz del autor con la del narrador, cómo consolidar sin examinar.

### 10.1 El ensayo como cine del pensamiento [P1-§10.1]

Rascaroli (2009, *The Personal Camera*; 2017, *How the Essay Film Thinks*) caracteriza el ensayo fílmico como **cine que piensa en alta voz**. No presenta conclusiones cerradas; exhibe el proceso de pensamiento del autor. Es un género **interstitial**: entre documental y ficción, entre narrativa y argumento, entre exposición y poesía.

Corrigan (2011, *The Essay Film*) complementa con tres componentes constitutivos:

1. **Subjetividad expresiva** — una voz autoral reconocible y presente; el ensayista como personaje.
2. **Experiencia pública** — el ensayo se ocupa de un objeto del mundo (una película, un fenómeno social, una idea), no solo de la interioridad del autor. Es un *pensar sobre algo*, no un diario.
3. **Pensamiento en proceso** — el ensayo piensa mientras avanza; no presenta un resultado pre-formado. El espectador acompaña el razonamiento, no lo recibe.

**Implicación de diseño.** El ensayo fílmico es estructuralmente distinto al tutorial o al expositivo. Aplicar principios instruccionales clásicos (pre-entrenamiento completo, retrieval explícito, CTA de aplicación) produce un híbrido desafortunado — ni piensa bien ni enseña bien. Los briefs deben poder diferenciar.

### 10.2 La voz autoral en el ensayo [P1-§10.2]

El ensayo exige **enunciación en primera persona**: "yo pienso", "yo observo", "me parece". Esta no es la voz del presentador didáctico en 2a persona ("tú aprenderás") sino la voz del pensador que invita al espectador a acompañarlo ("conmigo").

Consecuencias operativas:

- **Fusión de autor y narrador.** A diferencia del documental expositivo —donde la voice-of-god suena despersonalizada— en el ensayo la voz es inseparable de la persona. El tono, las dudas, los cambios de ritmo son rasgos autorales.
- **Direct address al espectador.** El ensayo habla al espectador como interlocutor, no como audiencia pasiva. Contrapoints interpela; Nerdwriter piensa con el espectador. Esto no viola el principio de personalización de Mayer (#10) — lo amplifica en una dirección distinta.
- **Contradicción y digresión como recursos.** El ensayista puede contradecirse deliberadamente, abrir una digresión aparente y volver, porque el objeto del video es el proceso de pensamiento, no la conclusión.

**Relación con cognición multimedia.** El principio de coherencia (Mayer #1) no se viola por las digresiones del ensayo si tienen función argumentativa o expresiva. Lo que el principio prohíbe son distracciones sin función — las digresiones del buen ensayista sí tienen función, aunque no sea obvia en el momento. Los briefs deben reconocer esta distinción.

### 10.3 Estructura argumentativa del ensayo [P1-§10.3]

El ensayo no sigue la estructura del tutorial (intro → paso 1 → paso 2 → ... → cierre) ni la del documental narrativo (arco temporal de tres actos). Suele organizarse como:

1. **Apertura como entrada al problema.** Una imagen, una cita, una pregunta concreta que introduce el objeto sin declarar la tesis final.
2. **Exploración dialéctica.** Presentación de posiciones, ejemplos, contra-ejemplos. El ensayista avanza argumentos, se detiene a considerar objeciones, gira el ángulo.
3. **Acumulación retórica.** Capas sucesivas que refuerzan, complejizan o matizan el argumento central, que puede no haberse declarado todavía.
4. **Síntesis abierta.** El cierre no resuelve dogmáticamente; propone una forma de ver el objeto, deja la decisión final al espectador.

Esta estructura es **argumentativa pero no deductiva**. No va de premisas a conclusión; acumula evidencia y puntos de vista que convergen hacia una posición que el espectador debe completar.

**Implicación para briefs.** La segmentación (Mayer #6) sigue aplicando, pero los segmentos no son pasos procedimentales — son movimientos de pensamiento. El brief de estructura (`guion/03-estructura`) debería ofrecer este template alternativo cuando `arco-dominante: argumentativo` + `rol-presentador: narrador-1a-persona`.

### 10.4 Consolidación retórica vs retrieval instruccional [P1-§10.4]

La práctica de recuperación activa (§6.3, §8.1) —preguntar al espectador, insertar micro-ejercicios, pausar para reflexionar— es la práctica óptima de consolidación para `objetivo: adquirir-habilidad` o `corregir-intuicion`. Es **contraproducente** para `objetivo: formar-opinion` o `apreciar`.

El ensayo consolida por **resonancia retórica**, no por testeo cognitivo:

- **Retorno a la imagen inicial.** El ensayo vuelve al objeto de la apertura con la densidad acumulada del argumento. El espectador "re-ve" la imagen transformada.
- **Cita culminante.** Una frase, una referencia, una imagen que cristaliza el argumento sin resumirlo.
- **Eco temático.** Elementos recurrentes a lo largo del video se cierran al final con un significado nuevo.

Un ensayo que termina con "¿entendiste? Responde estas 3 preguntas" rompe el pacto retórico del género. El espectador no vino a ser examinado; vino a pensar con el ensayista. La consolidación es interna y posterior al video.

**Implicación para briefs.** El brief de retrieval/consolidación (`guion/05-retrieval`) debe declarar `varia-por-eje: [objetivo-cognitivo, arco-dominante]` y ofrecer al menos dos sub-bloques: uno para objetivo-cognitivo ∈ {adquirir-habilidad, corregir-intuicion} (retrieval explícito) y otro para {formar-opinion, apreciar} (consolidación retórica, sin testeo). El brief de métricas de efecto (`publicacion/08-metricas-aprendizaje`) tiene el mismo problema: el éxito del ensayo se mide por resonancia (shares, comentarios reflexivos, cambio de posición), no por post-test.

---

## 11. Retórica visual y periodismo de datos [P1-§11]

Los videos con alto componente de datos —periodismo analítico visual (Johnny Harris, Vox Atlas), divulgación cuantitativa (Veritasium con estadísticas), explainer comercial con evidencia de mercado— exigen decisiones que la cognición multimedia atiende sólo parcialmente. La tradición del **periodismo de datos** y la **retórica visual** ofrece principios más específicos.

### 11.1 Gramática visual de datos [P1-§11.1]

Cleveland & McGill (1984) establecieron la **jerarquía de precepción perceptual** para encoding cuantitativo, confirmada y refinada por Ware (2021, *Information Visualization*). De mayor a menor precisión de decodificación:

1. **Posición en escala común.** Gráfico de barras horizontal, puntos en eje.
2. **Posición en escalas no alineadas.** Small multiples con distintos rangos.
3. **Longitud.** Barras sin escala común.
4. **Ángulo / pendiente.** Líneas de tendencia.
5. **Área.** Círculos, treemaps.
6. **Volumen / color saturación / color hue.** Lo más impreciso.

**Implicación.** Cuando el creador debe transmitir un valor cuantitativo preciso, debe elegir el encoding más alto de la jerarquía que el caso permita. Un pie chart (encoding por ángulo) es peor que un gráfico de barras (longitud) para comparación precisa; un mapa de calor (hue) es peor que ambos.

Ware agrega el concepto de **preattentive processing**: ciertas propiedades visuales (color saturado, orientación distinta, tamaño muy dispar) se procesan en <200ms sin foco atencional consciente. Usar estas propiedades para señalar el dato clave (vs el contexto) acelera dramáticamente la lectura.

### 11.2 Data-ink ratio y el principio de minimalismo funcional [P1-§11.2]

Tufte (1983/2001, *The Visual Display of Quantitative Information*) propone el **data-ink ratio**: la proporción de tinta (pixeles, elementos gráficos) que codifica datos, vs tinta decorativa. Principio: maximizar data-ink, minimizar todo lo demás.

Su corolario —**eliminar chartjunk**— se refiere a: gridlines prominentes, bordes innecesarios, gradientes decorativos, iconos figurativos sin información, 3D en gráficos 2D, colores aleatorios que no codifican categorías.

**Relación con Mayer (#1 coherencia).** Tufte y Mayer convergen: lo decorativo no-funcional degrada la comunicación. Tufte opera en la dimensión gráfica; Mayer en la cognitiva. Ambos prohíben lo mismo.

**Matiz: anotación.** Tufte prohíbe chartjunk pero **requiere** anotación narrativa. En periodismo visual la anotación es parte del dato. Ver Cairo (2016, *The Truthful Art*, capítulo sobre "insightful charts"): el gráfico que no dice qué significa es incompleto.

### 11.3 Investigación visible: el método mostrado [P1-§11.3]

El periodismo analítico visual (Johnny Harris, Vox Atlas, Bloomberg Originals) ha popularizado una convención retórica: **mostrar el proceso de investigación**. No sólo la conclusión sino cómo se llegó.

Elementos típicos:
- **On-screen lookups.** El presentador aparece consultando un documento, una base de datos, un archivo.
- **Map zoom / data zoom.** Animaciones que muestran cómo se acotó el objeto de análisis.
- **Citas visibles.** URLs, nombres de fuentes, fechas sobreimpresas.
- **Dudas del presentador.** "Esto me sorprendió", "no esperaba esto".

**Función cognitiva.** Hace visible el trabajo epistémico del análisis. El espectador aprende no solo el resultado sino **cómo se sabe** — que es la mitad de la alfabetización mediática. Tiene base en la idea de Cairo (2016) de "enlightening charts": las visualizaciones que enseñan algo sobre el mundo, incluidas las limitaciones de lo que muestran.

**Implicación para `rol-presentador: investigador`.** El brief de b-roll (`edicion/06-b-roll`) debería prescribir, para esta modalidad, material que documenta el proceso (screenshots de fuentes, tomas del presentador investigando, etc.), no stock b-roll genérico. El brief de hook (`guion/02-hook`) puede abrir con el momento de descubrimiento, no con la tesis.

### 11.4 Ética del dato visual [P1-§11.4]

Cairo (2019, *How Charts Lie*) y Tufte codifican los principales vicios del dato visual:

- **Truncated axis.** Eje Y que no empieza en cero para inflar diferencias pequeñas. Legítimo si declarado explícitamente y el caso lo amerita; engañoso si oculto.
- **Dual Y-axis.** Dos escalas distintas en un mismo gráfico generan correlaciones espurias.
- **Inconsistent aspect ratio.** Estirar un gráfico horizontal o verticalmente altera la percepción de la pendiente.
- **Cherry-picked range temporal.** Mostrar un intervalo que confirma la tesis y omitir el contexto más amplio.
- **Escalas no lineales sin etiquetar.** Logarítmica, exponencial sin aviso.
- **3D decorativo.** Distorsiona percepción de magnitud.

**Implicación ética y cognitiva.** Estas son violaciones del contrato factual (§9.4). Son también violaciones cognitivas — generan interpretaciones erróneas que luego son difíciles de corregir (ver §6.1 sobre cambio conceptual: los misconceptions persisten si no se desafían).

**Briefs aplicables.** Overlays auxiliares (`edicion/10-overlays-auxiliares`) con visualizaciones de datos deberían auto-verificar estas condiciones o declarar explícitamente cuando un gráfico usa truncamiento intencional por razones narrativas.

---

## 12. Active learning y conferencia efectiva [P1-§12]

La conferencia grabada (TED, keynote, ponencia académica) y —en menor medida— el live stream educativo son modalidades donde el formato de exposición se parece más a la clase magistral tradicional que al video editado heavy. La pregunta es: ¿qué hace que esa exposición en vivo funcione cuando se graba y se convierte en video? La respuesta involucra evidencia de active learning y principios de retórica oral.

### 12.1 La meta-evidencia contra la lectura pasiva [P1-§12.1]

Freeman et al. (2014, *PNAS*) realizaron un meta-análisis de **225 estudios** comparando métodos de enseñanza pasiva (lectura tradicional) con métodos activos (peer instruction, ConcepTests, discusión estructurada, problem solving) en cursos STEM universitarios. Resultados:

- Las tasas de fracaso (F en el curso) aumentaron **55%** en clases con enseñanza tradicional comparado con clases con aprendizaje activo.
- El efecto se sostiene a través de disciplinas, tipos de examen y tamaños de clase.
- Los autores concluyen que "la evidencia disponible es tan fuerte que se podría considerar que las clases tradicionales son el tratamiento control contra el cual las intervenciones deben demostrar su efectividad."

**Implicación para video educativo.** Un video que es esencialmente *una clase tradicional grabada* —talking head + bullets + voz explicativa sin interacción ni retrieval— opera en el modo con **peor evidencia** que existe. La modalidad "conferencia grabada" es mejor que no haber sesión, pero es peor que cualquier variante que incorpore elementos activos: ConcepTests intercalados, pausas para predicción, ejercicios guiados.

### 12.2 Peer instruction y el ConcepTest (Mazur) [P1-§12.2]

Mazur (1997, *Peer Instruction*) desarrolló en Harvard el método **ConcepTest**: la clase se interrumpe periódicamente con una pregunta conceptual que los estudiantes responden individualmente (clickers, papeles de colores), luego discuten con un compañero, luego re-responden. La conversión de respuestas correctas tras la discusión es el indicador central.

Este método codifica varios principios cognitivos simultáneamente:
- **Retrieval practice** (§6.3): el estudiante debe recuperar para responder.
- **Generation effect**: producir la respuesta propia antes de ver la correcta mejora la retención.
- **Peer explanation**: explicar a otro consolida más que escuchar la explicación correcta.
- **Feedback inmediato**: la comparación individual-vs-consenso cierra el loop predictivo (§1.3).

**Aplicabilidad en video.** El peer instruction puro (discusión entre espectadores) es impracticable en video asincrónico, pero los componentes individuales sí lo son:
- **Pregunta antes de respuesta.** El video plantea la pregunta, pausa o hace explícita la invitación a responder antes de dar la solución.
- **Predicción con feedback.** El video pide predecir un resultado, muestra el resultado real, explica la discrepancia si la hay.
- **Auto-explicación inducida.** El video pide al espectador formular su respuesta en voz alta o por escrito antes de continuar.

**Por qué el live stream degrada este patrón.** El live stream es `grado-guion: improvisado`, lo que hace difícil planear ConcepTests. Pero un streamer con práctica puede incorporar peer instruction vía chat ("¿qué creen que va a pasar? Pongan en el chat"), logrando una aproximación que es más fuerte que la conferencia pasiva.

### 12.3 Conferencia grabada: especificidades [P1-§12.3]

La charla TED, la keynote corporativa, la ponencia académica grabada comparten condiciones que las distinguen del video editado heavy:

- **El pacing está en manos del speaker, no del editor.** No hay jump cuts que compriman pausas. El silencio, la respiración, el ritmo conversacional son parte del performance. Un video editado-heavy puede comprimirlos; una conferencia grabada no puede sin destruir el performance.
- **El guión está memorizado o ensayado.** `grado-guion: guionado` pero ejecutado en vivo. La preparación del speaker es crítica — los TED talks excelentes son resultado de semanas de ensayo con audiencias pequeñas.
- **La audiencia co-produce la charla.** Risas, aplausos, preguntas en vivo configuran el ritmo. Una charla grabada ante sala vacía se nota.
- **Edición mínima es estándar.** `grado-edicion: light` — cortes multicámara limpios, cleanup de audio, quizás capítulos. No cambios estructurales; no se re-compone la charla post-hoc.

**TED template (implícito).** La práctica editorial de TED ha codificado un formato: (1) una idea que merece ser compartida (*idea worth spreading*); (2) abrir con una historia personal o imagen concreta; (3) desarrollar vía tres puntos con evidencia y anécdota; (4) cerrar con una invitación o imagen resonante. Es un arco argumentativo condensado en 12-18 minutos. No es "la" fórmula válida, pero es la convención contra la cual se lee una charla.

**Implicación para briefs.** Los briefs de grabación (todos) cambian sustancialmente para `modalidad: conferencia-grabada`: setup multi-cámara, audio de sala, no reshoots, no inserts post-hoc. El brief de pacing (`edicion/01-pacing`) no aplica — el pacing es pre-grabación, no post. El brief de voiceover (`edicion/07-voiceover`) no aplica.

### 12.4 El framework SUCCES de Heath & Heath [P1-§12.4]

Heath & Heath (2007, *Made to Stick*) proponen un framework de seis propiedades que distinguen ideas que se recuerdan y transfieren de las que se olvidan. El framework es prescriptivo-práctico, no experimental, pero está anclado en psicología cognitiva establecida:

| Propiedad | Principio | Base cognitiva |
|---|---|---|
| **Simple** | Reducir a la esencia; pensar "la frase que si el espectador recuerda una sola, recuerda esta." | Carga intrínseca (§2.1); limitación de memoria de trabajo. |
| **Unexpected** | Romper el esquema esperado; abrir brecha de curiosidad. | Error de predicción (§1.3); gap theory of curiosity (Loewenstein 1994). |
| **Concrete** | Anclar en objetos, acciones, imágenes sensoriales; evitar abstracción pura. | Codificación dual (§2.2); efecto de superioridad de la imagen. |
| **Credible** | Fuentes, datos, detalles verificables; o autoridad vivida. | Transferencia (§6.4); confianza epistémica. |
| **Emotional** | Conectar con personas concretas, no estadísticas abstractas. | Transportación narrativa (§6.2); identificable-victim effect. |
| **Stories** | Estructurar como narrativa, no como manual. | Arco narrativo facilita retención; Green & Brock (§6.2). |

**Curse of knowledge.** Heath & Heath enfatizan un sesgo clave del comunicador experto: **olvidar cómo era no saber lo que ahora sabe**. El experto explica con abstracciones que asume familiares; el espectador, que no las tiene, se pierde. El framework SUCCES es en buena parte una defensa contra este sesgo.

**Gap theory of curiosity** (Loewenstein 1994, *Psychological Bulletin*). La curiosidad se activa específicamente cuando el espectador percibe un gap entre lo que sabe y lo que podría saber, y el gap es perceptible como cierre posible. Ni muy chico (trivial) ni muy grande (abrumador). Aplica directamente al diseño del hook y de los open loops (§6.2).

**Implicación para briefs.** El framework SUCCES es especialmente relevante para `modalidad: conferencia-grabada` (donde el speaker tiene pocos recursos multimedia y depende de la construcción retórica), pero también para los hooks de cualquier modalidad. El brief de hook (`guion/02-hook`) puede usar SUCCES como checklist de autoverificación.

---

**Atención y neurociencia cognitiva**

- Corbetta, M. & Shulman, G. L. (2002). Control of goal-directed and stimulus-driven attention in the brain. *Nature Reviews Neuroscience*, 3, 201-215.
- Cowan, N. (2001). The magical number 4 in short-term memory: A reconsideration of mental storage capacity. *Behavioral and Brain Sciences*, 24(1), 87-114.
- Franconeri, S. L. & Simons, D. J. (2003). Moving and looming stimuli capture attention. *Perception & Psychophysics*, 65(7), 999-1010.
- Mark, G. (2023). *Attention Span: A Groundbreaking Way to Restore Balance, Happiness and Productivity*. Hanover Square Press.
- Petersen, S. E. & Posner, M. I. (2012). The attention system of the human brain: 20 years after. *Annual Review of Neuroscience*, 35, 73-89.
- Posner, M. I. & Petersen, S. E. (1990). The attention system of the human brain. *Annual Review of Neuroscience*, 13, 25-42.
- Schultz, W. (1997). Dopamine neurons and their role in reward mechanisms. *Current Opinion in Neurobiology*, 7(2), 191-197.
- Schultz, W., Dayan, P. & Montague, P. R. (1997). A neural substrate of prediction and reward. *Science*, 275(5306), 1593-1599.

**Aprendizaje multimedia y carga cognitiva**

- Adesope, O. O., Trevisan, D. A. & Sundararajan, N. (2017). Rethinking the use of tests: A meta-analysis of practice testing. *Review of Educational Research*, 87(3), 659-701.
- Barnett, S. M. & Ceci, S. J. (2002). When and where do we apply what we learn? A taxonomy for far transfer. *Psychological Bulletin*, 128(4), 612-637.
- Bjork, E. L. & Bjork, R. A. (2011). Making things hard on yourself, but in a good way: Creating desirable difficulties to enhance learning. En M. A. Gernsbacher et al. (Eds.), *Psychology and the Real World* (pp. 56-64). Worth Publishers.
- Cepeda, N. J., Pashler, H., Vul, E., Wixted, J. T. & Rohrer, D. (2006). Distributed practice in verbal recall tasks: A review and quantitative synthesis. *Psychological Bulletin*, 132(3), 354-380.
- Guo, P. J., Kim, J. & Rubin, R. (2014). How video production affects student engagement: An empirical study of MOOC videos. *Proceedings of the First ACM Conference on Learning @ Scale (L@S '14)*, 41-50.
- Mayer, R. E. (2009). *Multimedia Learning* (2nd ed.). Cambridge University Press.
- Mayer, R. E. (Ed.) (2014). *The Cambridge Handbook of Multimedia Learning* (2nd ed.). Cambridge University Press.
- Paivio, A. (1986). *Mental Representations: A Dual Coding Approach*. Oxford University Press.
- Roediger, H. L. & Karpicke, J. D. (2006). Test-enhanced learning: Taking memory tests improves long-term retention. *Psychological Science*, 17(3), 249-255.
- Sweller, J. (1988). Cognitive load during problem solving: Effects on learning. *Cognitive Science*, 12(2), 257-285.
- Sweller, J., van Merriënboer, J. J. G. & Paas, F. G. W. C. (1998). Cognitive architecture and instructional design. *Educational Psychology Review*, 10(3), 251-296.
- van Gog, T., Jarodzka, H., Scheiter, K., Gerjets, P. & Paas, F. (2009). Attention guidance during example study via the model's eye movements. *Computers in Human Behavior*, 25(3), 785-791.

**Percepción visual y diseño**

- Bar, M. & Neta, M. (2006). Humans prefer curved visual objects. *Psychological Science*, 17(8), 645-648.
- Beier, S. (2016). *Reading Letters: Designing for Legibility*. BIS Publishers.
- Chatterjee, A. (2002). Portrait profiles and the notion of agency. *Empirical Studies of the Arts*, 20(1), 33-41.
- Elliot, A. J. & Maier, M. A. (2014). Color psychology: Effects of perceiving color on psychological functioning in humans. *Annual Review of Psychology*, 65, 95-120.
- Maass, A. & Russo, A. (2003). Directional bias in the mental representation of spatial events: Nature or culture? *Psychological Science*, 14(4), 296-301.

**Narrativa, motivación y cambio conceptual**

- Green, M. C. & Brock, T. C. (2000). The role of transportation in the persuasiveness of public narratives. *Journal of Personality and Social Psychology*, 79(5), 701-721.
- Muller, D. A., Bewes, J., Sharma, M. D. & Reimann, P. (2008). Saying the wrong thing: Improving learning with multimedia by including misconceptions. *Journal of Computer Assisted Learning*, 24(2), 144-155.
- Posner, G. J., Strike, K. A., Hewson, P. W. & Gertzog, W. A. (1982). Accommodation of a scientific conception: Toward a theory of conceptual change. *Science Education*, 66(2), 211-227.
- Schiffman, N. & Greist-Bousquet, S. (1992). The effect of task interruption and closure on perceived duration. *Bulletin of the Psychonomic Society*, 30(1), 9-11.
- Zeigarnik, B. (1927). Über das Behalten von erledigten und unerledigten Handlungen. *Psychologische Forschung*, 9, 1-85.

**Voz y TTS en aprendizaje**

- Craig, S. D. & Schroeder, N. L. (2017). Reconsidering the voice effect when learning from a virtual human. *Computers & Education*, 114, 193-205.
- Davis, R. O., Vincent, J. & Park, T. (2019). Reconsidering the voice principle with non-native language speakers. *Computers & Education*, 140, 103605.

**Estándares de accesibilidad y subtitulado**

- W3C (2023). *Web Content Accessibility Guidelines (WCAG) 2.2*. https://www.w3.org/TR/WCAG22/
- BBC. *Subtitle Guidelines*. https://bbc.github.io/subtitle-guidelines/
- Netflix. *Timed Text Style Guide: General Requirements*. https://partnerhelp.netflixstudios.com/

**Cine documental y teoría del documental**

- Nichols, B. (2017). *Introduction to Documentary* (3rd ed.). Indiana University Press.
- Renov, M. (2004). *The Subject of Documentary*. University of Minnesota Press.

**Ensayo fílmico**

- Corrigan, T. (2011). *The Essay Film: From Montaigne, After Marker*. Oxford University Press.
- Rascaroli, L. (2009). *The Personal Camera: Subjective Cinema and the Essay Film*. Wallflower Press.
- Rascaroli, L. (2017). *How the Essay Film Thinks*. Oxford University Press.

**Retórica visual y periodismo de datos**

- Cairo, A. (2016). *The Truthful Art: Data, Charts, and Maps for Communication*. New Riders.
- Cairo, A. (2019). *How Charts Lie: Getting Smarter about Visual Information*. W. W. Norton.
- Cleveland, W. S. & McGill, R. (1984). Graphical perception: Theory, experimentation, and application to the development of graphical methods. *Journal of the American Statistical Association*, 79(387), 531-554.
- Tufte, E. R. (2001). *The Visual Display of Quantitative Information* (2nd ed.). Graphics Press.
- Ware, C. (2021). *Information Visualization: Perception for Design* (4th ed.). Morgan Kaufmann.

**Active learning y conferencia efectiva**

- Freeman, S., Eddy, S. L., McDonough, M., Smith, M. K., Okoroafor, N., Jordt, H. & Wenderoth, M. P. (2014). Active learning increases student performance in science, engineering, and mathematics. *Proceedings of the National Academy of Sciences*, 111(23), 8410-8415.
- Heath, C. & Heath, D. (2007). *Made to Stick: Why Some Ideas Survive and Others Die*. Random House.
- Loewenstein, G. (1994). The psychology of curiosity: A review and reinterpretation. *Psychological Bulletin*, 116(1), 75-98.
- Mazur, E. (1997). *Peer Instruction: A User's Manual*. Prentice Hall.
