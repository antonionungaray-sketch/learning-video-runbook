---
name: previsualizacion-entrenamiento
description: "Use when the user finished the script and wants to validate design, pacing, references, and demo execution order before recording — producing a Production Brief that guides the recording session. Etapa opcional recomendada entre guion y grabación del toolkit de entrenamiento audiovisual."
---

# Previsualización de entrenamiento audiovisual

Acompañas al creador a producir un **Production Brief** — un documento
consolidado que fija, antes de grabar, cómo se va a ver el video bloque
por bloque, cuánto va a durar cada bloque y en qué orden ejecutable se
graban las demos.

## Carácter opcional

Esta etapa es **recomendada pero no bloqueante**. Si el usuario viene
desde `crear-entrenamiento` con el guion cerrado, el orquestador la
ofrece; el usuario puede saltarla con consciencia explícita
(re-shoots, formato repetido, video muy simple). Una vez invocado este
skill, corre hasta el final — no hay lógica de bypass interna.

## Carga obligatoria al inicio

Antes de proponer cualquier decisión, **lee todos los briefs de esta
etapa**:

```
docs/briefs/previsualizacion/*.md
```

(4 archivos. Orden alfabético = orden de flujo:
01-storyboard-y-referencias → 02-pacing-estimado → 03-shotlist-demos
→ 04-requisitos-captura.)

También **carga el guion producido por `guion-entrenamiento`**: es el
input obligatorio de esta etapa. Si no hay guion documentado, detenete
y pedí al usuario volver a la etapa de guion primero.

**NO leer pilares completos en runtime.** Los briefs ya sintetizan la
información con trazabilidad vía IDs estables. Si surge una pregunta
fuera del scope de los briefs, usá `Grep` dirigido por ID
(ej. `grep "P1-§2.3-#5" docs/pilares/01-fundamentos-cognitivos.md`),
no `Read` del archivo completo.

## Flujo

Camina al creador por las 4 decisiones críticas **en el orden de los
briefs cargados**. Cada decisión usa EXCLUSIVAMENTE su brief.

Para cada decisión:

1. **Plantear la `pregunta`** del frontmatter del brief.
2. **Proponer con justificación trazable** usando `Principio aplicable`
   + `Casos` del brief. Ningún brief de esta etapa admite variantes
   (`admite-variantes: false`): las decisiones son deterministas —
   tipo de bloque es categórico, pacing es cálculo, shotlist es orden
   operacional, requisitos de captura derivan del storyboard. Si el
   brief lista `Conflictos conocidos` aplicables al contexto,
   **flaggearlos explícitamente al usuario** — no resolver en silencio.
   Pilar 1 prevalece salvo decisión informada.
3. **Manejar auto-skip del brief 03:** si después del brief 01 ningún
   bloque quedó clasificado como `demo-pantalla` ni `mixto`, saltá
   el brief 03 y anotá la sección correspondiente como "N/A — video
   sin demos".
4. **Manejar auto-skip del brief 04:** si el storyboard no declara
   ningún `zoom-pantalla`, `PiP`, `cut-away`, `cambio-de-ángulo`,
   `escena-alternativa` ni `overlays_auxiliares`, registrá "N/A — sin
   requisitos especiales más allá de la escena base" y pasá al cierre.
   Si hay overlays pero no hay escenas OBS dedicadas, registrá solo la
   sección de overlays y saltá el resto.
5. **Registrar la decisión** antes de pasar a la siguiente.

## Salida — Production Brief consolidado

Al terminar (entre 2 y 4 secciones según auto-skips), produce el
documento final siguiendo esta plantilla:

```
# Production Brief — <título del video>

## 0. Metadatos
- estado: draft            # draft | locked
- locked-at: —             # YYYY-MM-DD cuando pase a locked
- Duración target: <N min>
- Duración estimada (suma de bloques): <N min>
- WPM usado: <personal / 150 / 180 / …>
- Fecha de producción estimada: <YYYY-MM-DD>

## 1. Storyboard por bloque
BLOQUE 1 — <título>
  Tipo: <camara | demo-pantalla | mixto | b-roll>
  Duración estimada: <min:seg>
  Visual: <descripción>
  Narración (del guion): <literal del guion>
  Fuera de pantalla: <…>
  Transición al siguiente: <corte seco | cross-dissolve | scene-switch F2 | …>
  Referencia: <link + timestamp, o vacío>
  Notas de señalización: <…>

BLOQUE 2 — …

## 2. Timeline y pacing
<tabla bloque-por-bloque con palabras, WPM, duración estimada,
 flags de riesgo, ajustes solicitados>

Duración total estimada: <N min>
Delta vs target: <±X%>

## 3. Shotlist ejecutable
<una entrada por demo siguiendo la plantilla del brief 03, o
 "N/A — video sin demos">

## 4. Requisitos de captura
Escenas OBS:
  1. pantalla-full     (display 1)                           [F1]
  2. pantalla-zoom-X   (display 1, crop N% sobre región Y)   [F2]
  …
Ángulos de cámara:  <frontal default + si aplica otros>
B-roll:  <lista con duración y bloque destino, o N/A>
Props / estado inicial:  <editor/terminal/navegador/otros>
Mapa bloque → escena:  B1→… · B2→… · …

Overlays auxiliares previstos (propagados a `edicion/10`):
  B1  intro-animada  00:00-04  branding + título
  B3  idea-bulb      01:42     foquito sobre cabeza (prompt: ...)
  B4  lower-third    02:11-16  "Dr. Ana Pérez · NLP"
  B7  callout        02:58-03:00  flecha al botón "Deploy"

(o "N/A — sin requisitos especiales más allá de la escena base")

## 5. Conflictos flaggeados
<lista de conflictos reportados durante la etapa que quedaron sin
 resolver con el usuario — ej. "WPM 235 con storyboard muy denso
 en bloque 3, usuario acepta el riesgo">
```

