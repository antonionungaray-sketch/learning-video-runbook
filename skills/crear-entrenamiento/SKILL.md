---
name: crear-entrenamiento
description: "Use when the user wants to produce, create, design, plan, script, record, edit, or publish video training, instructional, educational, tutorial, course, onboarding, or corporate training content. Orquestador que identifica en qué etapa está el creador y delega al skill específico (guion / grabacion / edicion / publicacion). En español."
---

# Crear material de entrenamiento audiovisual — orquestador

Este skill es el punto de entrada del toolkit de creación de entrenamiento audiovisual. Su trabajo es **identificar dónde está el creador en el ciclo de producción** y delegar al skill específico de la etapa, manteniendo el contexto del formato (técnico vs corporativo).

## Arquitectura del toolkit

3 capas: **pilares** (source of truth) → **briefs** (síntesis precomputada con IDs estables citando los pilares) → **skills de etapa** (consumen briefs).

Este orquestador **NO lee pilares en runtime**. Su único trabajo es identificar etapa + formato y delegar al skill de etapa correspondiente. Los pilares viven en `docs/pilares/`:

- Pilar 1 (estable) — `01-fundamentos-cognitivos.md` — ciencia cognitiva, prevalece ante conflicto.
- Pilar 2 (dinámico) — `02-tendencias-y-casos.md` — tendencias y casos actuales.
- Pilar 3 (dinámico) — `03-herramientas.md` — herramientas vigentes.

Los skills de etapa (`guion-entrenamiento`, `grabacion-entrenamiento`, `edicion-entrenamiento`, `publicacion-entrenamiento`) son los únicos que tocan material pedagógico: consumen sus briefs y, si aparece una pregunta fuera del brief, hacen `Grep` dirigido por ID estable. **Los conflictos P2 vs P1 se detectan y flaggean en los skills de etapa, no acá.**

## Flujo del orquestador

1. **Identificar la etapa** del ciclo de producción donde está el creador. Pregunta solo si no es claro:
   - **Idea → Guión** — todavía no hay guión final, está conceptualizando, definiendo audiencia, estructurando.
   - **Previsualización (opcional, recomendada)** — guión cerrado, quiere validar diseño visual, pacing y shotlist de demos antes de grabar.
   - **Pre-producción y grabación** — guión listo (y opcionalmente Production Brief de previsualización), está por grabar o grabando.
   - **Edición y post** — material crudo capturado, está editando.
   - **Publicación y medición** — video editado, está por publicar o iterando con métricas.

2. **Identificar el formato** (si no es obvio):
   - **Tutorial técnico / software** — screencasts, demos de producto, tutoriales paso a paso.
   - **Formación corporativa / profesional** — onboarding, compliance, soft skills, contenido para LMS.
   - Otros formatos son válidos pero el toolkit está optimizado para los dos anteriores.

3. **Delegar al skill de etapa correspondiente**, pasando el contexto del formato:
   - Etapa de guión → invoca `guion-entrenamiento`
   - Etapa de previsualización → invoca `previsualizacion-entrenamiento`
   - Etapa de grabación → invoca `grabacion-entrenamiento`
   - Etapa de edición → invoca `edicion-entrenamiento`
   - Etapa de publicación → invoca `publicacion-entrenamiento`

4. **Puente guión → grabación.** Si el usuario cerró guión y dice ir directo a grabación, ofrecé una vez la etapa intermedia: "Antes de grabar, ¿querés pasar por `previsualizacion-entrenamiento` para fijar storyboard, pacing y shotlist? Reduce riesgo de re-grabar. También podés saltarla si es re-shoot de un formato ya conocido o video muy simple." Si el usuario salta, continuar a `grabacion-entrenamiento` sin bloquear; registrar la elección en Notas de Producción del guión. **No volver a preguntar** en la misma sesión.

## Si el usuario quiere actualizar las capas dinámicas

- Tendencias / casos de éxito → invoca `actualizar-tendencias`
- Herramientas → invoca `actualizar-herramientas`

## Reglas firmes

- **No leer pilares ni briefs.** Este orquestador no consume material pedagógico. Identifica etapa + formato y delega. Si hacés `Read` de un pilar o un brief acá, estás violando el contrato.
- **No tomar decisiones de la etapa tú mismo** — esa es función del skill específico, que consume briefs y tiene el material pedagógico cargado.
- **Si el usuario menciona varias etapas en un mismo proyecto**, atenderlas en orden: guión → previsualización (opcional) → grabación → edición → publicación. No saltar etapas, excepto previsualización que es opcional por diseño.
- **Conflictos entre pilares**: cuando un skill de etapa flaggee un conflicto, no resolverlo por defecto. Presentar el conflicto al usuario, recordar que el pilar 1 (ciencia) prevalece, y dejar la decisión final al usuario.
