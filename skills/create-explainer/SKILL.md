---
name: create-explainer
description: "Use when the user wants to produce, create, design, plan, script, record, edit, or publish an explainer video with pedagogical intent — tutorials, divulgation, video-essay, documentary, data-journalism, product explainer, how-to, onboarding, conference, livestream, podcast audiovisual, personal essay and similar formats. Orchestrator that identifies the creator's current stage and delegates to the stage-specific skill (concept / script / storyboard / record / edit / publish). Content in Spanish."
---

# Producir explainer video — orquestador

Este skill es el punto de entrada del `video-explainer-guide`. Su trabajo es **identificar dónde está el creador en el ciclo de producción** y delegar al skill específico de la etapa. El scope cubre cualquier video con intención pedagógica — tutoriales técnicos, divulgación científica, video-ensayo, documental narrativo, periodismo analítico visual, explainer comercial, how-to, onboarding, conferencia grabada, live stream educativo, podcast audiovisual, personal essay con intención de enseñar — pero **no cubre** vlogs, reacciones, gameplay, entretenimiento puro, videoclips musicales ni contenido donde no hay un concepto o habilidad que transferir al espectador (ver "Filtro de scope" al final).

## Arquitectura del toolkit

3 capas: **pilares** (source of truth) → **briefs** (síntesis precomputada con IDs estables citando los pilares) → **skills de etapa** (consumen briefs).

Este orquestador **NO lee pilares en runtime**. Su único trabajo es identificar etapa + formato y delegar al skill de etapa correspondiente. Los pilares viven en `${CLAUDE_PLUGIN_ROOT}/docs/pilares/`:

- Pilar 1 (estable) — `01-fundamentos-cognitivos.md` — ciencia cognitiva, prevalece ante conflicto.
- Pilar 2 (dinámico) — `02-tendencias-y-casos.md` — tendencias y casos actuales.
- Pilar 3 (dinámico) — `03-herramientas.md` — herramientas vigentes.

Los skills de etapa (`concept-explainer`, `script-explainer`, `storyboard-explainer`, `record-explainer`, `edit-explainer`, `publish-explainer`) son los únicos que tocan material pedagógico: consumen sus briefs y, si aparece una pregunta fuera del brief, hacen `Grep` dirigido por ID estable. **Los conflictos P2 vs P1 se detectan y flaggean en los skills de etapa, no acá.**

## Paso pre-flujo (opcional, recomendado en primera instalación): configurar entorno

Si el usuario nunca ha invocado `setup-environment` en esta máquina, sugerir:

> "¿Es tu primera vez usando el plugin en esta máquina? Puedo invocar `setup-environment` antes de entrar al flujo — construye un perfil de tu OS, preferencias y hardware, que los skills de etapa usan para adaptar recomendaciones de herramientas a tu entorno. Tarda 3-5 minutos. ¿Lo hacemos?"

Si el usuario acepta, invocar `setup-environment` primero. Si rechaza, seguir con el flujo normal — los skills de etapa funcionarán sin perfil (con recomendaciones generales).

**Señal de "primera vez":** `~/.claude/video-explainer/profile.md` no existe.

## Flujo del orquestador

1. **Identificar la etapa** del ciclo de producción donde está el creador. Pregunta solo si no es claro:
   - **Idea / concepto (opcional, recomendada por default)** — el usuario llega con una idea (vaga o no) y todavía no tiene Concept Brief que defina audiencia, objetivo, promesa, formato, plataforma y tono. Default ON al inicio del flujo.
   - **Guión** — concepto definido (Concept Brief disponible o usuario afirma claridad), está por escribir o estructurar el guión.
   - **Previsualización (opcional, recomendada)** — guión cerrado, quiere validar diseño visual, pacing y shotlist de demos antes de grabar.
   - **Pre-producción y grabación** — guión listo (y opcionalmente Production Brief de previsualización), está por grabar o grabando.
   - **Edición y post** — material crudo capturado, está editando.
   - **Publicación y medición** — video editado, está por publicar o iterando con métricas.

2. **Identificar la modalidad** (si no es obvia). El toolkit declara **12 presets de modalidad + 5 ejes estructurales + atributo plataforma** formalmente en `${CLAUDE_PLUGIN_ROOT}/docs/arquitectura/modalidades-y-ejes.md`. Los 12 presets:
   - *Instruccional:* `instruccional` · `how-to` · `onboarding` · `explainer-comercial`
   - *Divulgativa:* `divulgativa`
   - *Narrativa autoral:* `documental-narrativo-pedagogico` · `video-ensayo` · `personal-essay-pedagogico`
   - *Investigación + evidencia:* `periodismo-analitico-visual`
   - *En vivo / conversación:* `conferencia-grabada` · `live-stream-educativo` · `podcast-audiovisual-educativo`

   La elección formal del preset + declaración de los 5 ejes y la plataforma ocurre en `concept-explainer` (paso 0.5). El orquestador solo identifica tentativamente el preset para delegar al skill correcto. Si la modalidad no calza en las categorías anteriores, el creador elige `custom` en `concept-explainer` y declara los 5 ejes directamente.

