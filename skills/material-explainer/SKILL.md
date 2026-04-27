---
name: material-explainer
description: "Use when the user wants to produce, design, or plan static (non-video) didactic material that explains difficult concepts to audiences without prior experience — didactic infographic series ('láminas'), slide decks for live presentation, or long-form written explainers with embedded visualizations. Produces a Didactic Brief and then materializes it in one or more chosen formats. Image generation is delegated to external tools (Claude artifact, GPT image, Midjourney); this skill produces the prompts. Content in Spanish (variant: Mexican)."
---

# Material didáctico no-video

Acompañas al creador a transformar un concepto difícil + audiencia sin
experiencia + objetivo cognitivo en un **Didactic Brief**: un plan
didáctico secuenciado con scaffolding, soporte visual y consolidación,
que luego se materializa en uno o varios formatos:

- **Láminas didácticas** secuenciales (estilo el set "El origen del yoga").
- **Slides** para presentar en vivo (formato Marp).
- **Long-form escrito** con visualizaciones embebidas.

Este skill es la **etapa de material** del toolkit. No produce video.
La generación de imágenes se delega a una herramienta externa (Claude
artifact, GPT image, Midjourney) — este skill produce los prompts.

## Carácter recomendado

Este skill es **standalone**. No invoca `concept-explainer`. Tiene su
propio paso 0 ligero. Si encuentra un Concept Brief de video preexistente
en el directorio del usuario, ofrece reutilizar audiencia/objetivo/
restricciones — pero no lo exige.

## Carga obligatoria al inicio

Antes de proponer cualquier decisión, **lee los briefs de esta etapa**:

```
${CLAUDE_PLUGIN_ROOT}/docs/briefs/material/*.md
```

7 briefs en orden alfabético = orden de flujo:

1. `01-secuenciacion-conceptual` — orden de conceptos.
2. `02-densidad-y-bloque` — cuánta info por bloque.
3. `03-soporte-visual` — qué tipo de visual va con qué concepto.
4. `04-retrieval-y-consolidacion` — pausas, glosarios, recapitulación.
5. `05-estilo-visual-coherencia` — preset de estilo + meta-prompt.
6. `06-adaptacion-formato` — ajuste por lámina / slide / long-form.
7. `07-prompts-imagen-IA` — anatomía de prompt para IA de imagen.

**NO leer pilares completos en runtime.** Los briefs ya sintetizan la
información con trazabilidad vía IDs estables (`[P1-§X.Y]`). Si surge
una pregunta fuera del scope de los briefs, usa `Grep` dirigido por ID.

## Paso 0 — Mini Concept Brief

Antes del flujo de briefs, registrar 4 datos vía diálogo. Si existe un
Concept Brief de video preexistente en el directorio actual, ofrecer
reutilizarlo.

### Detectar Concept Brief preexistente

```bash
ls *concept-brief*.md 2>/dev/null
```

Si encuentra uno: leerlo y preguntar al usuario:

> "Encontré `<ruta>` — un Concept Brief de video. ¿Reutilizo de aquí
> audiencia, objetivo y restricciones para el material no-video?"

Si acepta: importar esos campos y solo preguntar lo que falta (formato
final, estilo). Si rechaza o no hay Concept Brief: preguntar las 4
dimensiones desde cero.

### Las 4 dimensiones (preguntar una a una)

1. **Concepto(s) a explicar** — texto libre. Si son varios conceptos,
   confirmar que son del mismo dominio (no mezclar yoga + microservicios
   en el mismo set; si lo son, sugerir hacer dos sets distintos).

2. **Audiencia** — quién es y qué sabe ya. Ofrecer 3 niveles tentativos:
   - **Sin experiencia** — público general, primera vez con el dominio.
   - **Nivel inicial** — algo de exposición pero sin modelos formados.
   - **Intermedio** — familiaridad con el dominio, busca profundizar.

3. **Objetivo cognitivo** — usar el eje del repo. Explicar cada uno
   brevemente para que el usuario elija:
   - `orientarse` — construir mapa mental del dominio.
   - `corregir-intuicion` — reemplazar modelo erróneo por correcto.
   - `decidir-informado` — comparar opciones para una decisión.
   - `formar-opinion` — adoptar/cuestionar una tesis.
   - `apreciar` — desarrollar sensibilidad estética.
   - `adquirir-habilidad` — ejecutar una tarea nueva (raro en material
     estático sin video; flaggear y sugerir reconsiderar).

