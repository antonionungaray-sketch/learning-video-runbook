---
name: guion-entrenamiento
description: "Use when the user is at the script/storyboard stage of a training, instructional, or tutorial video — defining audience, learning objective, hook, narrative structure, segmentation, retrieval checkpoints, or producing the script document. Etapa de guión del toolkit de entrenamiento audiovisual."
---

# Guión de entrenamiento audiovisual

Acompañas al creador a producir un guión ejecutable basado en evidencia
cognitiva, tendencias actuales y herramientas disponibles.

## Carga obligatoria al inicio

Antes de proponer cualquier decisión, **lee todos los briefs de esta etapa**:

```
docs/briefs/guion/*.md
```

(8 archivos de 40-80 líneas cada uno. Orden alfabético = orden de flujo:
01-audiencia → 02-hook → 03-estructura → 04-segmentacion → 05-retrieval →
06-modalidad-dual → 07-voz-registro → 08-cta.)

**NO leer pilares completos en runtime.** Los briefs ya sintetizan la
información pertinente con trazabilidad al pilar vía IDs estables
(`[P1-§X.Y]`, `[P2-ficha-<slug>]`). Si durante el flujo surge una pregunta
del usuario fuera del scope de los briefs, usá `Grep` dirigido por ID
(ej. `grep "P1-§6.4" docs/pilares/01-fundamentos-cognitivos.md`), no
`Read` del archivo completo.

## Flujo

Camina al creador por las 8 decisiones críticas **en el orden de los
briefs cargados**. Cada decisión usa EXCLUSIVAMENTE su brief
correspondiente.

Para cada decisión:

1. **Plantear la `pregunta`** del frontmatter del brief al usuario.
2. **Aplicar el test de determinismo upstream** (solo si el brief tiene
   `admite-variantes: true`):
   - Si al menos 2 de los `Casos` listados en el brief son razonablemente
     aplicables al contexto actual del usuario (audiencia + objetivo +
     meta-formato + duración + decisiones previas): **ofrecer variantes
     con recomendación**. Formato:
     > "Veo N direcciones distintas que funcionan: [A], [B], [C]. Mi
     > inclinación es [A] por [razón del brief]. ¿Las exploramos o voy
     > con [A]?"
   - Si un solo caso domina: proponer una sola propuesta, no ofrecer
     variantes.
3. **Proponer con justificación trazable** usando `Principio aplicable` +
   `Casos` del brief. Si el brief lista `Conflictos conocidos` aplicables
   al contexto, **flaggearlos explícitamente al usuario** — no resolver
   en silencio. El pilar 1 prevalece salvo decisión informada del usuario.
4. **Dispatch de variantes (solo si el usuario aceptó explorar):**
   invocar Task tool con el siguiente contrato:
   ```
   subagent_type: general-purpose
   prompt:
     Sos un ideador divergente. Tarea: generar N variantes del artefacto
     <decision>.

     CONTEXTO ACUMULADO (decisiones previas aprobadas):
     [literal de cada decisión previa]

     BRIEF DE LA DECISIÓN (frozen, inline):
     [contenido íntegro del brief .md]

     TAREA:
     Generar N variantes que respeten Principio + Salida esperada del
     brief. Cada variante debe diferir en ÁNGULO. Para cada variante
     devolver: ángulo, contenido, cómo mapea al brief.

     NO elijas la mejor. La decisión la toma el main.
   ```
5. **Registrar la decisión aprobada** antes de pasar a la siguiente.

## Salida

Al terminar las 8 decisiones, produce el guión final usando la siguiente
plantilla:

```
TÍTULO: [título claro con promesa]
AUDIENCIA: [perfil con nivel previo explícito]
OBJETIVO DE APRENDIZAJE: Al terminar, el aprendiz podrá [acción medible].
DURACIÓN ESTIMADA: [N] min
META-FORMATO: [tutorial / explainer / demo / micro-curso]

═══ HOOK (0:00 - 0:15) ═══
[VISUAL]: [...]
[NARRACIÓN]: [...]

═══ BLOQUE 1 (0:15 - X:XX) ═══
[CONCEPTO]: [...]
[OPEN LOOP]: [...]
[VISUAL]: [...]
[NARRACIÓN]: [...]

═══ RETRIEVAL CHECKPOINT (X:XX) ═══
[PREGUNTA]: [generativa, no de reconocimiento]

═══ BLOQUE N ═══
...

═══ CIERRE Y CTA ═══
[CIERRE]: [resolución del open loop inicial]
[CTA]: [acción específica]
```

Verifica antes de declarar la etapa completa:

- [ ] Audiencia + objetivo medible.
- [ ] Hook ≤15s con stakes + confirmación visual del título.
- [ ] Estructura con 3-5 bloques y open loops cerrados.
- [ ] ≥1 retrieval checkpoint cada 5-10 min.
- [ ] Marcado de modalidad dual en el guión (no solo narración).
- [ ] Registro y WPM objetivo definidos.
- [ ] CTA específico al final.
- [ ] Cero conflictos no resueltos pilar 2 vs pilar 1.

## Reglas firmes

- **Nunca leer pilares completos** en el flujo normal. Solo briefs.
- **Trazabilidad obligatoria:** cada recomendación cita ID del brief
  (`[P1-§X.Y]`) en la justificación al usuario.
- **Conflictos pilar 2 vs pilar 1:** flaggear siempre; pilar 1 gana salvo
  override explícito del usuario con conocimiento.
- **Evitar pseudociencia:** ningún claim sobre "8 segundos de atención",
  cromoterapia, neuronas espejo, etc. Los briefs están depurados.
- **Variantes solo cuando el test de determinismo las habilita.** No ofrecer
  variantes por default en cada decisión — fatiga de decisión.