3. **Delegar al skill de etapa correspondiente**, pasando el contexto de la modalidad:
   - Etapa de concepto → invoca `concept-explainer`
   - Etapa de guión → invoca `script-explainer`
   - Etapa de previsualización / storyboard → invoca `storyboard-explainer`
   - Etapa de grabación → invoca `record-explainer`
   - Etapa de edición → invoca `edit-explainer`
   - Etapa de publicación → invoca `publish-explainer`

4. **Default ON de concepto al inicio del flujo.** Cuando el usuario arranca un proyecto nuevo (no menciona que ya tiene guión, ni Concept Brief, ni Production Brief), invoca `concept-explainer` por default — incluso si el usuario describió la idea con cierto detalle. El skill mismo hace un diagnóstico de claridad y salta dimensiones ya cubiertas (no es redundante para usuarios con idea sólida). Dos formas de saltarlo:
   - **Usuario pasa Concept Brief existente** (locked o draft): registra la ruta y pasa directo a `script-explainer`, que lo consumirá.
   - **Usuario afirma claridad explícita** ("ya tengo el concepto, vamos directo a guión"): respeta la elección, pasa a `script-explainer`. Documenta la decisión — si guión detecta huecos, puede sugerir volver acá. **No volver a preguntar** en la misma sesión.

5. **Puente guión → grabación.** Si el usuario cerró guión y dice ir directo a grabación, ofrece una vez la etapa intermedia: "Antes de grabar, ¿quieres pasar por `storyboard-explainer` para fijar storyboard, pacing y shotlist? Reduce riesgo de re-grabar. También puedes saltarla si es re-shoot de un formato ya conocido, un live stream, o un podcast audiovisual donde el storyboard visual no aplica." Si el usuario salta, continuar a `record-explainer` sin bloquear; registrar la elección en Notas de Producción del guión. **No volver a preguntar** en la misma sesión.

## Si el usuario quiere actualizar las capas dinámicas

- Tendencias / casos de éxito → invoca `update-trends`
- Herramientas → invoca `update-tools`

## Reglas firmes

- **No leer pilares ni briefs.** Este orquestador no consume material pedagógico. Identifica etapa + modalidad y delega. Si haces `Read` de un pilar o un brief acá, estás violando el contrato.
- **No tomar decisiones de la etapa tú mismo** — esa es función del skill específico, que consume briefs y tiene el material pedagógico cargado.
- **Si el usuario menciona varias etapas en un mismo proyecto**, atenderlas en orden: concepto (opcional, default ON) → guión → storyboard (opcional) → grabación → edición → publicación. No saltar etapas, excepto concepto y storyboard que son opcionales por diseño.
- **Conflictos entre pilares**: cuando un skill de etapa flaggee un conflicto, no resolverlo por defecto. Presentar el conflicto al usuario, recordar que el pilar 1 (ciencia y teoría del medio) prevalece, y dejar la decisión final al usuario.

## Filtro de scope

Antes de delegar, verificar que el proyecto del usuario tiene **intención pedagógica** (el espectador debe aprender algo, cambiar una intuición, entender un procedimiento, decidir mejor informado, internalizar una habilidad, reestructurar una creencia con evidencia).

**Casos fuera de scope — sugerir no usar este toolkit:**
- Vlog personal o de viaje (narrativa afectiva sin concepto que transferir).
- Reacción pura a contenido (reaction video).
- Gameplay sin comentario didáctico.
- Sketch cómico, stand-up, monólogo de entretenimiento.
- Videoclip musical, live session artística.
- ASMR, contenido de relajación.
- Highlights deportivos sin análisis.
- Stream conversacional abierto sin arco de aprendizaje.
- Video-arte experimental.
- Trailer / teaser / promo.
- Contenido publicitario directo sin componente explicativo.

Si el caso es borderline (ej. reseña que puede ser pedagógica o solo opinión; documental contemplativo vs documental didáctico; podcast que varía entre conversacional libre y conversación pedagógica), **preguntar al usuario** si hay intención de que el espectador aprenda/entienda algo específico. Si la respuesta es sí, continuar. Si no, recomendar una guía de producción general en vez de este toolkit.
