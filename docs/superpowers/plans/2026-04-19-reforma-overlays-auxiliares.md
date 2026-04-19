# Reforma de `OVERLAY_TIPOS` — Plan de implementación (Fase H)

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Reformar el catálogo de overlays auxiliares del toolkit para que pase el filtro universal + pilar + cross-género (quitar 3 inventados, renombrar 1, agregar 6 nuevos + escape hatch `otro`), con pictogramas nuevos en el HTML del storyboard y citas a pilar en el brief y en la UI.

**Architecture:** Cambios puramente de contenido y UI (sin backend nuevo). Tres capas del toolkit tocadas en orden: (1) brief markdown, (2) template HTML (constantes + 7 funciones de dibujo rough.js + dispatcher + UI Tabla/Cómic), (3) skills markdown. Validación por `verificar-briefs.sh --strict` (drift check) y por inspección visual del demo en `/tmp/storyboard-draft-demo.html` recargado en navegador.

**Tech Stack:** Markdown (briefs, skills). HTML vanilla + rough.js 4.6.6 embebido (template). Bash (scripts). Python3 (hidratación del demo).

**Idioma del contenido:** español de México.

**Spec:** [`docs/superpowers/specs/2026-04-19-auditoria-catalogo-overlays-design.md`](../specs/2026-04-19-auditoria-catalogo-overlays-design.md)

---

## Estructura de archivos tocados

| Archivo | Acción | Responsabilidad |
|---------|--------|----------------|
| `docs/briefs/edicion/10-overlays-auxiliares.md` | Modificar | Catálogo canónico de 10 tipos + `otro`, con cita por tipo al pilar; version bump a 2 |
| `scripts/storyboard-draft.template.html` | Modificar | Constante `OVERLAY_TIPOS` nueva, 7 funciones de dibujo nuevas, 3 eliminadas, 1 renombrada, dispatcher actualizado, UI Tabla/Cómic con tooltips |
| `skills/previsualizacion-entrenamiento/SKILL.md` | Modificar | Mencionar catálogo expandido en la sección "UI de iteración visual" |
| `skills/edicion-entrenamiento/SKILL.md` | Modificar | Ajustar ejemplos de la sección `═══ 10. OVERLAYS AUXILIARES ═══` con un caso no-técnico |
| `docs/vistas-por-etapa/edicion.md` | Regenerar | Auto-generado por `regenerar-vistas.sh` al cambiar frontmatter del brief 10 |
| `/tmp/hydrate-demo.py` | Modificar | Script de hidratación con ejemplos cross-género y un `otro` |
| `/tmp/storyboard-draft-demo.html` | Regenerar | Ejecutar el hidrator actualizado |
| `memory/project_follow_up_bias_audit.md` | Crear | Nota de follow-up obligatorio sobre auditoría de sesgo hacia tutorial técnico |

---

## Contratos y vocabulario

### Catálogo final (11 opciones del select, 10 canónicos + 1 escape hatch)

```js
const OVERLAY_TIPOS = [
  { v: "intro-animada",      l: "intro-animada",      abbr: "INTRO",  tip: "Apertura · P2 casos" },
  { v: "outro-animada",      l: "outro-animada",      abbr: "OUTRO",  tip: "Cierre · P2 casos" },
  { v: "lower-third",        l: "lower-third",        abbr: "LT",     tip: "Identificación · P1-§5.3" },
  { v: "callout",            l: "callout",            abbr: "CALL",   tip: "Señalización · P1-§2.3-#2" },
  { v: "chapter-marker",     l: "chapter-marker",     abbr: "CHAP",   tip: "Segmentación · P1-§2.3-#6 · P1-§2.3-#7" },
  { v: "stat-callout",       l: "stat-callout",       abbr: "STAT",   tip: "Señalización numérica · P1-§2.3-#2" },
  { v: "pull-quote",         l: "pull-quote",         abbr: "QUOTE",  tip: "Cita destacada · P1-§2.3-#2 · P1-§5.1" },
  { v: "progress-indicator", l: "progress-indicator", abbr: "PROG",   tip: "Orientación · P1-§2.3-#6 · P1-§6.2" },
  { v: "question-prompt",    l: "question-prompt",    abbr: "Q?",     tip: "Retrieval practice · P1-§8" },
  { v: "answer-reveal",      l: "answer-reveal",      abbr: "A!",     tip: "Retrieval practice · P1-§8" },
  { v: "otro",               l: "otro (descripción libre)", abbr: "OTRO", tip: "Fuera del catálogo canónico — describir función" }
];
```

### Firma de las 7 funciones de dibujo nuevas

Todas reciben `(rc, W, H, opts)` y devuelven `Array<SVGElement>`. Coordenadas en sistema de la viñeta 320×180. Usan `PAL.overlayFill`, `PAL.overlayBadge`, `PAL.overlayInk`, `PAL.overlayAccent` ya definidos.

### Pictogramas (geometría objetivo)

- **chapter-marker**: tarjeta centrada x=W\*0.15 y=H\*0.28 w=W\*0.70 h=H\*0.44 + línea horizontal subrayando a H\*0.50 + dos líneas finas arriba/abajo.
- **stat-callout**: cuadro 52×52 en esquina superior izquierda (x=10 y=10) + dos líneas internas gruesas que simulan un número grande (barras verticales y horizontal).
- **pull-quote**: caja x=W\*0.14 y=H\*0.22 w=W\*0.58 h=H\*0.42 + signo de apertura de comillas (doble arco) en esquina superior izquierda + 3 líneas internas simuladas.
- **progress-indicator**: 5 rectángulos horizontales en la parte superior (y=H\*0.04 altura=5), 2 rellenos con `overlayFill`, 3 vacíos con solo stroke, separados por gap de 4px. Ocupan W-24 total de ancho.
- **question-prompt**: caja x=W\*0.55 y=H\*0.15 w=W\*0.32 h=H\*0.36 con signo `?` trazado dentro (arco arriba + línea corta + círculo punto abajo).
- **answer-reveal**: caja idéntica dimensiones a question-prompt pero con `✓` (dos líneas diagonales en forma de cheque).
- **otro**: badge en esquina superior derecha de 60×24 con etiqueta textual "OTRO" + tres círculos pequeños como elipsis.

---

## Task H.1: Reescribir brief `edicion/10-overlays-auxiliares.md`

**Files:**
- Modify: `docs/briefs/edicion/10-overlays-auxiliares.md` (reescritura completa, actualmente 100 líneas)

- [ ] **Step 1: Leer el brief actual para conservar secciones no tocadas**

Run: `cat docs/briefs/edicion/10-overlays-auxiliares.md`
Esperado: ver las 6 secciones (Principio aplicable · Casos · Anti-patrón · Heurística numérica · Conflictos conocidos · Salida esperada), el frontmatter con `version: 1`, y 10 IDs en `fuentes:`.

