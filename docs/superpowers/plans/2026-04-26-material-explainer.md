# Material Explainer Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Agregar al plugin `video-explainer-guide` una skill nueva (`material-explainer`) que produce material didáctico no-video — láminas didácticas secuenciales (estilo el set de "El origen del yoga"), slides para presentar en vivo, y long-form escrito con visualizaciones — desde un mismo *Didactic Brief* intermedio. La skill aprovecha el Pilar 1 (cognición) y los principios medium-agnostic del Pilar 2 sin tocar el flujo de video.

**Architecture:** Skill markdown-only (sin runtime) que carga 7 briefs nuevos en `docs/briefs/material/` (contrato idéntico al resto del repo: frontmatter con IDs estables del Pilar 1, bloques fijos, citación trazable). Flujo de 2 pasos: (1) genera `didactic-brief.md` editable en el directorio del usuario; (2) materializa en uno o varios formatos. La generación de imágenes la hace una herramienta externa (Claude artifact, GPT image, Midjourney) — la skill produce los prompts. El orquestador `create-explainer` gana una bifurcación inicial "video vs material".

**Tech Stack:** Markdown puro, YAML frontmatter, bash POSIX para los scripts existentes (extender `regenerar-vistas.sh`; `verificar-briefs.sh` ya escanea recursivamente). Sin código ejecutable nuevo.

**Spec:** [/home/antonio/.claude/plans/quiero-hacer-una-warm-mochi.md](/home/antonio/.claude/plans/quiero-hacer-una-warm-mochi.md)

---

## File Structure

**Crear:**
- `docs/briefs/material/01-secuenciacion-conceptual.md`
- `docs/briefs/material/02-densidad-y-bloque.md`
- `docs/briefs/material/03-soporte-visual.md`
- `docs/briefs/material/04-retrieval-y-consolidacion.md`
- `docs/briefs/material/05-estilo-visual-coherencia.md`
- `docs/briefs/material/06-adaptacion-formato.md`
- `docs/briefs/material/07-prompts-imagen-IA.md`
- `docs/vistas-por-etapa/material.md` (autogenerado)
- `skills/material-explainer/SKILL.md`

**Modificar:**
- `skills/create-explainer/SKILL.md` — bifurcación inicial "video vs material"
- `scripts/regenerar-vistas.sh` — agregar `material` al array `ETAPAS`
- `CLAUDE.md` — documentar la skill nueva, la etapa `material/`, los presets
- `ROADMAP.md` — agregar "Fase 8 — Ampliación a material no-video"
- `CHANGELOG.md` — entrada `[1.3.0]`
- `.claude-plugin/plugin.json` — bump a `1.3.0`
- `.claude-plugin/marketplace.json` — bump a `1.3.0`

**Read-only (consumido por la skill nueva, no se modifica):**
- `docs/pilares/01-fundamentos-cognitivos.md` — fuente de citas vía briefs
- `skills/concept-explainer/SKILL.md` — template de referencia para el SKILL.md nuevo

---

## Notas de diseño

### El "eje" `formato`

Los 5 ejes estructurales del repo (`arco-dominante`, `objetivo-cognitivo`, `grado-edicion`, `grado-guion`, `rol-presentador`) están documentados en `docs/arquitectura/modalidades-y-ejes.md` y aplican al video. Para la etapa `material/`, los briefs 02, 04 y 06 declaran `varia-por-eje: [formato]` con valores `lamina | slide | long-form`. Eso introduce un **pseudo-eje ad-hoc** que no está formalizado en el doc de arquitectura.

**Decisión de diseño:** aceptar el pseudo-eje en v1. La razón es que:
- `verificar-briefs.sh` no parsea `varia-por-eje:` (solo `fuentes:`), así que no rompe la verificación.
- Los skills de etapa de video no tocan briefs de etapa material (y viceversa), así que no hay risk de routing cruzado.
- Formalizar `formato` como eje nuevo o como atributo separado (estilo `plataforma`) requiere extender el doc de arquitectura — work adicional que no aporta valor inmediato.

**Follow-up para futuro:** si el doc de arquitectura se extiende para incluir el atributo `formato` (similar a `plataforma`), migrar la sintaxis de `varia-por-eje: [formato]` a `varia-por-formato: [...]` en los 3 briefs. Mientras tanto, este plan asume el pseudo-eje.

### Generación de imágenes externa

La skill `material-explainer` produce **prompts**, no imágenes. La generación visual la hace una herramienta externa (Claude artifact, GPT image, Midjourney, etc.). Esa decisión se tomó en el spec con dos razones:
- Claude Code no tiene generación de imágenes integrada; intentar renderizarlas desde la skill es out-of-scope.
- El usuario itera mejor cuando puede regenerar con su tool preferida sin re-ejecutar la skill.

---

## Fase A — Setup de la etapa `material/`

**Criterio de done:**
- `docs/briefs/material/` existe.
- `scripts/regenerar-vistas.sh` reconoce la etapa `material`.
- `bash scripts/verificar-briefs.sh --strict` cierra exit 0 (no rompe nada existente).

### Task A1: Crear la carpeta `docs/briefs/material/`

**Files:**
- Create: `docs/briefs/material/.gitkeep`

- [ ] **Step 1: Crear la carpeta**

```bash
cd /home/antonio/Proyectos_local/video-explainer-guide
mkdir -p docs/briefs/material
touch docs/briefs/material/.gitkeep
```

- [ ] **Step 2: Verificar que `verificar-briefs.sh` sigue cerrando limpio**

```bash
bash scripts/verificar-briefs.sh --strict
```

Expected: exit 0, "Total briefs stale: 0" (la carpeta vacía no introduce briefs).

- [ ] **Step 3: Commit**

