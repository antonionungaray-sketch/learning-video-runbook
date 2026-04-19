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

## Bibliografía

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