- [ ] **Step 2: Reescribir el brief completo**

Reemplazar el contenido entero de `docs/briefs/edicion/10-overlays-auxiliares.md` por:

```markdown
---
decision: edicion/10-overlays-auxiliares
etapa: edicion
pregunta: ¿Qué overlays auxiliares generás en post (del catálogo de 10 tipos universales u `otro` libre) y con qué herramienta los producís?
fuentes:
  - P1-§2.3-#1                 # coherencia
  - P1-§2.3-#2                 # señalización
  - P1-§2.3-#5                 # contigüidad temporal
  - P1-§2.3-#6                 # segmentación
  - P1-§2.3-#7                 # pre-entrenamiento
  - P1-§5.1                    # tipografía para pantalla
  - P1-§5.3                    # posición de lower thirds
  - P1-§6.2                    # bucles abiertos
  - P1-§8                      # retrieval practice
  - P2-edicion-patrones
  - P2-edicion-antipatrones
  - P2-ficha-fireship
  - P2-ficha-kurzgesagt
  - P2-ficha-3b1b
  - P3-edicion-composicion
admite-variantes: true
sync: 2026-04-19
version: 2
---

## Principio aplicable

**Señalización** [P1-§2.3-#2]: overlays guían la mirada hacia lo que
importa. **Coherencia** [P1-§2.3-#1]: si el overlay no cumple función
(señalizar, contextualizar, segmentar, evocar recuperación),
agrega carga extraña. **Contigüidad temporal** [P1-§2.3-#5]: aparece
exacto cuando se lo nombra o cuando la idea ocurre.

**Diferencia con briefs vecinos.** Señalización (02) destaca contenido
ya capturado. B-roll (06) es footage pre-grabado. Transiciones (09)
van entre bloques. **Overlays auxiliares agregan elementos gráficos o
animados que no existen en el crudo** y viven dentro de un bloque.

**Catálogo canónico** (cada uno con respaldo explícito en pilar):

- `intro-animada` · apertura — branding/título [P2-edicion-patrones].
- `outro-animada` · cierre — CTA/créditos [P2-edicion-patrones].
- `lower-third` · identificación de persona [P1-§5.3].
- `callout` · señala elemento ya presente en el cuadro [P1-§2.3-#2].
- `chapter-marker` · título de sección, marca unidad cognitiva
  [P1-§2.3-#6] [P1-§2.3-#7].
- `stat-callout` · número dominante que refuerza una cifra clave
  [P1-§2.3-#2].
- `pull-quote` · cita destacada con tipografía jerárquica
  [P1-§2.3-#2] [P1-§5.1].
- `progress-indicator` · orientación en formato largo [P1-§2.3-#6]
  [P1-§6.2].
- `question-prompt` · pregunta on-screen para recuperación activa
  [P1-§8].
- `answer-reveal` · respuesta tras pausa deliberada [P1-§8].
- `otro` · escape hatch libre con descripción + prompt IA.

## Casos

- **Fireship** [P2-ficha-fireship]: densidad alta de `callout`,
  `stat-callout` y `lower-third` alineados al WPM alto. Audiencia
  técnica decodifica [P2-edicion-patrones].
- **Kurzgesagt** [P2-ficha-kurzgesagt]: icon-language consistente como
  base, `chapter-marker` para segmentar, `pull-quote` con tipografía
  dominante.
- **3Blue1Brown** [P2-ficha-3b1b]: `callout` de término en ecuación
  con color + movimiento sincronizado a la voz. Señalización pura.
- **Explainer económico** (caso cross-género): `stat-callout` sobre
  cifra de inflación regional + `pull-quote` con cita del banco
  central + `chapter-marker` entre fases de la crisis.

## Anti-patrón

**Overlay decorativo sin función** (partículas, logos flotantes,
swoosh ornamental): violan coherencia [P1-§2.3-#1]
[P2-edicion-antipatrones].

**Overlay permanente** (lower-third a 20s, callout que no desaparece):
el sistema atencional se habitúa [P1-§2.3-#2].

**`otro` sin descripción.** Escape hatch sin prompt IA o descripción
deja al editor sin input para generar la forma.

**Lower-third mal posicionado.** Fuera del tercio inferior o tapando
el rostro viola [P1-§5.3].

## Heurística numérica

- **Duración:** intro/outro 2-5s · lower-third y chapter-marker 3-5s
  · callout, stat-callout, pull-quote 1-3s · progress-indicator
  visible continuamente o solo al cambiar de sección · question-prompt
  pausa de 2-4s antes del answer-reveal [P1-§8].
- **Densidad:** 2-4/min tolerable en tutorial técnico denso
  (Fireship-like); ≤1/min en divulgación narrada con b-roll denso
  [P2-edicion-patrones].
- **Paleta:** 2-3 colores consistentes con señalización (brief 02)
  [P1-§2.3-#1].

## Conflictos conocidos

- **Canal visual saturado** (Kurzgesagt-style): extra es
  sobre-decoración. Flag: desactivar en bloques con motion graphics
  intensos.
- **Dense vs audiencia principiante.** Densidad asume decodificación
  rápida. Con audiencia no-técnica, bajar densidad.

## Salida esperada

Lista por bloque, ordenada por timestamp:

```
OVERLAYS AUXILIARES
  B1  intro-animada      00:00-00:04  branding + título
  B2  lower-third        00:34-00:39  "Economista senior · Banxico"
  B3  stat-callout       01:12-01:15  "8.3% inflación anual"
  B4  pull-quote         02:11-02:16  "...esto cambia la función de reacción"
  B5  chapter-marker     03:00-03:03  "Fase 2 — Post-crisis"
  B6  question-prompt    04:20-04:24  "¿Cuál es el mecanismo de transmisión?"
  B6  answer-reveal      04:26-04:29  "Tasa → crédito → consumo"
  B7  otro               05:10-05:12  "mapa animado de la región afectada"
HERRAMIENTA DE GENERACIÓN
  Remotion (intros + lower-thirds)  [P3-edicion-composicion]
  HyperFrames para callouts y stat-callouts generados por agente IA
```

Cada entry: bloque, tipo, timestamps, descripción o prompt IA,
herramienta. Los IDs llegan propagados desde el Production Brief
locked (`previsualizacion/04-requisitos-captura`).
```

- [ ] **Step 3: Verificar longitud dentro del contrato 40-100 líneas**

Run: `wc -l docs/briefs/edicion/10-overlays-auxiliares.md`
Esperado: valor entre 40 y 100 inclusive. Si >100, compactar heurística numérica o anti-patrón (fusionar bullets) hasta entrar.