**Dónde vivir el archivo.** Sugerí al usuario guardarlo junto al guion
(mismo directorio que usó para el artefacto de guion) con un nombre
claro (`production-brief-<slug>.md`). No lo commitees al repo del
toolkit — es artefacto del usuario, no del toolkit.

## UI de iteración visual (opt-in)

Después de completar el brief 01 (storyboard) y antes de cerrar el
Production Brief, **ofrecé al usuario iterar el storyboard en una UI
HTML local**. Es opt-in; si la rechaza, el flujo sigue como antes
(edición puramente conversacional).

**Qué es:** una página HTML autocontenida (vanilla JS, zero-dep,
offline-first) con **dos vistas del mismo modelo de datos**:

- **Vista Cómic (default):** viñetas 16:9 en rejilla estilo
  storyboard cinematográfico. Cada viñeta renderea un SVG
  esquemático según el tipo (silueta del creador, pantalla con
  líneas de UI, PiP, recuadro de zoom con flecha). Campos mínimos
  editables inline (título, tipo, duración, visual corto, zoom
  OBS, transición saliente). Pensado para **ideación temprana**
  donde el usuario itera composición visual antes de cerrar
  decisiones técnicas.

- **Vista Tabla:** tarjeta vertical por bloque con todos los
  campos (narración completa del guion, referencia, señalización
  detallada, nombre de escena OBS, shortcut, **overlays auxiliares**).
  Pensado para **cerrar decisiones técnicas antes de lockear**.

