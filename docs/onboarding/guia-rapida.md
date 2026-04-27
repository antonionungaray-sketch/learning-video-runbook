# Guía rápida — `video-explainer-guide`

Plugin de Claude Code que te acompaña a producir contenido pedagógico de principio a fin. Cubre dos familias de output:

- **Explainer videos** vía seis etapas (concepto, guión, previsualización opcional, grabación, edición, publicación).
- **Material didáctico no-video** *(desde v1.4.0)* — láminas didácticas secuenciales, slides para presentar en vivo (formato Marp), long-form escrito con visualizaciones — vía la skill `/material-explainer`.

Cada decisión va citada a evidencia: ciencia cognitiva del aprendizaje (Mayer, Sweller, Bjork), teoría del medio aplicable a cada modalidad (documental, ensayo fílmico, retórica visual, active learning) y casos actuales de creadores que están funcionando hoy. No te impone un estilo: te pone enfrente las opciones y los tradeoffs, tú decides.

## Qué cubre (y qué no)

El plugin cubre cualquier contenido —video o estático— con intención de que el espectador o lector aprenda algo, entienda un concepto, adquiera una habilidad, cambie una intuición o se forme una opinión con evidencia.

**Modalidades de video:**

- Tutoriales técnicos (Fireship, yvonnickfrin)
- Divulgación científica y cultural (Veritasium, Kurzgesagt)
- Video-ensayo (Nerdwriter, Contrapoints)
- Documental narrativo (Kurzgesagt largos, Netflix docs)
- Periodismo analítico visual (Johnny Harris, Vox Atlas)
- Explainer comercial / walkthrough de producto
- How-to / performance (cocina, bricolaje, maker)
- Onboarding corporativo y compliance
- Conferencia / charla grabada (TED, keynote)
- Live stream educativo (ThePrimeagen, Casey Muratori)
- Podcast audiovisual educativo (Lex Fridman, Huberman)
- Personal essay pedagógico (Ali Abdaal)

**Modalidades de material no-video:**

- Láminas didácticas secuenciales (estilo libro de historia ilustrado, como un set de 9 capítulos sobre "El origen del yoga")
- Slides para presentar en vivo (formato Marp, exportables a PDF/PPTX)
- Long-form escrito con visualizaciones embebidas (artículo editorial)

**Fuera de scope:** vlogs, reacciones, gameplay sin análisis, sketch cómico, videoclip musical, ASMR, highlights deportivos, stream conversacional abierto, video-arte, trailer/promo, contenido publicitario directo sin componente explicativo, memes, posters decorativos sin contenido secuencial. Si invocas el plugin para uno de estos, el orquestador lo identifica y te sugiere no usarlo — los principios de este toolkit *contaminan* esos géneros en lugar de mejorarlos.

## Los dos pipelines

El orquestador `/create-explainer` te pregunta primero **video o material estático**, y luego te lleva al pipeline correspondiente.

### Pipeline de video (seis etapas)

Una skill por etapa. Dos son opcionales (concepto y storyboard/previsualización), aunque las dos vienen recomendadas por default:

```
concepto → guión → [storyboard] → grabación → edición → publicación
```

### Pipeline de material no-video (dos pasos)

Una skill standalone (`/material-explainer`) con dos pasos: generar el plan didáctico (Didactic Brief) y materializarlo en uno o varios formatos:

```
mini Concept Brief (audiencia + objetivo cognitivo + restricciones)
    → Didactic Brief (mapa conceptual + secuencia + estilo visual)
    → Materializar en uno o varios:
       • prompts-laminas.md (prompts para IA de imagen, set de capítulos)
       • slides.md (formato Marp, exportable a PDF/PPTX)
       • articulo.md (long-form editorial)
```

La generación de imágenes la hace una herramienta externa (Claude artifact, GPT image, Midjourney) — la skill produce los prompts.

Si prefieres saltarte el orquestador, puedes invocar cualquier skill directamente con su slash command.

> **Figura 1.** Pipeline horizontal con las seis etapas conectadas por flechas. Las cajas de "concepto" y "storyboard" van en línea punteada para señalar que son opcionales. Cada etapa lleva un iconito: bombilla (concepto), claqueta (guion), encuadre de storyboard (previsualización), cámara (grabación), tijeras (edición), megáfono (publicación).

## Cómo se siente una sesión típica

Empiezas escribiéndole al chat algo como "quiero hacer un video corto explicando qué son los agentes MCP" o "voy a grabar un documental sobre el café colombiano". El orquestador te pregunta dos cosas: en qué etapa estás (idea, grabando, editando, publicando) y qué modalidad manejas (tutorial, divulgación, documental, podcast, live stream, etc.). Después te pasa a la skill de la etapa.

Ya dentro de la skill, te lleva por sus decisiones críticas en orden. Para cada una te propone una opción concreta, te dice de dónde viene esa recomendación (cita a la ciencia, a la teoría del medio o al caso de éxito) y, cuando hay tradeoffs reales, te ofrece variantes para que tú elijas. No avanza sin tu visto bueno.

Un recorrido completo se ve más o menos así:

- **Concepto (opcional, recomendada).** Si es un proyecto nuevo, el orquestador invoca esta etapa por default. Te lleva por audiencia, objetivo medible, promesa, ángulo distintivo, formato y duración, plataforma primaria, tono y restricciones. Salida: un *Concept Brief* en estado `draft` o `locked` que actúa de contrato para las etapas siguientes.
- **Guión.** Te pregunta por la audiencia (confirmada del Concept Brief), cómo va a ser el hook (los primeros segundos), la estructura del cuerpo, la segmentación (cuándo cortar para que el cerebro respire), consolidación/retrieval según modalidad, si vas a usar texto en pantalla con narración (modalidad dual), tu voz y registro, y el call-to-action. Salida: un guion segmentado en bloques con notas de producción.
- **Storyboard (opcional, recomendada si hay plano visual).** Si la activas, abre un editor visual basado en HTML donde armas tu storyboard cuadro por cuadro, estimas pacing, defines la shotlist y los requisitos de captura. Produce un *Production Brief* en estado `draft`. No aplica a live stream puro ni podcast conversacional sin apoyos visuales.
- **Grabación.** Con guion y (si existe) Production Brief en mano, te lleva por audio (micrófono, sala, niveles, multi-mic si es podcast), video y encuadre, iluminación, plan de escenas, captura de pantalla si aplica, tomas y plan de B-roll. Tip: aquí es donde la inversión en audio se nota más; te lo va a recordar.
- **Edición.** Pacing del corte, señalización visual (zoom, resaltados, flechas), audio loudness con estándares por plataforma (−14 LUFS para YouTube, −16 para podcast, −23 para EBU R128), texto en pantalla, subtítulos con su contrato (15-20 caracteres por segundo, máximo dos líneas), B-roll, voiceover, color, música, render y transiciones.
- **Publicación.** Título, thumbnail, descripción con capítulos, tags, cuándo programar, end screens, y dos tipos de métricas: las de la plataforma (CTR, retention) y las de efecto pedagógico (¿el espectador aprendió/entendió/cambió su intuición según la modalidad declarada?).

Por defecto, recorrer las seis etapas en una sola sesión es bastante. Es normal pausar entre etapas, exportar lo que llevas y volver más tarde.

## Los briefs lockeables (Concept, Production, Didactic)

Tres artefactos con estado que actúan como contratos. Mismo patrón los tres: header `estado: draft | locked` + `locked-at: YYYY-MM-DD`.

**Concept Brief** (producido por `/concept-explainer`, flujo de video): define audiencia, objetivo, promesa, ángulo, formato, plataforma, tono y restricciones.

**Production Brief** (producido por `/storyboard-explainer`, flujo de video): storyboard, pacing estimado, shotlist, requisitos de captura.

**Didactic Brief** (producido por `/material-explainer`, flujo de material no-video): concepto, audiencia, objetivo cognitivo, mapa conceptual con prerequisitos, secuencia didáctica de N bloques, estilo visual (preset + meta-prompt verbatim), consolidación.

Estados (los tres):
- **`draft`** — iterable. Las skills/pasos siguientes lo leen como referencia pero te avisan que está en borrador.
- **`locked`** — contrato firme. Las skills/pasos siguientes lo tratan como dado; si algo cambia, re-invocas la skill que lo produjo para re-lockear.

Si después de hacerle `lock` necesitas cambiar algo (porque cambió el alcance, porque al grabar/materializar descubriste algo), regresas a la skill correspondiente y vuelves a hacer el ciclo. No vale parchar etapas downstream saltándose esto.

> **Figura 2.** Dos cajas, "draft" a la izquierda y "locked" a la derecha, conectadas por una flecha que dice "lock cuando todo está acordado". Una flecha curva regresa de "locked" a "draft" con la etiqueta "si algo cambia post-lock, re-invoco la skill que lo produjo".

## Cuándo correr las skills de mantenimiento

El plugin se mantiene a través de tres skills de mantenimiento. No las necesitas para producir un video, pero conviene correrlas con cierta periodicidad para que las recomendaciones no se vuelvan stale:

- **`/update-trends`** cada 4-8 semanas. Refresca lo que está funcionando ahora en las plataformas e incorpora fichas de creadores nuevos.
- **`/update-tools`** cada 2-4 semanas o tras releases mayores de tu software (DaVinci, Descript, OBS, Rodecaster, etc.).
- **`/sync-briefs`** cuando aparezca un aviso de drift. Esto pasa después de actualizar pilares: el plugin detecta que algunos briefs (las síntesis intermedias) quedaron desactualizados respecto a su fuente y te avisa para regenerarlos.

El aviso de drift sale automáticamente cuando editas un pilar gracias a un hook de Claude Code que ya viene configurado en el repo del plugin. No te tienes que acordar.

## Apéndice — skills directos

Si quieres saltarte el orquestador y entrar directo a una skill (porque ya sabes en qué etapa estás), estos son los slash commands disponibles:

**Orquestador:**
- `/create-explainer` — entry point recomendado. Bifurca video vs material estático y delega.

**Flujo de video:**
- `/concept-explainer` — concepto → Concept Brief.
- `/script-explainer` — guión.
- `/storyboard-explainer` — storyboard, pacing, shotlist (opcional, recomendada).
- `/record-explainer` — pre-producción y captura.
- `/edit-explainer` — edición y post.
- `/publish-explainer` — publicación y medición.

**Flujo de material no-video:**
- `/material-explainer` — concepto + audiencia + objetivo cognitivo → Didactic Brief → materializar en láminas didácticas (`prompts-laminas.md`), slides para presentar (`slides.md` Marp), o long-form escrito (`articulo.md`).

**Mantenimiento y configuración:**
- `/setup-environment` — configurar o actualizar tu perfil de entorno (OS, preferencias, hardware, herramientas). Los skills de etapa lo leen para adaptar recomendaciones a tu setup.
- `/update-trends` — refrescar tendencias y casos.
- `/update-tools` — refrescar herramientas.
- `/sync-briefs` — re-sincronizar briefs tras cambios en pilares.

> **Figura 3** *(opcional, decorativa).* Los seis iconitos de las etapas dispuestos como portada arriba del título: bombilla · claqueta · encuadre · cámara · tijeras · megáfono.