- [ ] **Step 4: Drift check estricto**

Run: `bash scripts/verificar-briefs.sh --strict 2>&1 | tail -6`
Esperado:
```
Total briefs stale: 0
Total IDs no encontrados en pilar: 0
Total IDs inline no declarados en fuentes: 0
```
Si aparece un ID no declarado en `fuentes:`, agregarlo al frontmatter. Si aparece un ID no encontrado en pilar, verificar el typo contra los headers reales de `docs/pilares/01-fundamentos-cognitivos.md`.

- [ ] **Step 5: Regenerar vistas**

Run: `bash scripts/regenerar-vistas.sh`
Esperado: confirmación de que `docs/vistas-por-etapa/edicion.md` se regeneró.

- [ ] **Step 6: Commit**

```bash
git add docs/briefs/edicion/10-overlays-auxiliares.md docs/vistas-por-etapa/edicion.md
git commit -m "$(cat <<'EOF'
Fase H.1: brief overlays-auxiliares v2 — catálogo universal + pilar

Rewrite del brief con el catálogo de 10 tipos universales con
respaldo en pilar, más el escape hatch 'otro'. Quita idea-bulb,
separador, highlight-icono; renombra callout-flecha → callout;
agrega chapter-marker, stat-callout, pull-quote, progress-indicator,
question-prompt, answer-reveal.

Frontmatter: version 2; fuentes amplía a 15 IDs (agrega P1-§2.3-#6,
P1-§2.3-#7, P1-§5.1, P1-§6.2, P1-§8) para sustentar los tipos
nuevos. Cada tipo del catálogo cita su pilar en línea.

Ejemplo de salida usa ahora un caso cross-género (explainer
económico) con stat-callout, pull-quote, chapter-marker y el
escape hatch 'otro'.

Spec: docs/superpowers/specs/2026-04-19-auditoria-catalogo-overlays-design.md

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
EOF
)"
```

---

## Task H.2: Actualizar constantes y funciones de dibujo en template HTML

**Files:**
- Modify: `scripts/storyboard-draft.template.html:280-288` (OVERLAY_TIPOS)
- Modify: `scripts/storyboard-draft.template.html:671-783` (funciones drawX y dispatcher)

- [ ] **Step 1: Reemplazar `OVERLAY_TIPOS` con el catálogo nuevo**

Buscar en el archivo el bloque que empieza con `const OVERLAY_TIPOS = [` (línea actual 280) y reemplazar hasta el `];` por:

```js
const OVERLAY_TIPOS = [
  { v: "intro-animada",      l: "intro-animada",      abbr: "INTRO",  tip: "Apertura · P2 casos" },
  { v: "outro-animada",      l: "outro-animada",      abbr: "OUTRO",  tip: "Cierre · P2 casos" },
  { v: "lower-third",        l: "lower-third",        abbr: "LT",     tip: "Identificación · P1-§5.3" },
  { v: "callout",            l: "callout",            abbr: "CALL",   tip: "Señalización · P1-§2.3-#2" },
  { v: "chapter-marker",     l: "chapter-marker",     abbr: "CHAP",   tip: "Segmentación · P1-§2.3-#6 · P1-§2.3-#7" },
  { v: "stat-callout",       l: "stat-callout",       abbr: "STAT",   tip: "Señalización numérica · P1-§2.3-#2" },
  { v: "pull-quote",         l: "pull-quote",         abbr: "QUOTE",  tip: "Cita destacada · P1-§2.3-#2 · P1-§5.1" },
  { v: "progress-indicator", l: "progress-indicator", abbr: "PROG",   tip: "Orientación · P1-§2.3-#6 · P1-§6.2" },
  { v: "question-prompt",    l: "question-prompt",    abbr: "Q?",     tip: "Retrieval practice · P1-§8" },
  { v: "answer-reveal",      l: "answer-reveal",      abbr: "A!",     tip: "Retrieval practice · P1-§8" },
  { v: "otro",               l: "otro (descripción libre)", abbr: "OTRO", tip: "Fuera del catálogo canónico — describir función" }
];
```

Cada objeto ahora lleva `tip` (tooltip con cita al pilar) además de `v`, `l`, `abbr`.

- [ ] **Step 2: Renombrar `drawCalloutArrow` a `drawCallout`**

Localizar la función en ~línea 708. Cambiar solo el nombre de `function drawCalloutArrow(` a `function drawCallout(`. El cuerpo queda igual (flecha curva es representación por defecto). Agregar comentario JSDoc arriba:

```js
// Callout: por defecto se dibuja como flecha curva desde fuera-derecha
// hacia centro-alto. La forma concreta (flecha/caja/círculo) queda
// libre en el prompt IA; este pictograma es solo el estandarte visual.
function drawCallout(rc, W, H, opts) {
  // cuerpo existente, sin cambios
```

- [ ] **Step 3: Eliminar `drawIdeaBulb`, `drawSeparator`, `drawHighlightIcon`**

Quitar completamente las tres funciones (bloques que empiezan `function drawIdeaBulb(`, `function drawSeparator(`, `function drawHighlightIcon(`). Están en líneas aproximadas 671, 750, 759.

- [ ] **Step 4: Agregar `drawChapterMarker`**

Insertar antes de la función `drawOverlayBadges` (en la zona de glyphs de overlays):

```js
function drawChapterMarker(rc, W, H, opts) {
  // Tarjeta grande centrada con un título subrayado; segmenta la unidad.
  const out = [];
  const x = W * 0.15, y = H * 0.28, w = W * 0.70, h = H * 0.44;
  out.push(rc.rectangle(x, y, w, h, { ...opts, ...PAL.overlayBadge }));
  // línea horizontal que simula subrayar el título
  out.push(rc.line(x + 12, y + h * 0.50, x + w - 12, y + h * 0.50,
    { ...opts, ...PAL.overlayInk, strokeWidth: 1.6 }));
  // dos líneas finas arriba y abajo (subtítulo y pie)
  out.push(rc.line(x + 12, y + h * 0.28, x + w * 0.55, y + h * 0.28,
    { ...opts, stroke: "#8a4f22", strokeWidth: 0.8 }));
  out.push(rc.line(x + 12, y + h * 0.72, x + w * 0.65, y + h * 0.72,
    { ...opts, stroke: "#8a4f22", strokeWidth: 0.8 }));
  return out;
}
```

- [ ] **Step 5: Agregar `drawStatCallout`**

Insertar a continuación:

```js
function drawStatCallout(rc, W, H, opts) {
  // Cuadro en esquina superior izquierda con un "número" esquemático.
  const out = [];
  const x = 10, y = 10, side = 52;
  out.push(rc.rectangle(x, y, side, side, { ...opts, ...PAL.overlayFill }));
  // dos barras verticales gruesas que simulan un dígito
  out.push(rc.line(x + side * 0.30, y + side * 0.22, x + side * 0.30, y + side * 0.78,
    { ...opts, ...PAL.overlayInk, strokeWidth: 3 }));
  out.push(rc.line(x + side * 0.60, y + side * 0.22, x + side * 0.60, y + side * 0.78,
    { ...opts, ...PAL.overlayInk, strokeWidth: 3 }));
  // barra horizontal conectora
  out.push(rc.line(x + side * 0.30, y + side * 0.50, x + side * 0.60, y + side * 0.50,
    { ...opts, ...PAL.overlayInk, strokeWidth: 2.5 }));
  return out;
}
```

- [ ] **Step 6: Agregar `drawPullQuote`**

```js
function drawPullQuote(rc, W, H, opts) {
  // Caja centrada con signo de comillas y líneas de texto simuladas.
  const out = [];
  const x = W * 0.14, y = H * 0.22, w = W * 0.58, h = H * 0.42;
  out.push(rc.rectangle(x, y, w, h, { ...opts, ...PAL.overlayBadge }));
  // Comillas de apertura: dos pequeños arcos en esquina superior izquierda
  const cx = x + 14, cy = y + 14;
  out.push(rc.path(
    `M ${cx} ${cy + 8} Q ${cx - 2} ${cy + 2} ${cx + 5} ${cy}`,
    { ...opts, ...PAL.overlayInk, strokeWidth: 2.4 }));
  out.push(rc.path(
    `M ${cx + 10} ${cy + 8} Q ${cx + 8} ${cy + 2} ${cx + 15} ${cy}`,
    { ...opts, ...PAL.overlayInk, strokeWidth: 2.4 }));
  // Tres líneas internas simulando texto
  const textY = [y + h * 0.38, y + h * 0.56, y + h * 0.74];
  const textW = [w * 0.82, w * 0.76, w * 0.48];
  for (let i = 0; i < 3; i++) {
    out.push(rc.line(x + 14, textY[i], x + 14 + textW[i], textY[i],
      { ...opts, stroke: "#8a4f22", strokeWidth: 1.1 }));
  }
  return out;
}
```

- [ ] **Step 7: Agregar `drawProgressIndicator`**

```js
function drawProgressIndicator(rc, W, H, opts) {
  // Barra segmentada (5 tramos) en borde superior: 2 rellenos, 3 vacíos.
  const out = [];
  const segs = 5, filled = 2, y = H * 0.04, hBar = 5;
  const leftPad = 12, rightPad = 12, gap = 4;
  const totalW = W - leftPad - rightPad;
  const segW = (totalW - gap * (segs - 1)) / segs;
  for (let i = 0; i < segs; i++) {
    const sx = leftPad + i * (segW + gap);
    const style = i < filled
      ? { ...opts, ...PAL.overlayFill }
      : { ...opts, ...PAL.overlayAccent, fill: "transparent", fillStyle: "solid" };
    out.push(rc.rectangle(sx, y, segW, hBar, style));
  }
  return out;
}
```

- [ ] **Step 8: Agregar `drawQuestionPrompt`**

```js
function drawQuestionPrompt(rc, W, H, opts) {
  // Caja con un signo de pregunta grande (arco + línea corta + punto).
  const out = [];
  const x = W * 0.55, y = H * 0.15, w = W * 0.32, h = H * 0.36;
  out.push(rc.rectangle(x, y, w, h, { ...opts, ...PAL.overlayBadge }));
  const cx = x + w * 0.50, topY = y + h * 0.24;
  // Arco superior del "?" (semicírculo)
  out.push(rc.path(
    `M ${cx - 8} ${topY} Q ${cx - 8} ${topY - 10} ${cx} ${topY - 10} Q ${cx + 8} ${topY - 10} ${cx + 8} ${topY} Q ${cx + 8} ${topY + 4} ${cx + 2} ${topY + 10}`,
    { ...opts, ...PAL.overlayInk, strokeWidth: 2.4 }));
  // Línea corta bajo el arco
  out.push(rc.line(cx + 2, topY + 10, cx + 2, topY + 16,
    { ...opts, ...PAL.overlayInk, strokeWidth: 2.4 }));
  // Punto final
  out.push(rc.circle(cx + 2, topY + 22, 3.5, { ...opts, ...PAL.overlayInk }));
  return out;
}
```

- [ ] **Step 9: Agregar `drawAnswerReveal`**

```js
function drawAnswerReveal(rc, W, H, opts) {
  // Caja idéntica a question-prompt pero con cheque "✓".
  const out = [];
  const x = W * 0.55, y = H * 0.15, w = W * 0.32, h = H * 0.36;
  out.push(rc.rectangle(x, y, w, h, { ...opts, ...PAL.overlayBadge }));
  // Cheque: dos segmentos en V invertida
  const ax = x + w * 0.28, ay = y + h * 0.56;
  const bx = x + w * 0.44, by = y + h * 0.72;
  const dx = x + w * 0.74, dy = y + h * 0.34;
  out.push(rc.line(ax, ay, bx, by, { ...opts, ...PAL.overlayInk, strokeWidth: 3 }));
  out.push(rc.line(bx, by, dx, dy, { ...opts, ...PAL.overlayInk, strokeWidth: 3 }));
  return out;
}
```

- [ ] **Step 10: Agregar `drawOtro`**

```js
function drawOtro(rc, W, H, opts) {
  // Badge genérico con "OTRO" esquemático (tres puntos = forma indefinida).
  const out = [];
  const x = W * 0.72, y = 8, w = 60, h = 22;
  out.push(rc.rectangle(x, y, w, h, { ...opts, ...PAL.overlayBadge }));
  // tres círculos como elipsis
  const dotY = y + h * 0.50;
  for (let i = 0; i < 3; i++) {
    out.push(rc.circle(x + 18 + i * 10, dotY, 3.2, { ...opts, ...PAL.overlayInk }));
  }
  return out;
}
```

- [ ] **Step 11: Reescribir el dispatcher `drawOverlayBadges`**

Reemplazar el cuerpo actual por:

```js
function drawOverlayBadges(rc, W, H, overlays, baseOpts) {
  if (!overlays || !overlays.length) return [];
  const out = [];
  for (const ov of overlays) {
    const t = (ov && ov.tipo) || "";
    if (t === "intro-animada")         out.push(...drawIntroStar(rc, W, H, baseOpts));
    else if (t === "outro-animada")    out.push(...drawOutroMark(rc, W, H, baseOpts));
    else if (t === "lower-third")      out.push(...drawLowerThird(rc, W, H, baseOpts));
    else if (t === "callout")          out.push(...drawCallout(rc, W, H, baseOpts));
    else if (t === "chapter-marker")   out.push(...drawChapterMarker(rc, W, H, baseOpts));
    else if (t === "stat-callout")     out.push(...drawStatCallout(rc, W, H, baseOpts));
    else if (t === "pull-quote")       out.push(...drawPullQuote(rc, W, H, baseOpts));
    else if (t === "progress-indicator") out.push(...drawProgressIndicator(rc, W, H, baseOpts));
    else if (t === "question-prompt")  out.push(...drawQuestionPrompt(rc, W, H, baseOpts));
    else if (t === "answer-reveal")    out.push(...drawAnswerReveal(rc, W, H, baseOpts));
    else if (t === "otro")             out.push(...drawOtro(rc, W, H, baseOpts));
  }
  return out;
}
```

- [ ] **Step 12: Commit**

```bash
git add scripts/storyboard-draft.template.html
git commit -m "$(cat <<'EOF'
Fase H.2: constantes + glyphs del template al catálogo nuevo

OVERLAY_TIPOS reescrito con 10 tipos universales + escape hatch
'otro'. Cada entrada incluye 'tip' para mostrar cita al pilar en
el tooltip del select.

Funciones de dibujo:
- Eliminadas: drawIdeaBulb, drawSeparator, drawHighlightIcon.
- Renombrada: drawCalloutArrow → drawCallout (cuerpo idéntico,
  docstring nuevo aclarando que la forma concreta va en prompt IA).
- Agregadas: drawChapterMarker (tarjeta subrayada),
  drawStatCallout (cuadrado con dígito esquemático),
  drawPullQuote (caja con comillas + líneas), drawProgressIndicator
  (5 segmentos, 2 rellenos), drawQuestionPrompt (caja con '?'),
  drawAnswerReveal (caja con cheque), drawOtro (badge con elipsis).

Dispatcher drawOverlayBadges actualizado con los 11 case branches.

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
EOF
)"
```

---

## Task H.3: Tooltips en UI + validación visual del `otro`

**Files:**
- Modify: `scripts/storyboard-draft.template.html` (bloque `blockCard` y `panelCard` donde el select de overlays se construye, alrededor de líneas 416-450 y 886-915)

- [ ] **Step 1: Agregar tooltip al select de overlays en vista Tabla**

Buscar en `blockCard` (vista Tabla) el bloque donde se construye el select de tipo de overlay:

```js
const sel = el("select", {
  onchange: e => { state.blocks[idx].overlays[oi].tipo = e.target.value; renderBlocks(); }
}, ...OVERLAY_TIPOS.map(o => el("option", { value: o.v }, o.l)));
sel.value = ov.tipo || "idea-bulb";
```

Reemplazar por (atributo `title` con cita al pilar + default nuevo):

```js
const sel = el("select", {
  onchange: e => { state.blocks[idx].overlays[oi].tipo = e.target.value; renderBlocks(); }
}, ...OVERLAY_TIPOS.map(o => {
  const opt = el("option", { value: o.v, title: o.tip }, o.l);
  return opt;
}));
sel.value = ov.tipo || "callout";
// Tooltip sobre el select global muestra la info del tipo seleccionado
const current = OVERLAY_TIPOS.find(o => o.v === sel.value);
if (current) sel.title = current.tip;
sel.addEventListener("change", () => {
  const c = OVERLAY_TIPOS.find(o => o.v === sel.value);
  if (c) sel.title = c.tip;
});
```

Nota: el default anterior era `idea-bulb` (ya no existe). Cambiar a `callout`.

- [ ] **Step 2: Validación visual del `otro` — marcar descripción como obligatoria**

Localizar el input de descripción del overlay en `blockCard`:

```js
const desc = el("input", {
  value: ov.descripcion || "",
  placeholder: 'Ej. "Dr. Ana · Investigadora" o prompt IA',
  oninput: e => { state.blocks[idx].overlays[oi].descripcion = e.target.value; }
});
```

Reemplazar por una versión que marque borde ámbar si tipo=`otro` y descripcion está vacía:

```js
const desc = el("input", {
  value: ov.descripcion || "",
  placeholder: ov.tipo === "otro"
    ? 'OBLIGATORIO: describir la forma (el editor no la puede inferir)'
    : 'Ej. "Dr. Ana · Investigadora" o prompt IA',
  oninput: e => {
    state.blocks[idx].overlays[oi].descripcion = e.target.value;
    desc.style.borderColor = (state.blocks[idx].overlays[oi].tipo === "otro"
      && !e.target.value.trim())
      ? "var(--warn)" : "";
  }
});
// estado inicial del borde
if (ov.tipo === "otro" && !(ov.descripcion || "").trim()) {
  desc.style.borderColor = "var(--warn)";
}
```

- [ ] **Step 3: Default de tipo al agregar overlay cambia a `callout`**

Localizar `addOverlay` (línea ~1110):

```js
function addOverlay(blockIdx) {
  const b = state.blocks[blockIdx];
  if (!b.overlays) b.overlays = [];
  b.overlays.push({ tipo: "idea-bulb", desde: "", hasta: "", descripcion: "" });
  renderBlocks();
}
```

Cambiar `tipo: "idea-bulb"` por `tipo: "callout"`.

- [ ] **Step 4: Verificar chips en vista Cómic siguen funcionando**

En `panelCard` (~línea 891) hay:

```js
const meta = OVERLAY_TIPOS.find(o => o.v === ov.tipo) || { abbr: "?" };
```

Esto ya busca por `v`. Como los valores cambian (p. ej. `callout-flecha` → `callout`), no hay que tocar esta línea — pero si un storyboard viejo trae `callout-flecha`, el chip mostrará "?". Eso es deseable: forzar al usuario a actualizar el tipo.

- [ ] **Step 5: Commit**

```bash
git add scripts/storyboard-draft.template.html
git commit -m "$(cat <<'EOF'
Fase H.3: tooltips con cita a pilar + validación visual de 'otro'

Select de tipo de overlay en vista Tabla:
- Cada <option> lleva atributo 'title' con cita al pilar.
- El <select> mismo actualiza su title según el valor seleccionado.

Input de descripción:
- Si tipo === 'otro' y descripción vacía, borde ámbar y placeholder
  indica que es obligatorio. Validación solo visual, no bloquea
  export (sigue el patrón existente de unresolved variants).

addOverlay cambia default de 'idea-bulb' (inexistente) a 'callout'.

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
EOF
)"
```

---

## Task H.4: Actualizar skills

**Files:**
- Modify: `skills/previsualizacion-entrenamiento/SKILL.md`
- Modify: `skills/edicion-entrenamiento/SKILL.md`

- [ ] **Step 1: Leer sección actual de overlays en previsualizacion-entrenamiento**