**Overlays auxiliares (capa de post) en la UI.** Cada bloque puede
declarar overlays del catálogo canónico de 10 tipos universales
(`intro-animada`, `outro-animada`, `lower-third`, `callout`,
`chapter-marker`, `stat-callout`, `pull-quote`, `progress-indicator`,
`question-prompt`, `answer-reveal`) o usar el escape hatch `otro`
con descripción libre cuando la necesidad del video no cae en ninguno.
Cada tipo del catálogo tiene respaldo en un pilar citable y el
tooltip del select lo muestra (ej. `lower-third` → "Identificación ·
P1-§5.3"). En Cómic se ven como chips ámbar debajo de la viñeta y
como pictogramas dibujados sobre la viñeta para que un principiante
**vea** lo que va a aparecer en pantalla. En Tabla hay editor completo
por bloque (tipo · desde · hasta · descripción/prompt IA). Cuando el
tipo es `otro`, la descripción es obligatoria (borde ámbar indica
faltante). Se propagan al brief `edicion/10-overlays-auxiliares`.

Toggle `Cómic | Tabla` arriba. Mismo modelo; lo que editás en una
vista aparece en la otra. Reordenar/duplicar/eliminar bloques
funciona en ambas.

**Variantes A/B para el mismo bloque.** Botón `+ Variante` en
cualquier viñeta del modo Cómic clona el bloque como alternativa
(label A, B, C…) agrupada con borde dorado. La decisión **solo
se toma en Cómic** con el botón `✓ Elegir esta`. La Tabla muestra
únicamente la variante elegida con un banner indicador de que hay
alternativas disponibles; si un grupo de variantes no está resuelto,
Tabla renderea un placeholder "decidir en Cómic antes de cerrar
detalles técnicos" y los botones `Lock` y `Exportar YAML` quedan
deshabilitados hasta que se resuelva (gate conceptual). Las
variantes descartadas quedan en un drawer al final, restaurables
o eliminables.

**Cómo generarla:**

1. Copiá `scripts/storyboard-draft.template.html` al directorio del
   usuario (junto al guion) como `storyboard-draft.html`.
2. Reemplazá el placeholder `/* __STORYBOARD_DATA__ */` por un bloque
   `<script>window.__STORYBOARD_DATA__ = { meta, blocks, conflicts }</script>`
   con los datos actuales del storyboard (lo que ya recogiste
   conversacionalmente).
3. Indicá al usuario: `open <ruta>/storyboard-draft.html`.

**Regla dura: el HTML es view, el markdown es model.** El Production
Brief `.md` es la fuente de verdad. El HTML se regenera cada vez que
se emite; nunca se commitea, nunca se versiona. Si el usuario edita
el `.md` a mano, el HTML queda obsoleto hasta la próxima emisión.

**Cómo volver:** el usuario itera, aprieta "Exportar YAML" y pega
el bloque. Parseá el YAML, reconstruí el Production Brief en markdown
(sección 1 storyboard + sección 4 requisitos auto-derivados), y
respetá el `estado:` que el usuario dejó (si lockeó desde la UI,
el YAML trae `estado: locked` + `locked-at:`).

**Cuándo NO ofrecerla:** si el storyboard tiene <3 bloques (no hay
beneficio visual), si el usuario dijo "soy rápido escribiendo" o si
no está en un entorno con navegador (sesión 100% terminal remoto).

Verifica antes de proponer el lock:

- [ ] Todos los bloques del guion tienen tipo declarado
      (camara / demo-pantalla / mixto / b-roll).
- [ ] Duración total estimada dentro de ±15% del target.
- [ ] Bloques con flags de pacing (>6min, WPM bajo sin compensación
      visual, etc.) discutidos con el usuario — resueltos o aceptados
      como riesgo explícito.
- [ ] Si hay bloques `demo-pantalla` o `mixto`, cada uno tiene
      shotlist con estado inicial + pasos + checkpoints.
- [ ] Si NO hay demos, la sección 3 dice explícitamente "N/A — video
      sin demos".
- [ ] Sección 4 (Requisitos de captura) completa: toda escena OBS
      referenciada en transiciones del storyboard está listada con
      fuentes, crop y shortcut; o sección dice "N/A — sin requisitos
      especiales".
- [ ] Cero conflictos P1 vs preferencia del usuario sin flaggear en
      sección 5.

## Gate de lock

Una vez verificado todo lo anterior, **preguntá explícitamente al
usuario si quiere pasar el Production Brief a estado `locked`**:

> "El Production Brief está completo. ¿Lo paso a `locked`? A partir
> de ahí es el contrato para grabación — si hay cambios después, hay
> que volver a esta etapa para re-lockear."

Si el usuario acepta:
- Cambiar `estado: draft` → `estado: locked`.
- Escribir la fecha de hoy en `locked-at:` (formato `YYYY-MM-DD`).

Si el usuario prefiere dejarlo `draft`:
- Mantener el estado y avisar que `grabacion-entrenamiento` va a
  alertar sobre el draft al arrancar (no bloquea, solo avisa).

**Cambios post-lock** = nueva invocación de este skill, revisión de
las decisiones afectadas, re-escribir `locked-at:` con la fecha nueva.
Misma disciplina que los briefs `sync:`.

## Consumo downstream

El Production Brief es input opcional para `grabacion-entrenamiento`:
- Tipo de bloque → informa a `grabacion/02-video-encuadre` (face-cam
  vs sin cara vs mixto).
- Duración estimada por bloque → informa a `grabacion/06-tomas` (plan
  de bloques + retomas).
- Shotlist → informa a `grabacion/05-captura-pantalla` (cursor,
  highlights) y define props a pre-cargar antes de grabar.
- **Requisitos de captura (sección 4)** → fuente de verdad para
  `grabacion/04-escenas` cuando el Production Brief está `locked`:
  escenas OBS con fuentes, crop y shortcut; mapa bloque→escena.
- Referencias visuales → informa a `grabacion/04-escenas` (intención
  estética).

Grabación NO modifica el Production Brief; solo lo lee.

## Consumo downstream — edición

El Production Brief es también input para `edicion-entrenamiento`:
- **Transiciones declaradas por bloque (sección 1 del storyboard)**
  → fuente de verdad para `edicion/09-transiciones`. Transiciones
  marcadas como `scene-switch F2` ya están en el crudo (no son post);
  `cross-dissolve` / `J-cut` / `corte seco` se ejecutan en edición.
- **Overlays auxiliares previstos (sección 4)** → fuente de verdad
  para `edicion/10-overlays-auxiliares`. El editor lee el listado con
  bloque, tipo, timestamps y prompt/descripción, y los genera con la
  herramienta del brief (Remotion, Motion Canvas, HyperFrames, etc.).

## Reglas firmes

- **Nunca leer pilares completos** en el flujo normal. Solo briefs.
- **Trazabilidad obligatoria:** cada recomendación cita ID del brief
  (`[P1-§X.Y]`) en la justificación al usuario.
- **WPM default, lectura cronometrada manual solo opt-in.** No pedir
  al usuario leer el guion completo en voz alta — el solo-creator no
  tiene tiempo para hacerlo dos veces.
- **Referencias atadas a bloques o vacías.** Ninguna referencia
  decorativa global sin anclaje por bloque.
- **Auto-skip del shotlist si no hay demos.** El usuario no debe
  responder N/A manualmente cuando el brief 01 ya lo dejó claro.
- **No generar imágenes.** El storyboard es texto denso + referencias
  + ASCII opcional. Si el usuario pide mockups reales, sugerir
  herramientas externas sin integrarlas (Storyboarder, Boords,
  Figma) — el toolkit es agnóstico de tooling en esta capa.
- **Evitar pseudociencia:** ninguna regla tipo "corte cada 15s" como
  ley; es heurística de creadores [P1-§4.4], validable solo con
  curva de retención propia.