4. **Restricciones** — preguntar:
   - **Tiempo de consumo target** (15 min / 30 min / 1 hora / sesión completa).
   - **Contexto** — autoadministrado (lo lee solo) vs presentado en vivo
     (con presenter) vs híbrido.
   - **Tono** — académico / divulgativo / editorial / cercano.

### Filtro fuera-de-scope

Si el concepto no tiene intención pedagógica clara (ej. "haz un meme",
"haz un anuncio puro", "haz un poster decorativo sin contenido
secuencial"), avisar y rechazar:

> "Este toolkit aplica principios de aprendizaje (Mayer, CLT, retrieval)
> que solo benefician material con intención pedagógica. Para tu caso
> sugiero no usar este toolkit; mejor un diseñador o herramienta
> generalista."

No continuar.

## Paso 1 — Generar Didactic Brief

Recorrer los briefs en orden alfabético = orden de flujo (01 → 07).
Para cada decisión:

1. **Leer el brief** correspondiente.
2. **Aplicar el principio + casos al input del usuario.** Citar ID del
   brief en la justificación (ej. "Para 6-9 bloques [P1-§2.4 vía
   material/01-secuenciacion]").
3. **Si el brief tiene `admite-variantes: true`:** aplicar el test de
   determinismo upstream. Si ≥2 casos del brief son razonablemente
   aplicables al contexto del usuario evaluado contra TODAS las
   decisiones ya tomadas, **ofrecer variantes con recomendación**:
   > "Veo N direcciones distintas que funcionan: [A], [B], [C]. Mi
   > inclinación es [A] por [razón del brief]. ¿Las exploramos o voy
   > con [A]?"
   Si un solo caso domina: proponer una sola, no ofrecer variantes.
4. **Si el brief tiene `varia-por-eje:` no vacío:** leer el sub-bloque
   "Ajuste por eje" correspondiente al valor del eje en el contexto
   actual (objetivo-cognitivo y/o formato).
5. **Flaggear conflictos** que el brief liste como aplicables.
6. **Esperar aprobación** antes de pasar a la siguiente decisión.

Tras los 5 primeros briefs (01-05), proponer la **secuencia didáctica
borrador** al usuario:
- N bloques (rango sano 6-9) con título + concepto principal + visual
  sugerido + texto curado + consolidación por bloque.

El usuario revisa, comenta, ajusta. Iterar hasta aprobación.

Tras aprobación, **escribir `didactic-brief.md`** en el directorio
actual del usuario (no en el repo del toolkit).

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
<perfil + nivel previo explícito>

## 3. Objetivo cognitivo
`<orientarse | corregir-intuicion | decidir-informado | formar-opinion | apreciar | adquirir-habilidad>`

## 4. Restricciones
- Tiempo de consumo: <N min / sesión>
- Contexto: <autoadministrado | presentado-en-vivo | híbrido>
- Tono: <académico | divulgativo | editorial | cercano>

## 5. Mapa conceptual
- **Conceptos a cubrir:** [lista]
- **Prerequisitos** (lo que la audiencia debe saber antes): [lista]
- **Dependencias** (X requiere Y): [lista o grafo]
- **Orden óptimo** (justificado): [secuencia]

## 6. Estilo visual
- **Preset:** `<historico-grabado | tecnico-flat | cientifico-informativo | narrativo-comic | editorial-periodico | custom>`
- **Customizaciones:** [paleta concreta, tipografías concretas, motivo recurrente]
- **Meta-prompt verbatim:**
  ```
  [el meta-prompt completo, listo para inyectar en cada output del paso 2]
  ```

## 7. Secuencia didáctica

### Bloque 1 — <título>
- **Concepto principal:** <uno solo>
- **Conocimiento previo activado:** <de qué ancla>
- **Andamiaje:** <analogía / contraste / metáfora>
- **Visual sugerido:** <mapa | diagrama causal | comparativo | timeline | escena | matriz | gráfico cuantitativo>
- **Texto curado:** <prosa o bullets curados>
- **Términos clave:** <lista>

### Bloque 2 — ...
[mismo patrón]

...

### Bloque N — Cierre / síntesis
[recap visual + concepto transversal — la idea simple del set]

## 8. Consolidación
- **Recursos por bloque:** cajas "concepto clave" + glosario "para estudiar".
- **Recap explícito:** bloque N (síntesis) y/o cada N capítulos.
- **Bloque de cierre:** <descripción de qué reúne y cómo>.

## 9. Conflictos flaggeados
[lista de conflictos reportados durante el flujo que quedaron sin
 resolver con el usuario]
```

## Gate de lock

Una vez completado el Didactic Brief, **pregunta explícitamente al
usuario si quiere pasarlo a estado `locked`**:

> "El Didactic Brief está completo. ¿Lo paso a `locked`? A partir de
> ahí es el contrato para la materialización — si hay cambios después,
> hay que volver a esta etapa para re-lockear."

Si acepta:
- Cambiar `estado: draft` → `estado: locked`.
- Escribir la fecha de hoy en `locked-at:` (formato `YYYY-MM-DD`).

Si prefiere dejarlo `draft`:
- Mantener el estado y avisar que el paso 2 va a alertar sobre el draft
  al arrancar (no bloquea, solo avisa).

## Paso 2 — Materializar en uno o varios formatos

Tras lock (o draft con permiso del usuario), preguntar:

> "¿Qué formato(s) quieres materializar ahora? Puedes elegir uno o
> varios:
> - **Láminas didácticas** → `prompts-laminas.md`
> - **Slides para presentar en vivo** → `slides.md`
> - **Long-form escrito** → `articulo.md`"

Para cada formato seleccionado, leer el brief 06-adaptacion-formato y
producir el archivo correspondiente en el directorio actual del usuario.

### Output `prompts-laminas.md`

Una sección por bloque del Didactic Brief, siguiendo la anatomía del
brief 07-prompts-imagen-IA. Estructura por sección:

```markdown
# Prompts de láminas — <slug del concepto>

> Generado desde `didactic-brief.md` el <fecha>. Estilo: `<preset>`.

## Capítulo N — <título>
**Concepto:** <uno solo>
**Texto integrado:** <lo que va literalmente en la lámina>

### Prompt para IA de imagen

[META-PROMPT DE ESTILO — verbatim del Didactic Brief §6]
[COMPOSICIÓN ESPECÍFICA DE ESTA LÁMINA]
[ELEMENTOS]
[TEXTO LITERAL — entre comillas]
[RESTRICCIONES — 5+ negaciones explícitas]

### Notas de iteración
- Si la 1ª salida no convence: <qué ajustar>
- Variación recomendada: <opcional>
```

**Crítico:** el meta-prompt de estilo (sección 6 del Brief) debe
aparecer **verbatim e idéntico** en cada capítulo. Eso es lo que da
consistencia visual al set.

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

![visual sugerido](placeholder-1.png "<descripción del visual>")

- Bullet 1 (3-7 palabras)
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
<!-- prompt-imagen: [anatomía del brief 07] -->

## Bloque 2 — ...
[mismo patrón]

## Para profundizar

- **Glosario:** [términos clave del set con definición de 1 línea]
- **Lecturas:** [referencias para extender]
```

## Edge cases

- **Re-invocación con Didactic Brief en `locked`:** detectar lock al
  cargar el archivo. Preguntar:
  > "Este Didactic Brief está locked desde <fecha>. ¿Re-abrir como
  > `draft` para modificar, o seguir directo a materializar?"

- **Conflicto Pilar 1 vs preset de estilo:** los briefs 03 y 05 declaran
  cuándo hay tensión entre un preset (ej. `narrativo-comic`) y un
  objetivo cognitivo (ej. `corregir-intuicion`). Flaggear siempre y
  pedir confirmación al usuario.

- **`adquirir-habilidad` sin video:** material estático no enseña
  procedimientos físicos eficazmente. Si el usuario insiste en este
  objetivo, flaggear y sugerir considerar video o demo en vivo.

- **Cliente que pide "un solo formato que sirva para todo"** (ver brief
  06 §Conflictos): negociar producir los 3 desde el mismo Didactic
  Brief. Costo marginal bajo porque comparten upstream.

## Reglas firmes

- **Nunca leer pilares completos en runtime.** Solo briefs.
- **Trazabilidad obligatoria:** cada recomendación cita ID del brief
  o del Pilar 1 vía el brief.
- **Coherencia visual:** el meta-prompt de estilo es verbatim e
  idéntico en cada output del paso 2 — no parafrasear pieza a pieza.
- **Generación externa:** no intentes generar imágenes desde el skill;
  produce prompts copiables.
- **No inventar consolidación cuando el objetivo no la admite:**
  `formar-opinion` y `apreciar` no llevan retrieval formal (ver brief
  04 §Ajuste por eje — mismo principio que `guion/05-retrieval` para
  video).
- **Filtrar fuera-de-scope:** rechazar memes, anuncios puros sin
  pedagogía, posters decorativos. Sugerir no usar este toolkit.
- **Evitar pseudociencia:** ningún claim sobre cromoterapia,
  "8 segundos de atención", neuronas espejo, etc. Los briefs están
  depurados.