Run: `grep -n "overlays" skills/previsualizacion-entrenamiento/SKILL.md`
Esperado: ver las menciones actuales donde se describe el catálogo y la UI.

- [ ] **Step 2: Reescribir la sección "Overlays auxiliares (capa de post) en la UI"**

Buscar en `skills/previsualizacion-entrenamiento/SKILL.md` el bloque:

```markdown
**Overlays auxiliares (capa de post) en la UI.** Cada bloque puede
declarar overlays generados en post (intro-animada, outro-animada,
lower-third, idea-bulb, callout-flecha, separador, highlight-icono).
En Cómic se ven como chips ámbar debajo de la viñeta y como
pictogramas dibujados sobre la viñeta (foquito arriba-derecha,
tarjeta en tercio inferior, etc.) para que un principiante **vea**
lo que después va a aparecer en pantalla. En Tabla hay editor
completo por bloque (tipo · desde · hasta · descripción/prompt IA).
Se propagan al brief `edicion/10-overlays-auxiliares`.
```

Reemplazar por:

```markdown
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
```

- [ ] **Step 3: Ajustar ejemplo cross-género en edicion-entrenamiento**

Buscar en `skills/edicion-entrenamiento/SKILL.md` la sección `═══ 10. OVERLAYS AUXILIARES ═══`:

```markdown
═══ 10. OVERLAYS AUXILIARES ═══
[LISTA POR TIMESTAMP]: [bloque, tipo, timestamps, descripción/prompt IA]
[HERRAMIENTA DE GENERACIÓN]: [Remotion / Motion Canvas / HyperFrames / Manim]
[PROPAGADOS DESDE]: [Production Brief locked, sección 4]
```

Reemplazar por:

```markdown
═══ 10. OVERLAYS AUXILIARES ═══
[CATÁLOGO]: 10 tipos universales + 'otro' (escape hatch libre).
Cada tipo tiene cita al pilar que lo respalda (el brief lo documenta).
[LISTA POR TIMESTAMP]: [bloque, tipo, timestamps, descripción/prompt IA]
  Ejemplo (explainer económico):
    B3  stat-callout    01:12-01:15  "8.3% inflación anual"
    B4  pull-quote      02:11-02:16  "...función de reacción" — Banxico
    B6  question-prompt 04:20-04:24  "¿Cuál es el mecanismo de transmisión?"
    B6  answer-reveal   04:26-04:29  "Tasa → crédito → consumo"
    B7  otro            05:10-05:12  "mapa animado de la región afectada"
[HERRAMIENTA DE GENERACIÓN]: [Remotion / Motion Canvas / HyperFrames / Manim]
[PROPAGADOS DESDE]: [Production Brief locked, sección 4]
```

- [ ] **Step 4: Commit**

```bash
git add skills/previsualizacion-entrenamiento/SKILL.md skills/edicion-entrenamiento/SKILL.md
git commit -m "$(cat <<'EOF'
Fase H.4: skills mencionan catálogo de 10 + 'otro' + cita a pilar

previsualizacion-entrenamiento: la sección de overlays en la UI
ahora lista los 10 tipos canónicos y menciona el escape hatch
'otro' con descripción obligatoria. Menciona también los tooltips
con cita al pilar.

edicion-entrenamiento: ejemplo de la sección 10 del plan de salida
usa un caso cross-género (explainer económico) con stat-callout,
pull-quote, question-prompt, answer-reveal y 'otro', en vez del
caso técnico anterior.

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
EOF
)"
```

---

## Task H.5: Demo re-hidratado con ejemplos cross-género

**Files:**
- Modify: `/tmp/hydrate-demo.py`
- Regenerate: `/tmp/storyboard-draft-demo.html`

- [ ] **Step 1: Reescribir `/tmp/hydrate-demo.py` con storyboard cross-género**

Reemplazar el contenido completo de `/tmp/hydrate-demo.py` por:

