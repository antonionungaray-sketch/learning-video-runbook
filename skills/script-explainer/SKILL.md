---
name: script-explainer
description: "Use when the user is at the script/storyboard stage of an explainer video (tutorial, divulgation, video-essay, documentary, data-journalism, product explainer, how-to, onboarding, conference, livestream, podcast, personal essay with pedagogical intent) — defining audience, pedagogical objective, hook, narrative structure, segmentation, consolidation checkpoints, or producing the script document. Etapa de guión del video-explainer-guide."
---

# Guión del explainer video

Acompañas al creador a producir un guión ejecutable basado en evidencia
cognitiva, teoría del medio, tendencias actuales y herramientas
disponibles.

## Carga obligatoria al inicio

Antes de proponer cualquier decisión, **lee todos los briefs de esta etapa**:

```
${CLAUDE_PLUGIN_ROOT}/docs/briefs/guion/*.md
```

(8 archivos de 40-80 líneas cada uno. Orden alfabético = orden de flujo:
01-audiencia → 02-hook → 03-estructura → 04-segmentacion → 05-retrieval →
06-modalidad-dual → 07-voz-registro → 08-cta.)

**NO leer pilares completos en runtime.** Los briefs ya sintetizan la
información pertinente con trazabilidad al pilar vía IDs estables
(`[P1-§X.Y]`, `[P2-ficha-<slug>]`). Si durante el flujo surge una pregunta
del usuario fuera del scope de los briefs, usa `Grep` dirigido por ID
(ej. `grep "P1-§6.4" "${CLAUDE_PLUGIN_ROOT}/docs/pilares/01-fundamentos-cognitivos.md"`), no
`Read` del archivo completo.

## Paso 0 — Concept Brief (si existe)

Antes de plantear la primera decisión, **chequeá si existe un Concept
Brief** producido por `concept-explainer`. Es el contrato upstream
que define audiencia, objetivo medible, promesa, ángulo, formato,
plataforma, tono y restricciones.

- **Si el usuario lo pasa explícitamente** (ruta o pegado): léelo,
  resúmelo en 3-5 líneas al usuario, y avisa si está `draft`.
- **Si no lo pasa pero el orquestador lo derivó**: idem, léelo y
  resume.
- **Si no hay Concept Brief**: continúa con el flujo estándar (el
  brief 01-audiencia preguntará desde cero).

**Tratamiento por estado:**

- `estado: locked` — es contrato. El brief 01-audiencia confirma con
  el usuario los datos del Concept Brief en lugar de preguntar desde
  cero. Si el usuario quiere cambiar algo significativo, pausa el
  flujo y sugiere re-invocar `concept-explainer` para re-lockear.
- `estado: draft` — avisa explícitamente: "El Concept Brief está en
  draft. Voy a usarlo como referencia pero las decisiones del guión
  pueden divergir si surgen huecos. Para fijarlo como contrato,
  re-invoca concept-explainer al cierre." Continúa normal.

El Concept Brief informa también al brief 04-segmentacion (duración),
07-voz-registro (registro/persona gramatical) y 08-cta (funnel) —
confirma con el usuario en cada uno en lugar de re-decidir desde cero
cuando ya está cubierto upstream.

## Paso 0.5 — Lectura de ejes para routing

El Concept Brief contiene una sección **0.5 Modalidad y ejes** con:
- `preset`: modalidad nombrada (o `custom`)
- `ejes`: los 5 valores explícitos (arco-dominante, objetivo-cognitivo,
  grado-edicion, grado-guion, rol-presentador)
- `plataforma`: atributo independiente

**Cada decisión del flujo** se resuelve así:

1. Leer el brief correspondiente.
2. Revisar `varia-por-eje:` en su frontmatter.
3. Si es `[]`: aplicar el brief tal cual (universal).
4. Si es `[ejeX, ejeY, ...]`: ir a la sección `## Ajuste por eje` del
   brief, tomar cada sub-bloque `### Por \`ejeX\`` y usar el bullet del
   valor de `ejeX` en el Concept Brief. Aplicar todos los ejes listados.

Si el Concept Brief **no tiene** sección 0.5 (versión anterior a la
reforma), pregunta al usuario los 5 ejes + plataforma antes de
continuar. Sin ejes no hay routing coherente. Referencia:
`${CLAUDE_PLUGIN_ROOT}/docs/arquitectura/modalidades-y-ejes.md`.

**Flag de inconsistencia:** si los ejes contradicen una decisión
previa del Concept Brief (ej. `arco-dominante: performativo` pero
objetivo declarado es `formar-opinion`), advierte al usuario — el
Concept Brief debe regresarse a `concept-explainer` para re-lockear.

## Flujo

Camina al creador por las 8 decisiones críticas **en el orden de los
briefs cargados**. Cada decisión usa EXCLUSIVAMENTE su brief
correspondiente.

Para cada decisión:

1. **Plantear la `pregunta`** del frontmatter del brief al usuario.
2. **Aplicar el test de determinismo upstream** (solo si el brief tiene
   `admite-variantes: true`):
   - Si al menos 2 de los `Casos` listados en el brief son razonablemente
     aplicables al contexto actual del usuario evaluado contra **TODOS
     los ejes** (audiencia + nivel previo + idioma/variante + duración +
     objetivo + meta-formato + decisiones previas ya aprobadas): **ofrecer
     variantes con recomendación**. Dos casos con mismo meta-formato pero
     distinto idioma/WPM NO cuentan como 2 aplicables si el usuario ya
     fijó idioma.
     Formato:
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
     Eres un ideador divergente. Tarea: generar N variantes del artefacto
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

═══ NOTAS DE PRODUCCIÓN ═══
[WPM OBJETIVO]: [número + canal visual que lo compensa]
[IDIOMA/ACENTO]: [ej. español neutro latam / peninsular / anglo]
[SUBTÍTULOS DE ACCESIBILIDAD]: [sí/no + excepción al principio de redundancia]
[CHAPTER MARKERS]: [lista por bloque]
[CONFLICTOS FLAGGEADOS]: [lista — incluye tanto P2 vs P1 como P1 vs restricción externa legal/ética]
```

Verifica antes de declarar la etapa completa:

- [ ] Audiencia + objetivo medible.
- [ ] Hook ≤15s con stakes + confirmación visual del título.
- [ ] Estructura con 3-5 bloques y open loops cerrados.
- [ ] ≥1 retrieval checkpoint cada 5-10 min.
- [ ] Marcado de modalidad dual en el guión (no solo narración).
- [ ] Registro y WPM objetivo definidos.
- [ ] CTA específico al final.
- [ ] Cero conflictos no resueltos — tanto P2 vs P1 (tendencia vs
      fundamento) como P1 vs restricción externa (legal, ético,
      accesibilidad). Si hay algún conflicto, queda flaggeado en Notas
      de Producción.

**Siguiente etapa recomendada: previsualización.** Al cerrar el
guión, sugiere al usuario pasar por `storyboard-explainer`
para fijar storyboard, pacing estimado y shotlist de demos antes
de grabar. Es opcional — si el video es re-shoot de un formato
conocido o muy simple, se puede saltar, pero documéntalo en Notas
de Producción.

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