```bash
git add docs/briefs/material/.gitkeep
git commit -m "feat(material): crear etapa material/ para briefs no-video

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

### Task A2: Extender `regenerar-vistas.sh` para etapa `material`

**Files:**
- Modify: `scripts/regenerar-vistas.sh:14` (línea con array `ETAPAS`)

- [ ] **Step 1: Editar la línea del array de etapas**

En `scripts/regenerar-vistas.sh`, cambiar:

```bash
ETAPAS=(concepto guion previsualizacion grabacion edicion publicacion)
```

Por:

```bash
ETAPAS=(concepto guion previsualizacion grabacion edicion publicacion material)
```

- [ ] **Step 2: Verificar que el script corre sin errores (la vista material aún no existe porque la carpeta está vacía)**

```bash
bash scripts/regenerar-vistas.sh
```

Expected: imprime `Regenerado: docs/vistas-por-etapa/<etapa>.md` para las 6 etapas existentes. Para `material/` el `for brief in "$brief_dir"/*.md` no encuentra archivos (excepto `.gitkeep` que no termina en `.md`), pero sí crea `docs/vistas-por-etapa/material.md` con el header y la sección "Decisiones críticas" vacía. Eso es OK por ahora — se llenará cuando los briefs existan.

- [ ] **Step 3: Commit**

```bash
git add scripts/regenerar-vistas.sh docs/vistas-por-etapa/material.md
git commit -m "feat(scripts): agregar etapa material a regenerar-vistas

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

---

## Fase B — Crear los 7 briefs

**Criterio de done por cada brief:**
- Frontmatter completo: `decision`, `etapa: material`, `pregunta`, `fuentes` (≥3 IDs del Pilar 1), `admite-variantes`, `varia-por-eje`, `sync: 2026-04-26`, `version: 1`.
- Cuerpo con bloques fijos: `## Principio aplicable` · `## Casos` · `## Anti-patrón` · `## Heurística numérica` · `## Ajuste por eje` (solo si `varia-por-eje` no es `[]`) · `## Conflictos conocidos` · `## Salida esperada`.
- ≥5 citas inline a IDs declarados en `fuentes:`.
- Longitud 50-120 líneas.
- `bash scripts/verificar-briefs.sh --strict` cierra exit 0 después de añadir el brief.

**Patrón de referencia:** `docs/briefs/concepto/01-audiencia.md` y `docs/briefs/guion/05-retrieval.md` son los dos ejemplos más completos para copiar la estructura.

**IDs del Pilar 1 disponibles** (verificados en `docs/pilares/01-fundamentos-cognitivos.md`):
- `[P1-§2.1]` Carga Cognitiva (CLT)
- `[P1-§2.2]` Codificación dual
- `[P1-§2.3-#1]` Coherencia (Mayer 1)
- `[P1-§2.3-#2]` Señalización (Mayer 2)
- `[P1-§2.3-#3]` Redundancia (Mayer 3)
- `[P1-§2.3-#4]` Contigüidad espacial (Mayer 4)
- `[P1-§2.3-#5]` Contigüidad temporal (Mayer 5)
- `[P1-§2.3-#6]` Segmentación (Mayer 6)
- `[P1-§2.3-#7]` Pre-entrenamiento (Mayer 7)
- `[P1-§2.3-#8]` Modalidad (Mayer 8)
- `[P1-§2.3-#9]` Multimedia (Mayer 9)
- `[P1-§2.3-#10]` Personalización (Mayer 10)
- `[P1-§2.4]` Segmentación / unidad útil (Guo et al.)
- `[P1-§3.1]` Color modesto, context-dependent
- `[P1-§3.2]` Contraste WCAG
- `[P1-§4.2]` Guía de mirada
- `[P1-§5.1]` Tipografía
- `[P1-§6.1]` Confusión productiva / cambio conceptual
- `[P1-§6.2]` Zeigarnik / bucles abiertos
- `[P1-§6.3]` Retrieval / testing effect
- `[P1-§6.4]` Problema de transferencia
- `[P1-§7]` Principios de diseño basados en evidencia
- `[P1-§8.1]` Retrieval checkpoints
- `[P1-§8.2]` Espaciamiento
- `[P1-§8.3]` Variedad contextual
- `[P1-§11.1]` Gramática visual de datos (Cairo)
- `[P1-§11.2]` Data-ink ratio (Tufte)
- `[P1-§11.4]` Ética del dato visual
- `[P1-§12.4]` Framework SUCCES (Heath)

### Task B1: Brief `01-secuenciacion-conceptual.md`

**Files:**
- Create: `docs/briefs/material/01-secuenciacion-conceptual.md`

- [ ] **Step 1: Confirmar el contenido exacto de los IDs que se citan**

```bash
grep -n "P1-§2.3-#7\|P1-§2.4\|P1-§6.4\|P1-§8.3" docs/pilares/01-fundamentos-cognitivos.md
```

Leer las secciones devueltas para tener el texto a parafrasear.

- [ ] **Step 2: Escribir el brief**

Escribir `docs/briefs/material/01-secuenciacion-conceptual.md` con esta estructura completa:

```markdown
---
decision: material/01-secuenciacion-conceptual
etapa: material
pregunta: ¿En qué orden presentas los conceptos para que cada uno active el conocimiento previo necesario para el siguiente?
fuentes:
  - P1-§2.1                   # CLT — carga intrínseca y nivel previo
  - P1-§2.3-#7                # pre-entrenamiento (Mayer)
  - P1-§2.4                   # segmentación / unidad útil
  - P1-§6.4                   # problema de transferencia
  - P1-§7                     # principios de diseño basados en evidencia
  - P1-§8.3                   # variedad contextual
admite-variantes: true
varia-por-eje: [objetivo-cognitivo]
sync: 2026-04-26
version: 1
---

## Principio aplicable

[Explicar: el orden de presentación gobierna la carga intrínseca acumulada. Cada concepto nuevo debe poder anclarse en uno previo activado. Citar [P1-§2.1] y [P1-§2.3-#7]. Diferencia entre prerequisito (estructural) y dependencia (referencial).]

## Casos

- **Tema histórico secuenciado por época** [P1-§2.4]: el set "El origen del yoga" arranca antes del hinduismo (Valle del Indo) → vedas → upanishads → ... → moderno. Cada bloque presupone el anterior y agrega 1 elemento nuevo. La secuencia replica el scaffolding histórico real.
- **Tema técnico con prerequisito explícito** [P1-§2.3-#7]: explicar OAuth empieza por "qué problema resuelve" (sesiones / cookies básicas conocidas) → flujo authorization code → tokens → refresh. Si el bloque 1 asume tokens, los bloques 2-3 colapsan.
- **Tema científico con cambio conceptual** [P1-§6.1]: efecto Coriolis empieza por marco rotacional → fuerza ficticia → desviación percibida. Saltar al fenómeno final ("ríos del hemisferio norte se desvían a la derecha") sin construir el marco produce memorización sin entendimiento.

## Anti-patrón

**Orden por afinidad temática del autor en vez de por prerequisitos cognitivos** [P1-§6.4]. Es tentador agrupar "todo lo del Valle del Indo en bloque 1, todo lo védico en bloque 2"; pero si bloque 2 introduce un concepto que el bloque 7 necesita, hay que adelantarlo o re-explicarlo. La secuencia se diseña hacia adelante por dependencias, no hacia atrás por categorías.

**Asumir conocimiento que la audiencia no tiene** [P1-§2.1]. Si el primer bloque requiere haber leído algo externo, la secuencia falla en el primer puente.

## Heurística numérica

- **Un concepto nuevo por bloque** [P1-§2.3-#7]. Bloques con 2+ conceptos nuevos saturan la memoria de trabajo.
- **Pre-training cap:** si para entender el bloque N hace falta explicar 3+ términos del bloque N-1, el bloque N-1 está mal segmentado o falta un bloque puente.
- **6-9 bloques** suele ser el rango sano para un tema completo. Más de 9 satura aún con buen scaffolding; menos de 6 suele sub-explicar.

## Ajuste por eje

### Por `objetivo-cognitivo`

- **`adquirir-habilidad`:** secuencia procedimental — orden por dependencias de ejecución (no se puede X sin Y). Termina en aplicación práctica.
- **`corregir-intuicion`:** secuencia que primero refuerza la intuición errónea, luego la confronta con evidencia, luego ofrece el modelo correcto. La confusión productiva [P1-§6.1] es el motor.
- **`decidir-informado`:** secuencia comparativa — establece criterios primero, luego presenta opciones contra esos criterios. Termina en matriz de decisión.
- **`orientarse`:** secuencia estilo mapa — vista panorámica del dominio primero, luego zooms a sub-dominios. Espacial > temporal cuando el dominio no tiene cronología natural.
- **`formar-opinion`:** secuencia argumentativa — premisa → evidencia → contra-argumento → síntesis. NO empezar por la conclusión.
- **`apreciar`:** secuencia evocativa — anclas sensoriales primero, contexto histórico/teórico después. La emoción precede al análisis.

## Conflictos conocidos

Cuando el tema tiene **dos secuencias naturales contradictorias** (cronológica vs. conceptual): elegir una y nombrar la elección al usuario. Híbridos confunden. Ejemplo: historia del yoga puede contarse cronológicamente (Valle del Indo → moderno) o por escuela (Hatha vs Raja vs Bhakti). Mezclar ambas en la misma serie produce vértigo.

Cuando la audiencia ya tiene mucho conocimiento previo (alto nivel), saltar bloques iniciales [P1-§7]. Forzar todo el scaffolding a un experto fastidia y dispara abandono.

## Salida esperada

Una lista numerada de N bloques con:

1. Título del bloque
2. Concepto nuevo introducido (uno solo)
3. Conocimiento previo que se asume activado (de bloque anterior o de la audiencia)
4. Por qué este orden (qué hace si lo movemos)
```

Reemplazar los corchetes `[explicar: ...]` con prosa real (50-100 palabras por bloque) consultando los IDs reales del Pilar 1 (Step 1).

- [ ] **Step 3: Verificar el brief con `verificar-briefs.sh --strict`**

```bash
bash scripts/verificar-briefs.sh --strict
```

Expected: exit 0. Si reporta IDs missing o inline missing, revisar que cada `[P1-§X.Y]` citado esté declarado en `fuentes:` y exista en el Pilar 1.

- [ ] **Step 4: Commit**

```bash
git add docs/briefs/material/01-secuenciacion-conceptual.md
git commit -m "feat(material): brief 01-secuenciacion-conceptual

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

### Task B2: Brief `02-densidad-y-bloque.md`

**Files:**
- Create: `docs/briefs/material/02-densidad-y-bloque.md`

- [ ] **Step 1: Escribir el brief**

```markdown
---
decision: material/02-densidad-y-bloque
etapa: material
pregunta: ¿Cuánta información (texto, ideas, elementos visuales) cabe en un bloque sin sobrecargar la memoria de trabajo?
fuentes:
  - P1-§2.1                   # CLT — limites de memoria de trabajo
  - P1-§2.3-#1                # coherencia — eliminar lo no esencial (Mayer 1)
  - P1-§2.3-#3                # redundancia (Mayer 3)
  - P1-§2.4                   # segmentación / unidad útil
  - P1-§7                     # principios de diseño
admite-variantes: false
varia-por-eje: [formato]
sync: 2026-04-26
version: 1
---

## Principio aplicable

[Explicar CLT — la memoria de trabajo procesa 4±1 chunks. Cada elemento no esencial en un bloque consume capacidad y reduce el espacio para procesar el concepto principal. Citar [P1-§2.1] y [P1-§2.3-#1].]

## Casos

[3-4 casos concretos de densidad apropiada por tipo de material. Ej. una lámina del set de yoga tiene: 1 título + 3-4 paneles + 1-2 cajas de "concepto clave" + footer "para estudiar". No más. Ej. una slide TED-style tiene 1 título + 1 visual + ≤3 bullets. Ej. una sección de long-form tiene 1 H2 + 200-400 palabras + 1 visual.]

## Anti-patrón

**Lámina cargada con 8+ paneles, 5 cajas de texto y un timeline complicado.** El espectador no sabe por dónde empezar a leer y su capacidad de memoria se gasta en parsing de layout, no en el concepto.

**Bullet points completos en lugar de prose narrada para presentaciones en vivo** [P1-§2.3-#3]: cuando el presentador lee lo que ya está escrito, viola el principio de redundancia. Bullets deben ser anclas, no transcripción.

## Heurística numérica

- **Lámina:** 1 concepto principal + 2-4 elementos visuales + ≤80 palabras de texto integrado.
- **Slide:** 1 concepto + 1 visual + ≤25 palabras visibles + speaker notes ilimitadas.
- **Sección de long-form:** 1 H2 + 200-400 palabras + 1-2 visualizaciones.
- **Regla universal:** si tienes que reducir el font para que quepa, eliminá contenido. No hay excepción.

## Ajuste por eje

### Por `formato`

- **`lamina`:** densidad media-alta. La lámina es autocontenida; el espectador la lee a su ritmo. Tolera más densidad que un slide pero menos que long-form. ~80 palabras + 2-4 elementos visuales.
- **`slide`:** densidad baja. El presentador agrega información hablada; el slide es ancla, no documento. ~25 palabras + 1 visual.
- **`long-form`:** densidad alta. La lectura activa permite procesar más en cada sección. 200-400 palabras + 1-2 visualizaciones por sección.

## Conflictos conocidos

Cliente que pide "más información por slide para que sirva como handout". Confunde dos formatos. Solución: producir un set de slides Y un PDF handout separado del long-form derivado del mismo Didactic Brief.

## Salida esperada

Para cada bloque del Didactic Brief, una nota explícita: "densidad target: <baja/media/alta> — N palabras, M elementos visuales".
```

(Reemplazar `[Explicar...]` y `[3-4 casos concretos...]` con prosa real consultando IDs.)

- [ ] **Step 2: Verificar**

```bash
bash scripts/verificar-briefs.sh --strict
```

Expected: exit 0.

- [ ] **Step 3: Commit**

```bash
git add docs/briefs/material/02-densidad-y-bloque.md
git commit -m "feat(material): brief 02-densidad-y-bloque

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

### Task B3: Brief `03-soporte-visual.md`

**Files:**
- Create: `docs/briefs/material/03-soporte-visual.md`

- [ ] **Step 1: Escribir el brief**

```markdown
---
decision: material/03-soporte-visual
etapa: material
pregunta: ¿Qué tipo de visual corresponde a qué tipo de concepto, y cómo se compone con el texto?
fuentes:
  - P1-§2.2                   # codificación dual
  - P1-§2.3-#2                # señalización (Mayer 2)
  - P1-§2.3-#4                # contigüidad espacial (Mayer 4)
  - P1-§2.3-#9                # multimedia (Mayer 9)
  - P1-§4.2                   # guía de mirada
  - P1-§11.1                  # gramática visual de datos
  - P1-§11.2                  # data-ink ratio
admite-variantes: true
varia-por-eje: [objetivo-cognitivo]
sync: 2026-04-26
version: 1
---

## Principio aplicable

[Explicar codificación dual + multimedia + contigüidad espacial. La taxonomía: cada tipo de concepto admite ciertos visuales y resiste a otros. Mapa para espacios geográficos; diagrama causal para procesos; comparativo para opciones; timeline para evolución; escena ilustrativa para narrativa. Citar [P1-§2.2], [P1-§2.3-#9], [P1-§2.3-#4].]

## Casos

- **Concepto geográfico → mapa con anotaciones** [P1-§4.2]: la lámina "Capítulo 1 — Antes del hinduismo" usa un mapa del Indo con flechas de monzones + ubicaciones de Harappa/Mohenjo-Daro. La espacialidad real se traduce a espacialidad visual.
- **Concepto causal → diagrama de flujo / arrow chart** [P1-§2.3-#4]: lámina "Migraciones indoarias + locales = sincretismo proto-hinduista" usa 3 fuentes con flechas convergiendo a un círculo central. El proceso se vuelve legible visualmente.
- **Concepto comparativo → matriz / lado-a-lado** [P1-§11.1]: lámina cap. 9 compara Hinduismo / Budismo / Cristianismo en 3 columnas con símbolo + concepto + definición. La estructura visual hace evidente la equivalencia funcional.
- **Concepto evolutivo → timeline horizontal** [P1-§4.2]: el footer de las láminas con "3000 a.C. → 1500 a.C." y nodos cronológicos da contexto temporal sin gastar el cuerpo de la lámina.

## Anti-patrón

**Visual decorativo que no codifica información** [P1-§11.2]. Un fondo abstracto bonito que no dice nada concreto desperdicia el canal visual. Aplica a "AI slop" — ilustraciones genéricas que no representan el concepto del bloque.

**Texto encima del visual sin contigüidad espacial** [P1-§2.3-#4]: caption a 200px de la imagen que describe degrada el aprendizaje. El texto vive *dentro* del visual o pegado a él.

## Heurística numérica

- **1 concepto = 1 tipo de visual.** Mezclar 2 tipos en una lámina (mapa + diagrama causal) suele indicar que son 2 láminas distintas.
- **Data-ink ratio alto** [P1-§11.2]: cada elemento visual debe codificar información. Decoración pura, fuera.
- **Texto integrado a ≤30px del elemento que describe** (escala visual; el principio es "leerlo sin mover los ojos lejos").

## Ajuste por eje

### Por `objetivo-cognitivo`

- **`adquirir-habilidad`:** visuales procedimentales — capturas de pantalla anotadas, diagramas de flujo de pasos, antes/después. La visual replica la ejecución.
- **`corregir-intuicion`:** visual de contraste — intuición errónea ↔ realidad, lado a lado. Predice/verifica.
- **`decidir-informado`:** matriz comparativa con criterios y opciones. Heatmap si los criterios admiten gradiente.
- **`orientarse`:** mapas, diagramas de zoom (vista panorámica → zoom progresivo). El mapa es literal o metáforico (mapa mental).
- **`formar-opinion`:** visual evocativo — fotografía editorial, ilustración de autor, símbolo culminante. La imagen es retórica.
- **`apreciar`:** visual sensorial — gama tonal completa, composición rica. La imagen *es* el contenido, no su ilustración.

## Conflictos conocidos

Cuando el preset de estilo (ver brief 05) pide ilustración rica (ej. `historico-grabado`, `narrativo-comic`) pero el objetivo cognitivo es `corregir-intuicion` o `decidir-informado` (que pide claridad analítica), hay tensión. Flaggear: la riqueza visual puede comprometer la legibilidad del contraste.

## Salida esperada

Para cada bloque, especificar:
- **Tipo de visual** (mapa / diagrama causal / comparativo / timeline / escena / matriz / etc.)
- **Elementos a representar** (qué objetos/conceptos aparecen)
- **Texto integrado** (qué etiquetas/cajas viven dentro de la visual)
```

- [ ] **Step 2: Verificar**

```bash
bash scripts/verificar-briefs.sh --strict
```

Expected: exit 0.

- [ ] **Step 3: Commit**

```bash
git add docs/briefs/material/03-soporte-visual.md
git commit -m "feat(material): brief 03-soporte-visual

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

### Task B4: Brief `04-retrieval-y-consolidacion.md`

**Files:**
- Create: `docs/briefs/material/04-retrieval-y-consolidacion.md`

- [ ] **Step 1: Escribir el brief**

```markdown
---
decision: material/04-retrieval-y-consolidacion
etapa: material
pregunta: ¿Dónde y cómo das al lector/espectador oportunidades para recuperar activamente lo aprendido?
fuentes:
  - P1-§6.3                   # retrieval / testing effect
  - P1-§8.1                   # retrieval checkpoints dentro del contenido
  - P1-§8.2                   # espaciamiento
  - P1-§8.3                   # variedad contextual
  - P1-§12.4                  # framework SUCCES (memorabilidad)
admite-variantes: true
varia-por-eje: [objetivo-cognitivo, formato]
sync: 2026-04-26
version: 1
---

## Principio aplicable

[Explicar testing effect — recuperar > releer. En material estático no hay quiz embebido, pero hay equivalentes: cajas "concepto clave", glosarios "para estudiar", pausa-y-piensa, recapitulaciones de cierre. Citar [P1-§6.3] y [P1-§8.1].]

## Casos

- **Glosario "Para estudiar" al pie de cada lámina** [P1-§6.3]: el set de yoga lista 4-6 términos por capítulo (Vedas, Shruti, Varna, Purusha Sukta...). Es retrieval pasivo invitado — el lector puede repasar sin leer el cuerpo. Funciona como spaced repetition cuando el lector vuelve días después.
- **Caja "Concepto clave" inline** [P1-§8.1]: destaca el concepto para anclaje. No es retrieval por sí mismo pero facilita la recuperación posterior.
- **Cap. 9 como recap visual** [P1-§8.2]: el último capítulo del set de yoga muestra una red conectando los 7 capítulos anteriores. Es retrieval implícito — el lector reconstruye mentalmente cada nodo.

## Anti-patrón

**Quiz formal embebido sin sentido del medio**: poner "¿qué es Brahman? a) ... b) ... c) ...?" en una lámina rompe el modo de consumo. El medio estático tolera retrieval invitado, no examen.

**Sin consolidación de cierre**: terminar el set/articulo sin un bloque de síntesis es perder la oportunidad principal de retrieval del medio.

## Heurística numérica

- **Cada lámina con "para estudiar":** 3-6 términos clave. Más es ruido.
- **Cada N capítulos un recap visual:** N=5-7 dependiendo del tema.
- **Bloque de cierre/síntesis:** 1 por set, ineludible.

## Ajuste por eje

### Por `objetivo-cognitivo`

- **`adquirir-habilidad`:** retrieval explícito en cada bloque — "intenta hacer X antes de leer la respuesta". Termina con ejercicio aplicado.
- **`corregir-intuicion`:** predice-antes-de-ver al inicio de cada bloque. Cierre con contraste explícito intuición vs. realidad.
- **`decidir-informado`:** matriz comparativa final como retrieval (el lector clasifica las opciones contra criterios).
- **`orientarse`:** mapa de cierre que conecta todos los nodos visitados. Glosarios densos.
- **`formar-opinion`:** **NO retrieval formal.** Consolidación retórica — eco temático, imagen culminante. Insertar quiz rompe el ensayo.
- **`apreciar`:** **NO retrieval formal.** Consolidación por resonancia — re-ver la imagen inicial transformada por el recorrido.

### Por `formato`

- **`lamina`:** "para estudiar" + "concepto clave" en cada lámina. Lámina final = recap visual.
- **`slide`:** speaker notes con preguntas para audiencia, slide final con resumen visual o "lo que vimos".
- **`long-form`:** glosario al final, sub-preguntas en H3, "tres ideas para llevarte" al cierre.

## Conflictos conocidos

Forzar retrieval formal en `formar-opinion` o `apreciar` contamina el género. Mismo principio que en `guion/05-retrieval` (video).

## Salida esperada

Para el Didactic Brief, una sección "Consolidación" que liste:
- Recursos de retrieval invitado por bloque (cajas concepto, glosarios "para estudiar").
- Bloques explícitos de recap (cuándo y cómo).
- Bloque de cierre/síntesis (qué reúne).
```

- [ ] **Step 2: Verificar**

```bash
bash scripts/verificar-briefs.sh --strict
```

- [ ] **Step 3: Commit**

```bash
git add docs/briefs/material/04-retrieval-y-consolidacion.md
git commit -m "feat(material): brief 04-retrieval-y-consolidacion

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

### Task B5: Brief `05-estilo-visual-coherencia.md`

**Files:**
- Create: `docs/briefs/material/05-estilo-visual-coherencia.md`

- [ ] **Step 1: Escribir el brief con los 5 presets explícitos**

```markdown
---
decision: material/05-estilo-visual-coherencia
etapa: material
pregunta: ¿Qué estilo visual elegir y cómo garantizar coherencia entre todas las piezas del set?
fuentes:
  - P1-§2.3-#1                # coherencia (Mayer 1)
  - P1-§2.3-#10               # personalización (Mayer 10)
  - P1-§3.1                   # color modesto, context-dependent
  - P1-§3.2                   # contraste WCAG
  - P1-§5.1                   # tipografía
admite-variantes: true
varia-por-eje: []
sync: 2026-04-26
version: 1
---

## Principio aplicable

[Explicar coherencia visual entre piezas. Un set se reconoce como set por su estilo común, no por cada pieza individual. Variables del estilo: paleta de color (primaria + secundaria), tipografía (header + body + accent), tratamiento ilustrativo (línea/grabado/flat/foto), composición (grid/free/comic). Citar [P1-§2.3-#1] y [P1-§3.1].]

## Casos

- **Set "El origen del yoga" — preset `historico-grabado`**: paleta tierra/sepia con acentos cromáticos por época (rojo Indo, amarillo védico, verde moderno), tipografía estilo libro de historia (display serif), ilustración tipo grabado/litografía, composición de doble página con header + paneles numerados + footer.
- **Documentación técnica IDE-style — preset `tecnico-flat`**: paleta limpia (background neutro, 2-3 acentos saturados), sans-serif moderno (Inter / IBM Plex), ilustraciones vectoriales flat sin sombras, composición grid estricta.
- **Paper-style científico — preset `cientifico-informativo`**: paleta blanco/azul/gris, tipografía sans-serif con jerarquía fuerte (heading bold + body regular), diagramas precisos sin decoración, composición de revista científica.

## Anti-patrón

**Mezclar dos estilos en el mismo set** [P1-§2.3-#1]. Un capítulo en grabado tierra y el siguiente en flat colorido rompe la lectura — el espectador procesa el cambio de estilo en lugar del contenido.

**Estilo elegido por estética en abstracto, sin alineación con el tema** [P1-§3.1]. Un tema histórico en flat plano se siente fuera de tono; un tema técnico en grabado tierra se siente pretencioso.

## Heurística numérica

- **Paleta:** 2-3 colores principales + 1-2 acentos. Más colores = ruido.
- **Tipografía:** 2 familias máximo (header + body). 3 si añades accent serif para citas.
- **Contraste body:** WCAG AA 4.5:1 mínimo [P1-§3.2]. Sin excepción.
- **Coherencia:** todas las piezas del set comparten el meta-prompt de estilo verbatim. No personalizar pieza a pieza.

## Presets de arranque

Cinco presets nombrados como punto de partida. Cada uno es un fragmento de prompt reutilizable que se inyecta verbatim en cada output del paso 2 de la skill.

### `historico-grabado`
- **Cuándo:** temas con dimensión histórica/cultural/filosófica donde la pátina del tiempo importa.
- **Paleta:** tierra/sepia (#8B6F47, #C4A484, #2C1810) + acentos cromáticos por sub-tema (rojo terracota, amarillo ocre, verde musgo, azul lapis).
- **Tipografía:** display serif (Cormorant / Playfair) para headers; serif clásico (Lora / Source Serif) para body.
- **Tratamiento:** ilustración tipo grabado o litografía, líneas finas con sombreado por hatching, sin gradientes modernos.
- **Composición:** doble página estilo libro de historia con header + paneles + footer + timeline al pie.

### `tecnico-flat`
- **Cuándo:** documentación técnica, software, APIs, arquitectura.
- **Paleta:** background neutro (off-white / gray-50) + 2-3 acentos saturados (azul electric, verde mint, rosa coral).
- **Tipografía:** sans-serif moderno (Inter / IBM Plex Sans) en todos los niveles.
- **Tratamiento:** ilustración vectorial flat sin sombras, iconos line-art, capturas de pantalla anotadas.
- **Composición:** grid estricto 12-col, jerarquía clara por tamaño y peso.

### `cientifico-informativo`
- **Cuándo:** divulgación científica, biología, física, datos.
- **Paleta:** blanco + grises + azul corporativo + 1 acento (rojo o naranja) para señalización.
- **Tipografía:** sans-serif con jerarquía fuerte (Helvetica Neue / Source Sans). Body en sans, no serif.
- **Tratamiento:** diagramas precisos estilo papers (Tufte minimalista [P1-§11.2]), sin decoración, escalas y leyendas siempre.
- **Composición:** estilo Nature / Scientific American — heading + abstract + figure dominante + caption.

### `narrativo-comic`
- **Cuándo:** temas con personajes o arco narrativo, divulgación juvenil, storytelling.
- **Paleta:** cálida (rojos, naranjas, amarillos) con sombras vivas; contraste alto.
- **Tipografía:** sans-serif rounded (Open Sans Rounded / Quicksand) o cómic (Bangers para títulos solo).
- **Tratamiento:** viñetas con personajes consistentes, balloons de diálogo, expresiones marcadas.
- **Composición:** grid de viñetas estilo cómic, gutters pronunciados, narrativa secuencial clara.

### `editorial-periodico`
- **Cuándo:** ensayos, opinión, periodismo de investigación, longreads.
- **Paleta:** neutra elegante (negro + crema + gris); 1 acento (rojo vino o azul tinta) para destacados.
- **Tipografía:** serif editorial (Garamond / Caslon / NYT Cheltenham) para headers y body; sans-serif para captions.
- **Tratamiento:** fotografía editorial blanco y negro o ilustración con grano, infografías estilo NYT/Atlantic.
- **Composición:** asimétrica con grid editorial, leading generoso, márgenes amplios.

## Diálogo de afinamiento

Tras proponer 1-2 presets relevantes según el tema, dialogar con el usuario para fijar:
1. Variaciones de paleta (paleta secundaria, acentos por sub-tema).
2. Tipografía concreta (familias específicas si tiene preferencia).
3. Motivo recurrente (ej. om mantra repetido al pie, número de capítulo en cartouche, etc.).
4. Restricciones (sin fotorealismo / sin AI slop / paleta limitada).

El resultado es el meta-prompt final que se inyecta verbatim a cada output del paso 2.

## Conflictos conocidos

Preset elegido por estética choca con objetivo cognitivo (ver brief 03 §Conflictos): ej. `narrativo-comic` para `corregir-intuicion` puede comprometer claridad analítica. Flaggear y dialogar.

## Salida esperada

Bloque de "Estilo visual" en el Didactic Brief con:
- Preset elegido (o `custom`).
- Customizaciones del diálogo (paletas concretas, tipografías concretas, motivos recurrentes).
- Meta-prompt completo (verbatim) listo para inyectar en cada output del paso 2.
```

- [ ] **Step 2: Verificar**

```bash
bash scripts/verificar-briefs.sh --strict
```

- [ ] **Step 3: Commit**

```bash
git add docs/briefs/material/05-estilo-visual-coherencia.md
git commit -m "feat(material): brief 05-estilo-visual-coherencia con 5 presets

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

### Task B6: Brief `06-adaptacion-formato.md`

**Files:**
- Create: `docs/briefs/material/06-adaptacion-formato.md`

- [ ] **Step 1: Escribir el brief**

```markdown
---
decision: material/06-adaptacion-formato
etapa: material
pregunta: ¿Cómo cambia la estructura, densidad y tono cuando el mismo Didactic Brief se materializa en lámina vs. slide vs. long-form?
fuentes:
  - P1-§2.1                   # CLT
  - P1-§2.3-#3                # redundancia (Mayer 3) — diferenciar texto hablado vs leído
  - P1-§2.3-#8                # modalidad (Mayer 8) — texto narrado vs en pantalla
  - P1-§2.4                   # segmentación
  - P1-§5.1                   # tipografía
admite-variantes: false
varia-por-eje: [formato]
sync: 2026-04-26
version: 1
---

## Principio aplicable

[Explicar: el modo de consumo del medio gobierna densidad, tono y estructura. Lámina = autoadministrada, look-and-read; el lector controla el ritmo. Slide = guiada por presenter, audio + visual simultáneos; principio de modalidad [P1-§2.3-#8] y redundancia [P1-§2.3-#3]. Long-form = lectura activa secuencial, mayor profundidad y prose.]

## Casos

- **Mismo concepto, 3 formatos**: la idea "el yoga no nace del hinduismo, nace de un sincretismo entre Valle del Indo + migraciones indoarias" se materializa así:
  - **Lámina**: 3 paneles visuales con un cierre textual en caja destacada de ≤30 palabras.
  - **Slide**: 1 título + 1 visual de las 3 culturas convergiendo + 3 bullets de 5-7 palabras + speaker notes con la prose completa.
  - **Long-form**: 1 H2 "El sincretismo proto-hinduista" + 3-4 párrafos (300-400 palabras) + 1 visualización embebida con caption.

## Anti-patrón

**Copiar-pegar prose de long-form a slide** [P1-§2.3-#3]: el bloque de texto del long-form en una slide hace que el presentador lea, violando redundancia. El slide debe ser ancla, no transcripción.

**Lámina convertida en slide sin re-densificar**: una lámina cargada (autoadministrada) usada como slide en presentación queda visualmente saturada porque el espectador no puede pausar a su ritmo.

## Heurística numérica

- **Conversión densidad:** lámina (80 palabras) → slide (25 palabras visibles + speaker notes ilimitadas) → long-form (300 palabras + visual).
- **Visualización:** lámina (visual integrado con texto), slide (visual hero + bullets separados), long-form (visual embebido con caption).
- **Tiempo de consumo target:** lámina (1-2 min/lámina autoadministrado), slide (1-2 min/slide guiado), long-form (~250 wpm de lectura activa).

## Ajuste por eje

### Por `formato`

- **`lamina`:**
  - Densidad media-alta. Visual integrado al texto.
  - Tono: sintético, declarativo. Cajas "concepto clave" + glosario "para estudiar".
  - Estructura: header + paneles numerados + footer + timeline (si aplica).
  - Output file: `prompts-laminas.md` con prompt por capítulo + meta-prompt de estilo verbatim.

- **`slide`:**
  - Densidad baja. 1 visual hero + bullets cortos + speaker notes con prose completa.
  - Tono: ancla para presenter; los bullets no son la información, la voz es.
  - Estructura: título + visual + 3 bullets + speaker notes + (opcional) prompt-imagen para generar el visual.
  - Output file: `slides.md` formato Marp.

- **`long-form`:**
  - Densidad alta. Prose completa por sección.
  - Tono: prose editorial; el lector activo procesa cada párrafo.
  - Estructura: lead + H2 por sección (= bloque del Brief) + visualizaciones embebidas + "Para profundizar" al cierre.
  - Output file: `articulo.md` markdown editorial.

## Conflictos conocidos

Cliente que pide "un solo formato que sirva para presentar Y como handout Y como artículo blog". Es 3 formatos. Negociar: producir los 3 desde el mismo Didactic Brief — el costo marginal es bajo porque comparten upstream.

## Salida esperada

Por formato seleccionado, un archivo distinto en el directorio del usuario:
- `prompts-laminas.md`
- `slides.md`
- `articulo.md`

Cada uno respeta la densidad, tono y estructura del bloque "Ajuste por eje" correspondiente.
```

- [ ] **Step 2: Verificar**

```bash
bash scripts/verificar-briefs.sh --strict
```

- [ ] **Step 3: Commit**

```bash
git add docs/briefs/material/06-adaptacion-formato.md
git commit -m "feat(material): brief 06-adaptacion-formato

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

### Task B7: Brief `07-prompts-imagen-IA.md`

**Files:**
- Create: `docs/briefs/material/07-prompts-imagen-IA.md`

- [ ] **Step 1: Escribir el brief**

```markdown
---
decision: material/07-prompts-imagen-IA
etapa: material
pregunta: ¿Cómo escribes un prompt para IA de imagen que produzca una pieza coherente con el set y libre de AI slop?
fuentes:
  - P1-§2.3-#1                # coherencia
  - P1-§2.3-#2                # señalización
  - P1-§2.3-#4                # contigüidad espacial
  - P1-§2.3-#9                # multimedia
  - P1-§3.1                   # color modesto
admite-variantes: false
varia-por-eje: []
sync: 2026-04-26
version: 1
---

## Principio aplicable

[Explicar la anatomía de un prompt efectivo: estilo (verbatim del preset) + composición (layout) + elementos (qué objetos/escenas) + texto integrado literal + restricciones (anti-slop). Cada componente sirve a un principio del Pilar 1 distinto.]

## Casos

- **Lámina del set yoga, capítulo 1**: el prompt incluye verbatim el meta-prompt de `historico-grabado`, especifica composición "doble página con header + 3 paneles numerados + footer + timeline al pie", lista elementos ("mapa del Indo con flechas de monzones, sello de piedra con figura en loto, diagrama de migraciones convergentes"), incluye el texto literal a integrar (header "CAPÍTULO 1", caja "Civilización urbana avanzada hace más de 5,000 años", footer "PARA ESTUDIAR: Monzones, Indoarios, Harappa..."), y cierra con restricciones ("paleta tierra/sepia restringida, ilustración tipo grabado, sin fotorealismo, sin AI slop").

## Anti-patrón

**Prompt vago tipo "haz una infografía sobre X"**: sin estilo verbatim ni composición concreta, la IA improvisa. Resultado: cada lámina del set se ve distinta. Coherencia rota.

**Texto descrito en vez de literal**: pedir "incluye un encabezado sobre la civilización del Indo" produce texto que la IA inventa (con typos en el caso de IA generativa de imagen). El texto literal entre comillas es lo que se integra fielmente.

**Restricciones positivas en vez de negativas para slop**: "alta calidad, profesional, hermoso" no evita slop. "Sin gradientes modernos, sin sombras realistas, sin AI slop, sin elementos genéricos de stock" sí. La IA responde mejor a exclusiones explícitas.

## Heurística numérica

- **Anatomía estable:** estilo (5-10 líneas) + composición (3-5 líneas) + elementos (1 línea por elemento) + texto literal (entre comillas) + restricciones (5-8 negaciones explícitas).
- **Verbatim del meta-prompt en cada prompt del set.** No parafrasear. El verbatim es lo que da consistencia.
- **Iteración:** si la 1a salida no convence, ajustar 1 elemento del prompt (estilo / composición / elemento puntual). No reescribir todo.

## Anatomía de prompt para set coherente

Estructura recomendada (una sección por capítulo en `prompts-laminas.md`):

```
## Capítulo N — <título>
**Concepto:** <uno solo>
**Texto integrado:** <lo que va literalmente en la lámina>

### Prompt para IA de imagen

[META-PROMPT DE ESTILO — verbatim del preset]
Paleta: <colores específicos>
Tipografía: <familias específicas>
Tratamiento: <tipo de ilustración>
Composición global: <doble página / grid / asimétrico>

[COMPOSICIÓN ESPECÍFICA DE ESTA LÁMINA]
Layout: <header + N paneles + footer>
Jerarquía: <qué domina visualmente>

[ELEMENTOS]
- <objeto/escena 1>
- <objeto/escena 2>
- ...

[TEXTO LITERAL]
- Header: "<texto exacto>"
- Caja "concepto clave": "<texto exacto>"
- Footer "para estudiar": "<lista exacta>"

[RESTRICCIONES]
- Sin fotorealismo
- Sin gradientes modernos
- Sin AI slop / elementos genéricos
- Paleta restringida a la lista de arriba
- <restricciones específicas del preset>

### Notas de iteración
- Si la 1a salida no convence: <qué ajustar>
- Variación recomendada: <opcional>
```

## Conflictos conocidos

Herramientas de IA imagen distintas responden a distintos formatos de prompt. El template anterior es testado contra Claude artifact y GPT image. Midjourney prefiere prompts más densos y con `--ar` para aspect ratio. Si el usuario usa Midjourney, sugerir adaptar a su sintaxis.

## Salida esperada

`prompts-laminas.md` con N secciones (una por capítulo), cada una con:
- Anatomía completa del prompt según el template arriba.
- Notas de iteración aplicables.
- El meta-prompt de estilo verbatim idéntico en todas las secciones (clave para consistencia).
```

- [ ] **Step 2: Verificar**

```bash
bash scripts/verificar-briefs.sh --strict
```

- [ ] **Step 3: Commit**

```bash
git add docs/briefs/material/07-prompts-imagen-IA.md
git commit -m "feat(material): brief 07-prompts-imagen-IA

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

---

## Fase C — Regenerar vista y verificar integridad

**Criterio de done:**
- `docs/vistas-por-etapa/material.md` regenerada con los 7 briefs.
- `bash scripts/verificar-briefs.sh --strict` cierra exit 0 (0 stale, 0 missing, 0 inline missing).

### Task C1: Regenerar vista de etapa material

**Files:**
- Modify (autogenerado): `docs/vistas-por-etapa/material.md`

- [ ] **Step 1: Correr el script de regeneración**

```bash
bash scripts/regenerar-vistas.sh
```

Expected: imprime `Regenerado: docs/vistas-por-etapa/material.md`. La vista lista los 7 briefs con su pregunta y fuentes.

- [ ] **Step 2: Inspeccionar la vista regenerada**

```bash
cat docs/vistas-por-etapa/material.md
```

Verificar que:
- Header con timestamp UTC.
- 7 entradas: 01-secuenciacion-conceptual ... 07-prompts-imagen-IA.
- Cada entrada con pregunta + fuentes + link al brief.

- [ ] **Step 3: Commit**

```bash
git add docs/vistas-por-etapa/material.md
git commit -m "docs(vistas): regenerar vista material con 7 briefs

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

### Task C2: Verificación final de integridad de briefs

- [ ] **Step 1: Correr verificar-briefs.sh --strict end-to-end**

```bash
bash scripts/verificar-briefs.sh --strict
echo "exit: $?"
```

Expected:
```
Total briefs stale: 0
Total IDs no encontrados en pilar: 0
Total IDs inline no declarados en fuentes: 0
exit: 0
```

Si reporta cualquier número > 0, identificar el brief y arreglarlo:
- **Stale**: actualizar `sync:` a `2026-04-26` (o regenerar el brief si el pilar cambió).
- **IDs no encontrados**: corregir el ID en `fuentes:` (typo).
- **Inline missing**: añadir el ID a `fuentes:` o quitar la cita inline.

Repetir hasta exit 0.

- [ ] **Step 2: No hay commit (verificación, no cambia archivos).** Si hubo arreglos, commit con mensaje `fix(material): arreglos post-verificación`.

---

## Fase D — Skill `material-explainer`

**Criterio de done:**
- `skills/material-explainer/SKILL.md` existe con frontmatter válido y cuerpo completo.
- Patrón del SKILL.md sigue el de `concept-explainer` (paso 0 → flujo → salida → gate de lock → reglas firmes).

### Task D1: Crear `skills/material-explainer/SKILL.md`

**Files:**
- Create: `skills/material-explainer/SKILL.md`

- [ ] **Step 1: Crear la carpeta del skill**

```bash
mkdir -p skills/material-explainer
```

- [ ] **Step 2: Escribir el SKILL.md**

Crear `skills/material-explainer/SKILL.md` con esta estructura completa:

```markdown
---
name: material-explainer
description: "Use when the user wants to produce, design, or plan static (non-video) didactic material that explains difficult concepts to audiences without prior experience — didactic infographic series ('láminas'), slide decks for live presentation, or long-form written explainers with embedded visualizations. Produces a Didactic Brief and then materializes it in one or more chosen formats. Image generation is delegated to external tools (Claude artifact, GPT image, Midjourney); this skill produces the prompts. Content in Spanish (variant: Mexican)."
---

# Material didáctico no-video

Acompañas al creador a transformar un concepto difícil + audiencia sin
experiencia + objetivo cognitivo en un **Didactic Brief**: un plan
didáctico secuenciado con scaffolding, soporte visual y consolidación,
que luego se materializa en uno o varios formatos: láminas didácticas,
slides para presentar en vivo, o long-form escrito con visualizaciones.

Este skill es la **etapa de material** del toolkit. No produce video.
La generación de imágenes se delega a una herramienta externa (Claude
artifact, GPT image, Midjourney) — este skill produce los prompts.

## Carácter recomendado

Esta etapa es **standalone**. No invoca `concept-explainer`. Tiene su
propio paso 0 ligero. Si encuentra un Concept Brief de video preexistente
en el directorio del usuario, ofrece reutilizar audiencia/objetivo/
restricciones — pero no lo exige.

## Carga obligatoria al inicio

Antes de proponer cualquier decisión, **lee los briefs de esta etapa**:

```
${CLAUDE_PLUGIN_ROOT}/docs/briefs/material/*.md
```

(7 briefs en orden alfabético = orden de flujo:
01-secuenciacion-conceptual → 02-densidad-y-bloque →
03-soporte-visual → 04-retrieval-y-consolidacion →
05-estilo-visual-coherencia → 06-adaptacion-formato →
07-prompts-imagen-IA.)

**NO leer pilares completos en runtime.** Los briefs ya sintetizan la
información con trazabilidad vía IDs estables (`[P1-§X.Y]`). Si surge
una pregunta fuera del scope de los briefs, usa `Grep` dirigido por ID.

## Paso 0 — Mini Concept Brief

Antes del flujo de briefs, registrar 4 datos vía diálogo. Si existe un
Concept Brief de video preexistente, ofrecer reutilizarlo:

```bash
ls *concept-brief*.md 2>/dev/null
```

Si encuentra uno: leerlo y preguntar al usuario "encontré <ruta> — ¿reutilizo
audiencia/objetivo/restricciones de aquí?". Si acepta, importar esos campos
y solo preguntar lo que falta (formato, estilo). Si rechaza o no hay
Concept Brief: preguntar las 4 dimensiones desde cero.

### Las 4 dimensiones

1. **Concepto(s) a explicar** — texto libre. Si son varios conceptos,
   confirmar que son del mismo dominio (no mezclar yoga + microservicios
   en el mismo set).

2. **Audiencia** — quién es y qué sabe ya. Ofrecer 3 niveles:
   - Sin experiencia (público general, primera vez con el dominio).
   - Nivel inicial (algo de exposición pero sin modelos formados).
   - Intermedio (familiaridad con el dominio, busca profundizar).

3. **Objetivo cognitivo** — usar el eje del repo. Explicar cada uno
   brevemente para que el usuario elija:
   - `orientarse` — construir mapa mental del dominio.
   - `corregir-intuicion` — reemplazar modelo erróneo por correcto.
   - `decidir-informado` — comparar opciones para una decisión.
   - `formar-opinion` — adoptar/cuestionar una tesis.
   - `apreciar` — desarrollar sensibilidad estética.
   - `adquirir-habilidad` — ejecutar una tarea nueva (raro en material
     estático sin video; flaggear y sugerir si quiere reconsiderar).

4. **Restricciones** — preguntar:
   - Tiempo de consumo target (15 min / 30 min / 1 hora / sesión completa).
   - Contexto: autoadministrado (lo lee solo) vs. presentado en vivo
     (con presenter) vs. híbrido.
   - Tono: académico / divulgativo / editorial / cercano.

Filtrar fuera-de-scope: si el concepto no tiene intención pedagógica
clara (ej. "haz un meme" / "haz un anuncio puro"), avisar y rechazar.

## Paso 1 — Generar Didactic Brief

Recorrer los briefs en orden alfabético = orden de flujo. Para cada
decisión:

1. Leer el brief.
2. Aplicar el principio + casos al input del usuario.
3. Si `admite-variantes: true`: aplicar el test de determinismo (≥2
   casos del brief aplicables al contexto → ofrecer variantes con
   recomendación).
4. Si `varia-por-eje:` no es vacío: leer el sub-bloque "Ajuste por eje"
   correspondiente al valor del eje (objetivo-cognitivo o formato).
5. Proponer con cita trazable. Flaggear conflictos del brief.
6. Esperar aprobación del usuario antes de pasar a la siguiente.

Tras los 5 primeros briefs (01-05), proponer la **secuencia didáctica
borrador** al usuario:
- N bloques con título + concepto + visual sugerido + texto curado +
  consolidación.
- El usuario revisa, comenta, ajusta.

Tras aprobación, escribir `didactic-brief.md` en el directorio actual
del usuario.

### Estructura del Didactic Brief

```markdown
# Didactic Brief — <slug del concepto>

## 0. Metadatos
- estado: draft            # draft | locked
- locked-at: —             # YYYY-MM-DD cuando pase a locked
- version: 1
- creado: <YYYY-MM-DD>

## 1. Concepto
<descripción libre del/los concepto(s) a explicar>

## 2. Audiencia
<perfil + nivel previo>

## 3. Objetivo cognitivo
`<orientarse | corregir-intuicion | decidir-informado | formar-opinion | apreciar>`

## 4. Restricciones
- Tiempo de consumo: <N min / sesión>
- Contexto: <autoadministrado | presentado-en-vivo | híbrido>
- Tono: <académico | divulgativo | editorial | cercano>

## 5. Mapa conceptual
- Conceptos a cubrir: [lista]
- Prerequisitos: [lista de cosas que la audiencia debe saber antes]
- Dependencias: [grafo o lista de "X requiere Y"]
- Orden óptimo: [secuencia justificada]

## 6. Estilo visual
- Preset: `<historico-grabado | tecnico-flat | cientifico-informativo | narrativo-comic | editorial-periodico | custom>`
- Customizaciones: [paleta concreta, tipografías concretas, motivo recurrente]
- Meta-prompt verbatim:
  ```
  [el meta-prompt completo, listo para inyectar]
  ```

## 7. Secuencia didáctica
### Bloque 1 — <título>
- **Concepto principal:** <uno solo>
- **Conocimiento previo activado:** <de qué ancla>
- **Andamiaje:** <analogía / contraste / metáfora>
- **Visual sugerido:** <mapa | diagrama causal | comparativo | timeline | escena | matriz>
- **Texto curado:** <prosa o bullets curados>
- **Términos clave:** <lista>

### Bloque 2 — ...
[mismo patrón]

...

### Bloque N — Cierre / síntesis
[recap visual + concepto transversal]

## 8. Consolidación
- Recursos por bloque: cajas "concepto clave" + glosario "para estudiar".
- Recap explícito: bloque N (síntesis).
- Bloque de cierre: <descripción>.

## 9. Conflictos flaggeados
[lista de conflictos reportados durante el flujo que quedaron sin
 resolver con el usuario]
```

## Gate de lock

Una vez completado el Didactic Brief, **pregunta explícitamente al
usuario si quiere pasarlo a estado `locked`**:

> "El Didactic Brief está completo. ¿Lo paso a `locked`? A partir de
> ahí es el contrato para la materialización — si hay cambios, hay
> que volver a esta etapa para re-lockear."

Si acepta: cambiar `estado: draft` → `estado: locked` y poner fecha
en `locked-at:`.

## Paso 2 — Materializar en uno o varios formatos

Tras lock (o draft con permiso del usuario), preguntar:

> "¿Qué formato(s) quieres materializar ahora? Puedes elegir uno o
> varios:
> - Láminas didácticas → `prompts-laminas.md`
> - Slides para presentar en vivo → `slides.md`
> - Long-form escrito → `articulo.md`"

Para cada formato seleccionado, leer el brief 06-adaptacion-formato y
producir el archivo correspondiente.

### Output `prompts-laminas.md`

Una sección por bloque del Didactic Brief, siguiendo la anatomía del
brief 07-prompts-imagen-IA. Estructura:

```markdown
# Prompts de láminas — <slug del concepto>

> Generado desde `didactic-brief.md` el <fecha>. Estilo: `<preset>`.

## Capítulo N — <título>
**Concepto:** <uno solo>
**Texto integrado:** <lo que va en la lámina>

### Prompt para IA de imagen

[META-PROMPT DE ESTILO — verbatim del Didactic Brief §6]
[COMPOSICIÓN específica de esta lámina]
[ELEMENTOS]
[TEXTO LITERAL]
[RESTRICCIONES]

### Notas de iteración
- ...
```

El meta-prompt de estilo (sección 6 del Brief) debe aparecer **verbatim
e idéntico** en cada capítulo. Eso es lo que da consistencia visual al set.

### Output `slides.md`

Formato Marp. Una slide por bloque del Didactic Brief. Estructura:

```markdown
---
marp: true
theme: default
---

# <Título del set>
<Subtítulo / autor / fecha>

---

## Bloque 1 — <título>

![visual sugerido](placeholder-1.png "<descripción>")

- Bullet 1 (≤7 palabras)
- Bullet 2
- Bullet 3

<!-- speaker-notes
[prose completa que el presenter dice durante esta slide]
-->

<!-- prompt-imagen
[opcional: prompt para generar el visual con IA — anatomía del brief 07]
-->

---

## Bloque 2 — ...
[mismo patrón]
```

### Output `articulo.md`

Markdown editorial. Estructura:

```markdown
# <Título>

<Lead de 1-2 párrafos: hook + promesa>

## Bloque 1 — <título>

<Prose 200-400 palabras>

![visualización](placeholder-1.png "<caption>")
<!-- prompt-imagen: ... -->

## Bloque 2 — ...
[mismo patrón]

## Para profundizar

- **Glosario:** [términos clave del set con definición de 1 línea]
- **Lecturas:** [referencias para extender]
```

## Edge cases

- **Re-invocación con Brief en `locked`:** detectar lock al cargar el
  archivo. Preguntar: "este brief está locked desde <fecha>; ¿re-abrir
  como `draft` o seguir directo a materializar?".

- **Conflicto Pilar 1 vs preset de estilo:** el brief 03 y 05 declaran
  cuándo hay tensión entre un preset (ej. `narrativo-comic`) y un
  objetivo cognitivo (ej. `corregir-intuicion`). Flaggear siempre y
  pedir confirmación al usuario.

- **Tema fuera-de-scope:** si el concepto no tiene intención pedagógica
  (meme, anuncio puro, broma), rechazar con mensaje claro y sugerir
  no usar este toolkit.

- **`adquirir-habilidad` sin video:** material estático no enseña
  procedimientos físicos eficazmente. Si el usuario insiste en este
  objetivo, flaggear y sugerir considerar video o demo en vivo.

## Reglas firmes

- **Nunca leer pilares completos.** Solo briefs.
- **Trazabilidad obligatoria:** cada recomendación cita ID del brief.
- **Coherencia visual:** el meta-prompt de estilo es verbatim e
  idéntico en cada output del paso 2.
- **Generación externa:** no intentes generar imágenes desde la skill;
  produce prompts.
- **No inventar consolidación cuando el objetivo no la admite:**
  `formar-opinion` y `apreciar` no llevan retrieval formal (mismo
  principio que `guion/05-retrieval` para video).
- **Evitar pseudociencia:** ningún claim sobre cromoterapia, "8s
  de atención", neuronas espejo, etc. Los briefs están depurados.
```

- [ ] **Step 3: Verificar que el archivo lee correctamente**

```bash
head -20 skills/material-explainer/SKILL.md
wc -l skills/material-explainer/SKILL.md
```

Expected: frontmatter visible, ~250-300 líneas totales.

- [ ] **Step 4: Commit**

```bash
git add skills/material-explainer/SKILL.md
git commit -m "feat(skill): material-explainer para material didáctico no-video

Skill standalone que produce un Didactic Brief y lo materializa en
láminas, slides o long-form. Carga 7 briefs de docs/briefs/material/.

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

### Task D2: Modificar `create-explainer` con bifurcación video vs material

**Files:**
- Modify: `skills/create-explainer/SKILL.md`

- [ ] **Step 1: Leer el archivo actual** (ya hecho en exploración previa, pero releer si pasaste tiempo).

```bash
cat skills/create-explainer/SKILL.md
```

- [ ] **Step 2: Modificar la sección "Flujo del orquestador" (línea ~32)**

Localizar el bloque que empieza con `## Flujo del orquestador` y antes del `1. **Identificar la etapa**`, insertar una nueva sección `## Bifurcación inicial — video vs material`. La sección "Filtro de scope" del final se mantiene.

Edit:

```markdown
## Flujo del orquestador
```

Reemplazar por:

```markdown
## Bifurcación inicial — video vs material

Antes de identificar la etapa, preguntar al usuario:

> "¿Vas a producir un **video explainer** o **material didáctico estático**
> (láminas, slides, long-form)?"

- Si **video** → continuar al flujo de orquestador estándar (abajo).
- Si **material** → invocar `material-explainer` y terminar. La skill
  `material-explainer` es standalone; no requiere paso por
  `concept-explainer` ni por las etapas de video.

Si el usuario no menciona explícitamente, inferir por las pistas:
- Menciona "video", "grabar", "editar metraje", "YouTube" → video.
- Menciona "presentación", "slides", "infografía", "lámina", "artículo",
  "post" → material.
- Borderline: preguntar.

## Flujo del orquestador (cuando es video)
```

- [ ] **Step 3: Actualizar la sección "Filtro de scope" para que aplique a ambos flujos**

Localizar `## Filtro de scope` (línea ~78) y modificar el primer párrafo:

```markdown
## Filtro de scope

Antes de delegar, verificar que el proyecto del usuario tiene **intención pedagógica** (el espectador debe aprender algo, cambiar una intuición, entender un procedimiento, decidir mejor informado, internalizar una habilidad, reestructurar una creencia con evidencia).
```

Reemplazar por:

```markdown
## Filtro de scope

Antes de delegar (a `material-explainer` o a las etapas de video), verificar que el proyecto del usuario tiene **intención pedagógica** (el espectador/lector debe aprender algo, cambiar una intuición, entender un procedimiento, decidir mejor informado, internalizar una habilidad, reestructurar una creencia con evidencia).
```

Y al final de la sección, después de la lista de "Casos fuera de scope", agregar un caso adicional específico de material:

```markdown
- Memes, anuncios puros sin componente explicativo, posters decorativos sin contenido secuencial.
```

- [ ] **Step 4: Verificar que el archivo lee correctamente**

```bash
grep -n "Bifurcación inicial\|Filtro de scope\|Flujo del orquestador" skills/create-explainer/SKILL.md
```

Expected: 3 líneas, en el orden correcto (Bifurcación antes de Flujo, Filtro al final).

- [ ] **Step 5: Commit**

```bash
git add skills/create-explainer/SKILL.md
git commit -m "feat(orquestador): bifurcación inicial video vs material

Agrega pregunta inicial 'video o material estático' antes del flujo
de identificación de etapa. Si material, delega a material-explainer.
Filtro de scope ahora aplica a ambos flujos.

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

---

## Fase E — Smoke tests end-to-end

**Criterio de done:**
- 3 dry-runs documentados con su Didactic Brief + 1 output cada uno.
- 1 caso fuera-de-scope rechazado correctamente.
- Re-invocación con Brief locked muestra el prompt de confirmación.

**Notas para el ejecutor:** los smoke tests son ejecuciones simuladas
del skill (siguiendo SKILL.md mentalmente o leyendo cada brief y
generando el output en un sample directory). NO publicar las imágenes
generadas — solo los prompts y la prosa.

### Task E1: Smoke test 1 — Caso yoga (calibrador)

**Files:**
- Create: `docs/superpowers/specs/2026-04-26-smoke-test-yoga.md` (artefacto del test)

- [ ] **Step 1: Crear directorio de sample**

```bash
mkdir -p /tmp/material-yoga
cd /tmp/material-yoga
```

- [ ] **Step 2: Ejecutar mentalmente el flujo de `material-explainer`**

Leer `skills/material-explainer/SKILL.md` y `docs/briefs/material/*.md` y simular el flujo con:
- Concepto: "El origen del yoga: 5,000 años de evolución desde el Valle del Indo hasta el yoga moderno"
- Audiencia: público general adulto sin experiencia en estudios religiosos / orientales
- Objetivo cognitivo: `orientarse`
- Restricciones: tiempo de consumo ~15 min, autoadministrado, tono divulgativo
- Preset: `historico-grabado`

- [ ] **Step 3: Producir `didactic-brief.md` y `prompts-laminas.md` en /tmp/material-yoga/**

- [ ] **Step 4: Comparar el `prompts-laminas.md` contra las 9 láminas reales que el usuario produjo ayer**

Verificar:
- ¿La secuencia de capítulos es similar (Valle del Indo → Vedas → Upanishads → ... → moderno)?
- ¿El meta-prompt de `historico-grabado` produce instrucciones que reproducirían el estilo real de las láminas?
- ¿Las cajas "concepto clave" y "para estudiar" están presentes en cada capítulo?
- ¿La síntesis cromática por época (rojo/amarillo/verde) está en el preset?

Si hay discrepancias, ajustar el preset `historico-grabado` en el brief 05 y volver a correr.

- [ ] **Step 5: Documentar el test en `docs/superpowers/specs/2026-04-26-smoke-test-yoga.md`**

```markdown
# Smoke test — material-explainer caso yoga

Fecha: 2026-04-26
Ejecutor: <quien>

## Input
[copia del input al skill]

## Didactic Brief generado
[ruta o snippet]

## Prompts de láminas
[ruta o snippet]

## Comparación contra el set real
- Coincidencias: ...
- Discrepancias: ...
- Ajustes propuestos al preset / briefs: ...

## Conclusión
[el preset reproduce / requiere ajustes / requiere rediseño]
```

- [ ] **Step 6: Commit del test**

```bash
cd /home/antonio/Proyectos_local/video-explainer-guide
git add docs/superpowers/specs/2026-04-26-smoke-test-yoga.md
git commit -m "test(material): smoke test caso yoga (calibrador)

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

### Task E2: Smoke test 2 — Caso técnico (OAuth)

**Files:**
- Create: `docs/superpowers/specs/2026-04-26-smoke-test-oauth.md`

- [ ] **Step 1: Crear directorio de sample**

```bash
mkdir -p /tmp/material-oauth
```

- [ ] **Step 2: Ejecutar mentalmente el flujo**

- Concepto: "Cómo funciona OAuth 2.0: del problema al flujo authorization code"
- Audiencia: developers que solo han implementado login email+password
- Objetivo cognitivo: `orientarse` (mapa mental del dominio)
- Restricciones: ~30 min, presentado en vivo + handout posterior, tono técnico-cercano
- Preset: `tecnico-flat`
- Formatos a materializar: long-form + slides

- [ ] **Step 3: Producir `didactic-brief.md`, `articulo.md` y `slides.md` en /tmp/material-oauth/**

- [ ] **Step 4: Validar coherencia entre formatos**

Verificar que long-form y slides cubren los mismos bloques en el mismo orden con el mismo mensaje. La diferencia debe ser solo densidad y tono (per brief 06).

- [ ] **Step 5: Documentar el test**

```bash
# en docs/superpowers/specs/2026-04-26-smoke-test-oauth.md
# mismo template que test 1
```

- [ ] **Step 6: Commit**

```bash
git add docs/superpowers/specs/2026-04-26-smoke-test-oauth.md
git commit -m "test(material): smoke test caso técnico OAuth

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

### Task E3: Smoke test 3 — Caso científico (Coriolis)

**Files:**
- Create: `docs/superpowers/specs/2026-04-26-smoke-test-coriolis.md`

- [ ] **Step 1: Crear directorio**

```bash
mkdir -p /tmp/material-coriolis
```

- [ ] **Step 2: Ejecutar el flujo**

- Concepto: "Efecto Coriolis: por qué los huracanes giran en sentidos opuestos en cada hemisferio"
- Audiencia: público general adulto sin formación en física
- Objetivo cognitivo: `corregir-intuicion`
- Restricciones: ~10 min, autoadministrado, tono divulgativo
- Preset: `cientifico-informativo`
- Formato: láminas

- [ ] **Step 3: Producir `didactic-brief.md` y `prompts-laminas.md`**

- [ ] **Step 4: Validar el ajuste por eje**

Verificar que el bloque de retrieval (brief 04) usa "predice-antes-de-ver" (apropiado para `corregir-intuicion`), no quiz formal.

- [ ] **Step 5: Documentar el test**

- [ ] **Step 6: Commit**

```bash
git add docs/superpowers/specs/2026-04-26-smoke-test-coriolis.md
git commit -m "test(material): smoke test caso científico Coriolis

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

### Task E4: Smoke test 4 — Filtro fuera-de-scope

**Files:**
- (Ningún archivo nuevo; documentar inline en E5 o en un spec separado.)

- [ ] **Step 1: Simular invocación con caso fuera-de-scope**

Input: "Hazme un meme sobre la generación Z".

Expected behavior según `create-explainer`:
1. Pregunta inicial "video o material" → usuario dice "material".
2. Filtro de scope detecta que un meme no tiene intención pedagógica.
3. Rechaza con mensaje claro: "Los memes no tienen intención pedagógica
   estructurada y este toolkit los contamina con principios que no
   aplican. Sugiero no usar este toolkit para esto."

- [ ] **Step 2: Verificar que el flujo es como se espera leyendo `create-explainer/SKILL.md`**

Si el filtro no es claro, reforzar el prompt en `create-explainer` y commit.

### Task E5: Smoke test 5 — Re-invocación con Brief locked

- [ ] **Step 1: Tomar el Didactic Brief de E1 (caso yoga) y cambiarlo a `estado: locked`** manualmente

```bash
cd /tmp/material-yoga
sed -i 's/estado: draft/estado: locked/' didactic-brief.md
sed -i 's/locked-at: —/locked-at: 2026-04-26/' didactic-brief.md
```

- [ ] **Step 2: Simular re-invocación de `material-explainer` en el mismo directorio**

Expected behavior según SKILL.md §Edge cases: el skill detecta el lock y
pregunta "este brief está locked desde 2026-04-26; ¿re-abrir como `draft`
o seguir directo a materializar?". Verificar que el prompt es claro.

- [ ] **Step 3: Si el comportamiento no es claro, reforzar el SKILL.md y commit**

---

## Fase F — Cierre (meta-docs y bump de versión)

**Criterio de done:**
- `CLAUDE.md` documenta la skill nueva, la etapa material, los presets.
- `ROADMAP.md` cierra "Fase 8".
- `CHANGELOG.md` con entrada `[1.3.0]`.
- `plugin.json` y `marketplace.json` con `"version": "1.3.0"`.
- Memory `project_fase_8_material_cerrada.md` escrita.

### Task F1: Actualizar `CLAUDE.md`

**Files:**
- Modify: `CLAUDE.md`

- [ ] **Step 1: Leer la sección "Skills layout" actual**

```bash
grep -n "Skills layout\|setup-environment\|create-explainer" CLAUDE.md | head -20
```

- [ ] **Step 2: Agregar `material-explainer` a la lista de skills**

Localizar la sección `## Skills layout (\`skills/\`)` y, después del bullet de `concept-explainer / script-explainer / ...`, agregar:

```markdown
- `material-explainer` — etapa de material didáctico no-video. Standalone (no invoca `concept-explainer`). Produce un `didactic-brief.md` editable y luego lo materializa en uno o varios formatos: láminas didácticas (`prompts-laminas.md`), slides para presentar en vivo (`slides.md` formato Marp), long-form escrito (`articulo.md`). Carga 7 briefs de `docs/briefs/material/`. La generación de imágenes se delega a herramientas externas (Claude artifact, GPT image, Midjourney) — la skill produce prompts.
```

- [ ] **Step 3: Agregar la etapa `material/` a la sección "Layer 2 — Briefs"**

Localizar el bloque que enumera los archivos en `docs/briefs/...` (algo como "43 archivos (6+8+4+7+10+8)"). Cambiar:

```markdown
`docs/briefs/{concepto,guion,previsualizacion,grabacion,edicion,publicacion}/NN-slug.md` — 43 archivos (6+8+4+7+10+8), 40-100 líneas cada uno.
```

Por:

```markdown
`docs/briefs/{concepto,guion,previsualizacion,grabacion,edicion,publicacion,material}/NN-slug.md` — 50 archivos (6+8+4+7+10+8+7), 40-100 líneas cada uno. La etapa `material/` consume `material-explainer`; el resto consume las etapas de video.
```

- [ ] **Step 4: Agregar mención al orquestador en la sección de bifurcación**

Localizar la mención al orquestador `create-explainer` y agregar:

```markdown
- `create-explainer` — orchestrator. Identifica si el usuario quiere video o material estático. Si video: identifica etapa y delega al skill correspondiente; invoca `concept-explainer` por default al inicio del flujo. Si material: delega a `material-explainer`. También filtra fuera-de-scope (vlog, reacción, gameplay, entretenimiento, memes, anuncios sin componente explicativo).
```

(Reemplazar la descripción actual del orquestador con esto.)

- [ ] **Step 5: Verificar el archivo**

```bash
grep -A 1 "material-explainer\|material/NN-slug" CLAUDE.md | head -15
```

- [ ] **Step 6: Commit**

```bash
git add CLAUDE.md
git commit -m "docs: documentar material-explainer, etapa material/, bifurcación orquestador

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

### Task F2: Agregar Fase 8 al `ROADMAP.md`

**Files:**
- Modify: `ROADMAP.md`

- [ ] **Step 1: Leer el final de la sección Fase 7**

```bash
grep -n "Fase 7\|Fase 8\|## " ROADMAP.md | head -20
```

- [ ] **Step 2: Agregar nueva sección Fase 8**

Después de la sección "## Fase 7 — Portabilidad y perfil de entorno" (antes de "## Decisiones ya tomadas" si existe, o al final del bloque de fases), insertar:

```markdown
## Fase 8 — Ampliación a material didáctico no-video (2026-04-26)

**Estado:** completada.

- Skill nueva `material-explainer` para producir material didáctico no-video (láminas didácticas secuenciales, slides para presentar en vivo, long-form escrito con visualizaciones).
- 7 briefs nuevos en `docs/briefs/material/` (secuenciacion-conceptual, densidad-y-bloque, soporte-visual, retrieval-y-consolidacion, estilo-visual-coherencia, adaptacion-formato, prompts-imagen-IA) con contrato idéntico al resto del repo (frontmatter, ≥5 citas a IDs estables, bloques fijos, varia-por-eje cuando aplica).
- 5 presets de estilo visual definidos en brief 05: `historico-grabado`, `tecnico-flat`, `cientifico-informativo`, `narrativo-comic`, `editorial-periodico`. Cada uno como meta-prompt verbatim que se inyecta a cada output.
- Bifurcación inicial agregada a `create-explainer` (video vs material estático).
- `regenerar-vistas.sh` extendido para etapa `material`.
- Plugin bump a 1.3.0.

**Disparador:** Antonio generó un set de 9 láminas sobre "El origen del yoga" usando un prompt curado a mano y resultó muy efectivo. La fase 8 sistematiza ese trabajo sin tocar el flujo de video.

**Verificación:** 3 smoke tests (yoga calibrador, OAuth técnico, Coriolis científico) + filtro fuera-de-scope + re-invocación con lock.
```

- [ ] **Step 3: Actualizar la tabla de fases del ROADMAP v2 (si existe)**

Si el ROADMAP tiene una tabla con las fases y su estado (ver lo de Fase 0-7 en la tabla), agregar una fila para fase 8:

```markdown
| 8 | Ampliación a material didáctico no-video — skill `material-explainer`, 7 briefs nuevos en `docs/briefs/material/`, 5 presets de estilo, bifurcación en orquestador | 1 sesión | **Cerrada 2026-04-26** — ver detalle abajo. |
```

- [ ] **Step 4: Commit**

```bash
git add ROADMAP.md
git commit -m "docs(roadmap): cerrar Fase 8 — material didáctico no-video

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

### Task F3: Actualizar `CHANGELOG.md`

**Files:**
- Modify: `CHANGELOG.md`

- [ ] **Step 1: Leer la última entrada**

```bash
head -30 CHANGELOG.md
```

- [ ] **Step 2: Agregar entrada `[1.3.0]` arriba de la última entrada**

Inmediatamente después de la línea de header del CHANGELOG (antes de la entrada `[1.2.0]`), insertar:

```markdown
## [1.3.0] - 2026-04-26

### Añadido

- **Skill `material-explainer`** — produce material didáctico no-video (láminas didácticas, slides para presentar en vivo, long-form escrito) desde un mismo Didactic Brief. La generación de imágenes se delega a herramientas externas (Claude artifact, GPT image, Midjourney); la skill produce prompts.
- **Etapa nueva `material/`** con 7 briefs en `docs/briefs/material/`: secuenciacion-conceptual, densidad-y-bloque, soporte-visual, retrieval-y-consolidacion, estilo-visual-coherencia, adaptacion-formato, prompts-imagen-IA.
- **5 presets de estilo visual** en brief 05: `historico-grabado`, `tecnico-flat`, `cientifico-informativo`, `narrativo-comic`, `editorial-periodico`. Cada preset es un meta-prompt verbatim que se inyecta en cada output para coherencia visual entre piezas del set.
- **Bifurcación en `create-explainer`** — pregunta inicial "video o material estático" antes de identificar etapa.

### Cambiado

- `scripts/regenerar-vistas.sh` ahora reconoce la etapa `material`.
- `create-explainer` aplica el filtro de scope (intención pedagógica) a ambos flujos (video y material).
- `CLAUDE.md` documenta la skill nueva y la etapa `material/`.

### Notas

- El flujo de video existente no cambia (salvo la bifurcación inicial del orquestador).
- `material-explainer` es self-contained: no invoca `concept-explainer`; tiene su propio paso 0 ligero.
- Si existe un Concept Brief de video preexistente sobre el mismo tema, la skill ofrece reutilizar audiencia/objetivo/restricciones.
```

- [ ] **Step 3: Commit**

```bash
git add CHANGELOG.md
git commit -m "docs(changelog): entrada 1.3.0 — material-explainer

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

### Task F4: Bump de versión en `plugin.json` y `marketplace.json`

**Files:**
- Modify: `.claude-plugin/plugin.json`
- Modify: `.claude-plugin/marketplace.json`

- [ ] **Step 1: Ver versión actual**

```bash
grep version .claude-plugin/plugin.json .claude-plugin/marketplace.json
```

Expected: ambos en `1.2.0`.

- [ ] **Step 2: Editar `plugin.json`**

Cambiar `"version": "1.2.0"` por `"version": "1.3.0"` en `.claude-plugin/plugin.json`.

- [ ] **Step 3: Editar `marketplace.json`**

Cambiar `"version": "1.2.0"` por `"version": "1.3.0"` en `.claude-plugin/marketplace.json`.

- [ ] **Step 4: Verificar**

```bash
grep version .claude-plugin/plugin.json .claude-plugin/marketplace.json
```

Expected: ambos en `1.3.0`.

- [ ] **Step 5: Commit**

```bash
git add .claude-plugin/plugin.json .claude-plugin/marketplace.json
git commit -m "chore(plugin): bump version a 1.3.0

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

### Task F5: Actualizar memory `project_fase_8_material_cerrada.md`

**Files:**
- Create: `~/.claude/projects/-home-antonio-Proyectos-local-video-explainer-guide/memory/project_fase_8_material_cerrada.md`
- Modify: `~/.claude/projects/-home-antonio-Proyectos-local-video-explainer-guide/memory/MEMORY.md` (agregar pointer)

- [ ] **Step 1: Crear el memory file**

```markdown
---
name: Fase 8 (material no-video) cerrada
description: Skill material-explainer + 7 briefs en docs/briefs/material/ + 5 presets de estilo + bifurcación en orquestador; plugin v1.3.0; cerrada 2026-04-26.
type: project
---

Fase 8 cerrada el 2026-04-26. Plugin `video-explainer-guide` ahora produce material didáctico no-video además de video.

**Componentes:**
- Skill nueva `material-explainer` (standalone, no invoca `concept-explainer`).
- Etapa `docs/briefs/material/` con 7 briefs.
- 5 presets de estilo visual: `historico-grabado`, `tecnico-flat`, `cientifico-informativo`, `narrativo-comic`, `editorial-periodico`.
- Bifurcación en `create-explainer` (video vs material).
- `regenerar-vistas.sh` extendido.
- Plugin bump a 1.3.0.

**Verificación:** 3 smoke tests (yoga calibrador, OAuth técnico, Coriolis científico) + filtro fuera-de-scope + re-invocación con lock.

**Por aplicar:** ahora que existe la modalidad material, los proyectos no-video del usuario deben usar `material-explainer` en vez de adaptar el flujo de video. Si surgen casos donde el preset elegido no encaja, considerar agregar nuevo preset al brief 05 (no inventar uno on-the-fly).
```

- [ ] **Step 2: Agregar pointer a `MEMORY.md`**

Añadir esta línea al `MEMORY.md` (en la sección apropiada, probablemente al inicio o tras los memories de "Reforma cerrada" / "Portabilidad cerrada"):

```markdown
- [Fase 8 (material no-video) cerrada](project_fase_8_material_cerrada.md) — material-explainer + 7 briefs + 5 presets + bifurcación; plugin v1.3.0 cerrado 2026-04-26.
```

- [ ] **Step 3: No hay commit en el repo del proyecto** (memory vive fuera del repo).

---

## Self-Review Checklist (a correr al final, antes de cerrar)

Después de ejecutar todas las fases, validar manualmente:

- [ ] `bash scripts/verificar-briefs.sh --strict` cierra exit 0.
- [ ] `bash scripts/regenerar-vistas.sh` corre sin errores.
- [ ] `docs/vistas-por-etapa/material.md` lista los 7 briefs correctamente.
- [ ] `skills/material-explainer/SKILL.md` lee correctamente, frontmatter válido.
- [ ] `skills/create-explainer/SKILL.md` tiene la sección "Bifurcación inicial".
- [ ] Los 3 smoke tests producen output coherente con el brief y con el preset.
- [ ] `plugin.json` y `marketplace.json` ambos en `1.3.0`.
- [ ] `CHANGELOG.md` con entrada `[1.3.0]` clara.
- [ ] `ROADMAP.md` con Fase 8 cerrada.
- [ ] `CLAUDE.md` documenta la skill nueva.
- [ ] Memory `project_fase_8_material_cerrada.md` creado.

Si todo OK, el plugin v1.3.0 está listo. Antonio puede invocarlo via `/material-explainer` o vía `/create-explainer` (que ahora pregunta video vs material).