```python
#!/usr/bin/env python3
"""Hydrate /tmp/storyboard-draft-demo.html con un storyboard
cross-género (explainer sobre política monetaria regional) que
demuestra los 10 tipos del catálogo nuevo + el escape hatch 'otro'."""
import json
import shutil
from pathlib import Path

TEMPLATE = "/home/antonio/Proyectos_local/training-video-toolkit/scripts/storyboard-draft.template.html"
OUT = "/tmp/storyboard-draft-demo.html"

data = {
    "meta": {
        "title": "Política monetaria regional: lectura rápida",
        "target": "7 min",
        "wpm": "160",
        "date": "2026-04-19",
        "state": "draft",
        "lockedAt": "",
    },
    "blocks": [
        {
            "titulo": "Hook + pregunta central",
            "tipo": "camara", "encuadre": "MS", "duracion": "0:30",
            "visual": "Plano medio, fondo neutro. Presentador a cámara.",
            "narracion": "Si el banco central sube la tasa esta semana, ¿qué cambia para tu salario dentro de seis meses?",
            "transicion": "corte seco", "zoomOBS": False,
            "escena": "cam-full", "shortcut": "F1",
            "referencia": "", "senalizacion": "Highlight en 'seis meses'",
            "overlays": [
                {"tipo": "intro-animada", "desde": "0:00", "hasta": "0:04",
                 "descripcion": "Branding + título + pregunta-promesa"}
            ],
            "variantGroup": None, "variantLabel": None, "variantChosen": None,
        },
        {
            "titulo": "Identificación de la experta",
            "tipo": "camara", "encuadre": "MS", "duracion": "0:35",
            "visual": "Plano medio, entrevistada con gráfica detrás.",
            "narracion": "Entrevista a la Dra. Claudia Soto, economista senior del Banco Central.",
            "transicion": "corte seco", "zoomOBS": False,
            "escena": "cam-full", "shortcut": "",
            "referencia": "", "senalizacion": "",
            "overlays": [
                {"tipo": "lower-third", "desde": "0:34", "hasta": "0:40",
                 "descripcion": '"Dra. Claudia Soto · Economista senior, Banco Central"'}
            ],
            "variantGroup": None, "variantLabel": None, "variantChosen": None,
        },
        {
            "titulo": "Cifra clave: inflación",
            "tipo": "demo-pantalla", "encuadre": "MS", "duracion": "0:40",
            "visual": "Gráfico de barras simple mostrando IPC últimos 12 meses.",
            "narracion": "La inflación anual cerró en 8.3%, arriba del rango objetivo de 3%±1.",
            "transicion": "cross-dissolve 400ms", "zoomOBS": False,
            "escena": "pantalla-grafico", "shortcut": "F2",
            "referencia": "", "senalizacion": "Highlight barra del último mes",
            "overlays": [
                {"tipo": "stat-callout", "desde": "1:12", "hasta": "1:15",
                 "descripcion": "'8.3%' grande en esquina superior izquierda + 'inflación anual' debajo"}
            ],
            "variantGroup": None, "variantLabel": None, "variantChosen": None,
        },
        {
            "titulo": "Cita textual del comunicado",
            "tipo": "demo-pantalla", "encuadre": "MS", "duracion": "0:50",
            "visual": "Página del comunicado del banco central con párrafo resaltado.",
            "narracion": "En el comunicado, el banco afirma que 'esto cambia la función de reacción'.",
            "transicion": "corte seco", "zoomOBS": True,
            "escena": "pantalla-zoom-doc", "shortcut": "F3",
            "referencia": "", "senalizacion": "Zoom al párrafo",
            "overlays": [
                {"tipo": "pull-quote", "desde": "2:11", "hasta": "2:16",
                 "descripcion": '"...esto cambia la función de reacción" — Banco Central, abril 2026'}
            ],
            "variantGroup": None, "variantLabel": None, "variantChosen": None,
        },
        {
            "titulo": "Fase 2: post-crisis",
            "tipo": "camara", "encuadre": "MS", "duracion": "0:35",
            "visual": "Plano medio, pantalla atrás muestra cronología.",
            "narracion": "Entramos a la fase post-crisis, donde la pregunta cambia.",
            "transicion": "corte seco", "zoomOBS": False,
            "escena": "cam-full", "shortcut": "",
            "referencia": "", "senalizacion": "",
            "overlays": [
                {"tipo": "chapter-marker", "desde": "3:00", "hasta": "3:03",
                 "descripcion": '"Fase 2 — Post-crisis" en tarjeta centrada'}
            ],
            "variantGroup": None, "variantLabel": None, "variantChosen": None,
        },
        {
            "titulo": "Mecanismo de transmisión (pausa reflexiva)",
            "tipo": "camara", "encuadre": "MS", "duracion": "0:50",
            "visual": "Plano medio. Pausa después de la pregunta.",
            "narracion": "Antes de responder: ¿cuál es el mecanismo de transmisión? Piénsalo dos segundos.",
            "transicion": "corte seco", "zoomOBS": False,
            "escena": "cam-full", "shortcut": "",
            "referencia": "", "senalizacion": "",
            "overlays": [
                {"tipo": "question-prompt", "desde": "4:20", "hasta": "4:24",
                 "descripcion": '"¿Cuál es el mecanismo de transmisión?" caja central'},
                {"tipo": "answer-reveal", "desde": "4:26", "hasta": "4:29",
                 "descripcion": '"Tasa → crédito → consumo" tras pausa'}
            ],
            "variantGroup": None, "variantLabel": None, "variantChosen": None,
        },
        {
            "titulo": "Mapa regional",
            "tipo": "demo-pantalla", "encuadre": "MS", "duracion": "0:50",
            "visual": "Mapa con regiones coloreadas por impacto.",
            "narracion": "El impacto no es homogéneo: las regiones con más crédito al consumo se ven afectadas más pronto.",
            "transicion": "corte seco", "zoomOBS": False,
            "escena": "pantalla-mapa", "shortcut": "F4",
            "referencia": "", "senalizacion": "",
            "overlays": [
                {"tipo": "otro", "desde": "5:10", "hasta": "5:12",
                 "descripcion": "Mapa animado con regiones que se colorean secuencialmente según orden de transmisión"},
                {"tipo": "progress-indicator", "desde": "0:00", "hasta": "7:00",
                 "descripcion": "Barra superior segmentada (visible durante todo el video)"}
            ],
            "variantGroup": None, "variantLabel": None, "variantChosen": None,
        },
        {
            "titulo": "Cierre con CTA",
            "tipo": "camara", "encuadre": "ECU", "duracion": "0:20",
            "visual": "Primerísimo plano, mirada directa.",
            "narracion": "Si querés ver cómo ajustar tu presupuesto familiar, dejé el link en la descripción.",
            "transicion": "fade a negro", "zoomOBS": False,
            "escena": "cam-full", "shortcut": "",
            "referencia": "", "senalizacion": "",
            "overlays": [
                {"tipo": "outro-animada", "desde": "6:40", "hasta": "7:00",
                 "descripcion": "CTA suscribirse + link a video de presupuesto"}
            ],
            "variantGroup": None, "variantLabel": None, "variantChosen": None,
        },
    ],
    "conflicts": "Densidad de overlays 2-3/min es alta para audiencia no-técnica; usuario acepta por claridad y balancea con narración pausada a 160 WPM.",
}

shutil.copy(TEMPLATE, OUT)

src = Path(OUT).read_text()
inject = "<script>\nwindow.__STORYBOARD_DATA__ = " + json.dumps(data, ensure_ascii=False, indent=2) + ";\n</script>\n"
src = src.replace("<script>\n/* __STORYBOARD_DATA__ */", inject + "<script>\n/* __STORYBOARD_DATA__ */")
Path(OUT).write_text(src)

overlay_total = sum(len(b.get("overlays", [])) for b in data["blocks"])
unique_types = {ov["tipo"] for b in data["blocks"] for ov in b.get("overlays", [])}
print(f"Hidratado: {OUT}")
print(f"  bloques: {len(data['blocks'])}")
print(f"  overlays totales: {overlay_total}")
print(f"  tipos únicos: {sorted(unique_types)}")
```

El storyboard cubre los 10 tipos canónicos + el `otro`, en un caso cross-género (explainer económico sobre política monetaria regional).

- [ ] **Step 2: Ejecutar el hidrator**

Run: `python3 /tmp/hydrate-demo.py`
Esperado:
```
Hidratado: /tmp/storyboard-draft-demo.html
  bloques: 8
  overlays totales: 11
  tipos únicos: ['answer-reveal', 'chapter-marker', 'intro-animada', 'lower-third', 'otro', 'outro-animada', 'progress-indicator', 'pull-quote', 'question-prompt', 'stat-callout']
```

Si faltan tipos en la lista de únicos, volver al step 1 y revisar que cada bloque tenga al menos un overlay del catálogo esperado.

- [ ] **Step 3: Validación visual manual**

Abrir `/tmp/storyboard-draft-demo.html` en el navegador (`open /tmp/storyboard-draft-demo.html` en macOS o `xdg-open /tmp/storyboard-draft-demo.html` en Linux). Verificar:

- [ ] Cada una de las 8 viñetas tiene un pictograma claramente visible sobre el dibujo base.
- [ ] Los chips ámbar debajo de las viñetas muestran las abreviaciones nuevas (INTRO, LT, STAT, QUOTE, CHAP, Q?, A!, OTRO, PROG, OUTRO).
- [ ] Al cambiar a vista Tabla, el select de cada overlay muestra 11 opciones.
- [ ] Pasar el mouse sobre una opción del select muestra el tooltip con la cita al pilar (en navegadores que exponen `title` de option — puede variar).
- [ ] En el bloque B7 (mapa regional), el overlay `otro` tiene el borde del input de descripción en ámbar solo si se limpia la descripción.
- [ ] Exportar YAML y verificar que los tipos serializados son los nuevos (no aparece `idea-bulb`, `separador` ni `highlight-icono`).

Si algún pictograma se ve mal posicionado, anotar y corregir las coordenadas en la función correspondiente en el template, luego repetir step 2.

- [ ] **Step 4: Drift check final**

Run: `bash scripts/verificar-briefs.sh --strict 2>&1 | tail -6`
Esperado:
```
Total briefs stale: 0
Total IDs no encontrados en pilar: 0
Total IDs inline no declarados en fuentes: 0
```

- [ ] **Step 5: Commit**

El hidrator y el demo viven en `/tmp/` (fuera del repo), así que no hay nada que commitear en este paso. Solo confirmar con:

Run: `git status --short`
Esperado: working tree clean (los commits anteriores ya cubrieron todos los cambios trackeados).

---

## Task H.6: Memoria de follow-up de la auditoría de sesgo

**Files:**
- Create: `/home/antonio/.claude/projects/-home-antonio-Proyectos-local-training-video-toolkit/memory/project_follow_up_bias_audit.md`
- Modify: `/home/antonio/.claude/projects/-home-antonio-Proyectos-local-training-video-toolkit/memory/MEMORY.md`

- [ ] **Step 1: Crear archivo de memoria con el follow-up**

Crear `/home/antonio/.claude/projects/-home-antonio-Proyectos-local-training-video-toolkit/memory/project_follow_up_bias_audit.md`:

```markdown
---
name: Auditoría de sesgo hacia tutorial técnico
description: Follow-up obligatorio tras spec 2026-04-19-auditoria-catalogo-overlays. Revisar si pilar 2, briefs, demo y skills están sesgados a tutorial técnico frente a divulgación/corporativo/onboarding/explainer general.
type: project
---

Tras implementar el spec `docs/superpowers/specs/2026-04-19-auditoria-catalogo-overlays-design.md` (fase H), queda pendiente la auditoría de sesgo documentada en §9 de ese spec.

**Why:** el toolkit declara servir a cinco formatos (tutorial técnico, divulgación, formación corporativa, onboarding, explainer general) pero durante la reforma de OVERLAY_TIPOS emergió que varias capas parecen inclinarse a tutorial técnico. Un descarte concreto (`keycaps`) fue solo por sesgo de género, no por invalidez. Esa misma asimetría puede estar en otros lados y romper la promesa cross-género del toolkit.

**How to apply:** esta auditoría se ejecuta inmediatamente después de cerrar la fase H. Pasos:

1. Tabular distribución de fichas por formato en `docs/pilares/02-tendencias-y-casos.md` y `docs/casos-de-exito/*.md`.
2. Recorrer los 37 briefs y catalogar los ejemplos por formato implícito.
3. Recorrer los 7 SKILL.md marcando fraseo sesgado.
4. Producir reporte con porcentajes y lista de gaps.
5. Priorizar remediaciones: fichas nuevas P2 vía `/actualizar-tendencias`, reescritura de ejemplos en briefs donde el sesgo es gratuito, segundo demo con caso no técnico.

El spec tiene el alcance detallado en §9.
```

- [ ] **Step 2: Agregar pointer al MEMORY.md**

Agregar la siguiente línea al final de `/home/antonio/.claude/projects/-home-antonio-Proyectos-local-training-video-toolkit/memory/MEMORY.md` (antes de que se trunque):

```markdown
- [Follow-up audit sesgo técnico](project_follow_up_bias_audit.md) — tras cerrar fase H (reforma OVERLAY_TIPOS) toca auditar sesgo hacia tutorial técnico en pilar 2, briefs, demo y skills; scope en spec §9.
```

- [ ] **Step 3: Verificar registro de la memoria**

Run: `ls -la /home/antonio/.claude/projects/-home-antonio-Proyectos-local-training-video-toolkit/memory/project_follow_up_bias_audit.md && grep "follow-up audit sesgo" /home/antonio/.claude/projects/-home-antonio-Proyectos-local-training-video-toolkit/memory/MEMORY.md`
Esperado: el archivo existe y hay una línea en MEMORY.md apuntando a él.

---

## Validación final — checklist §10 del spec

Verificar cada punto al cierre del plan:

- [ ] Brief `edicion/10-overlays-auxiliares.md` reescrito con catálogo de 10 + `otro`, todas las citas nuevas, `version: 2`, ≤100 líneas. (Task H.1)
- [ ] `storyboard-draft.template.html` actualizado con `OVERLAY_TIPOS` nuevo, 7 funciones de dibujo nuevas, 3 eliminadas, 1 renombrada, UI de Tabla y Cómic con tooltips. (Tasks H.2 y H.3)
- [ ] `skills/previsualizacion-entrenamiento/SKILL.md` y `skills/edicion-entrenamiento/SKILL.md` actualizados. (Task H.4)
- [ ] `scripts/verificar-briefs.sh --strict` limpio. (Task H.1 y Task H.5)
- [ ] `scripts/regenerar-vistas.sh` ejecutado. (Task H.1)
- [ ] Demo re-hidratado con ejemplos cross-género y al menos un `otro`. (Task H.5)
- [ ] Commits separados por fase: H.1 (brief), H.2 (constantes+glyphs), H.3 (tooltips+validación), H.4 (skills), H.5 (validación), H.6 (follow-up). Seis commits totales.
- [ ] Follow-up documentado en memoria como next work item. (Task H.6)

---

## Notas para quien ejecute

1. **El toolkit no tiene tests unitarios.** El único "test" automatizado es `scripts/verificar-briefs.sh --strict`. Validación visual del demo es inspección humana en el navegador. No inventes tests jest/pytest — no hay suite.
2. **Idioma:** español de México. Evitar formas rioplatenses (`vos`, `querés`, `tenés`, `acá`). Usar `tú` y formas mexicanas.
3. **rough.js está embebido** en el template (~28KB minificados). No se usa CDN. Todas las funciones `rc.xxx(...)` vienen de ese bundle.
4. **Variantes A/B ya existen** en el template — no tocar esa lógica.
5. **El demo `/tmp/storyboard-draft-demo.html` no se versiona** — es efímero. Solo el hidrator `/tmp/hydrate-demo.py` también es efímero.
6. **Push a main lo hace el usuario** desde su terminal. No intentar `git push` desde sesión del asistente.
