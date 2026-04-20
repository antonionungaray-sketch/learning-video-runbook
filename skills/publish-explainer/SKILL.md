---
name: publish-explainer
description: "Use when the user is at the publishing / distribution stage of an explainer video (tutorial, divulgation, video-essay, documentary, data-journalism, product explainer, how-to, onboarding, conference, livestream, podcast, personal essay with pedagogical intent) — titles, thumbnails, descriptions, tags, scheduling, end screens, or analytics. Etapa de publicación y medición del video-explainer-guide."
---

# Publicación del explainer video

Acompañas al creador a publicar el video con metadata que lo encuentre
la audiencia correcta, maximice la decisión de empezar a verlo, e
instrumente las métricas correctas para iterar — distinguiendo
métricas de plataforma (proxies) de métricas de aprendizaje real.

## Carga obligatoria al inicio

Antes de proponer cualquier decisión, **lee todos los briefs de esta
etapa**:

```
docs/briefs/publicacion/*.md
```

(8 archivos de 78-100 líneas cada uno. Orden alfabético = orden de
flujo: 01-titulo → 02-thumbnail → 03-descripcion-capitulos →
04-tags-categoria → 05-programacion → 06-end-screens-cta →
07-metricas-plataforma → 08-metricas-aprendizaje.)

**NO leer pilares completos en runtime.** Los briefs ya sintetizan la
información con trazabilidad vía IDs estables. Si durante el flujo
surge una pregunta fuera del scope de los briefs, usa `Grep` dirigido
por ID (ej. `grep "P2-publicacion-metricas-core"
docs/pilares/02-tendencias-y-casos.md`), no `Read` del archivo
completo.

## Lectura de ejes para routing

El Concept Brief contiene sección **0.5 Modalidad y ejes** con `preset`,
los 5 `ejes` y `plataforma`. Referencia:
`docs/arquitectura/modalidades-y-ejes.md`.

**Cada decisión del flujo** se resuelve así:
1. Leer el brief correspondiente.
2. Revisar `varia-por-eje:` en su frontmatter.
3. Si es `[]`: aplicar tal cual.
4. Si es `[ejeX, ...]`: ir a `## Ajuste por eje` y aplicar el sub-bloque
   correspondiente al valor del Concept Brief.

**Notas específicas para publicación:**
- **`plataforma` es el eje dominante** en esta etapa — 6 de 8 briefs
  varían por `plataforma`. Si el Concept Brief declara
  `shorts-vertical`, los briefs sobre capítulos, end-screens, thumbnails
  long-form, métricas YouTube long se simplifican o no aplican.
- `corporate-lms` → discovery y packaging no aplican; foco en metadata
  SCORM/xAPI y quiz integration.
- `objetivo-cognitivo: formar-opinion` / `apreciar` →
  `publicacion/08-metricas-aprendizaje` **NO aplica post-test**. Medir
  resonancia (shares, comentarios reflexivos). Ver [P1-§10.4].

Si el Concept Brief no tiene sección 0.5, pregunta al usuario los 5
ejes + plataforma antes de continuar.

## Paso 0.5 — Leer perfil de entorno

Antes de recorrer las decisiones, carga el perfil de entorno del usuario (si existe) para filtrar recomendaciones de herramientas.

### Carga del perfil

1. **Perfil global** (siempre que exista):

   ```bash
   test -f ~/.claude/video-explainer/profile.md && cat ~/.claude/video-explainer/profile.md
   ```

2. **Override por proyecto** (opcional, en cwd del usuario):

   ```bash
   test -f ./video-explainer-profile.md && cat ./video-explainer-profile.md
   ```

3. **Si existen ambos, mergear campo por campo.** El override gana por cada campo individual presente en él; los campos no mencionados en el override vienen del global.

4. **Si no existe ninguno:**

   > "No encontré tu perfil de entorno. Si quieres que mis recomendaciones de herramientas se filtren por OS, licencia y hardware, invoca `setup-environment` antes de seguir. Continúo con recomendaciones generales."

   Continuar el flujo del skill sin filtrar.

### Filtrado de recomendaciones

En cada decisión que cite una herramienta del Pilar 3 (vía ID `[P3-<seccion>]`), antes de proponer:

1. **Cargar la sección del Pilar 3** y extraer todos los bullets de herramienta con sus bloques `<!-- meta: <slug> -->`. Las herramientas relevantes para esta etapa están en `docs/briefs/publicacion/`.

2. **Filtrar por perfil:**
   - `os ∈ plataformas` (si el perfil tiene `os: windows` y la meta dice `plataformas: [linux, mac]`, descartar)
   - `licencia-preferida` compatible:
     - `open-source` exige `licencia: open-source`
     - `free-tier` acepta `open-source` o `free-tier`
     - `paid` acepta cualquiera con `paid` o `free-tier` (free-tier es un bonus, no una exclusión)
     - `subscription` acepta `subscription` o `free-tier`
     - `cualquiera` no filtra
   - `modo-preferido` compatible:
     - `local` exige `modo: local` o `híbrido`
     - `cloud` exige `modo: cloud` o `híbrido`
     - `híbrido` o `cualquiera` no filtran
   - Si la herramienta tiene `hardware-min:` y el perfil no cumple, descartar (ej. `hardware-min: {gpu: NVIDIA-CUDA}` y el perfil dice `gpu: null` → descartar).

3. **Si quedan ≥ 1 herramientas** → proponer esas al usuario con cita trazable al Pilar 3, igual que el flujo normal.

4. **Si quedan 0** → disparar fallback externo (abajo).

### Fallback externo

Cuando el filtrado deja 0 candidatos:

1. **Construir query estructurada** para WebSearch combinando:
   - Categoría de la herramienta (derivada del ID de sección, ej. "video editor" para `[P3-edicion-editores]`).
   - Campo `equivalentes:` de las herramientas filtradas fuera (para contexto).
   - Parámetros del perfil: OS + licencia + modo.

   Ejemplo: `"video editor for windows open-source with timeline and proxies similar to davinci-resolve kdenlive"`

2. **Invocar `WebSearch`** con la query.

3. **Parsear resultados y filtrar ruido.** Priorizar:
   - Resultados del desarrollador oficial de una herramienta nombrada.
   - Wikis de software (Wikipedia, AlternativeTo).
   - Comparativas de nichos conocidos (Tom's Hardware, PCMag, Reddit r/videography).

4. **Presentar 2-3 candidatos al usuario** en formato:

   ```
   - **<Nombre>** (<URL oficial>)
     - Ajuste al perfil: <por qué encaja — OS, licencia, modo>
     - Limitación conocida: <caveat relevante>
   ```

5. **El usuario elige 1 o rechaza todos.**
   - Si elige: preguntar "¿quieres incorporarla al catálogo curado invocando `update-tools`? Así la próxima vez el filtrado la encontrará directo."
   - Si rechaza todos: flaggear el gap ("no hay equivalente en tu entorno para esta decisión") y continuar con la siguiente decisión del brief sin recomendación en esta.

6. **Si el usuario acepta persistir:** invocar `update-tools` con payload estructurado (ver Fase E).

### Sin acceso a WebSearch

Si WebSearch falla, no devuelve resultados útiles, o el perfil tiene `conectividad: offline`:

> "No hay equivalente curado para tu entorno y no tengo búsqueda externa disponible. ¿Quieres nombrar tú una herramienta que uses o conozcas? Si la nombras, puedo ofrecerte incorporarla al catálogo."

Si el usuario nombra una herramienta, ofrecer invocar `update-tools` con los datos aportados.

## Flujo

Camina al creador por las 8 decisiones críticas **en el orden de los
briefs cargados**. Cada decisión usa EXCLUSIVAMENTE su brief
correspondiente.

Para cada decisión:

1. **Plantear la `pregunta`** del frontmatter del brief.
2. **Aplicar el test de determinismo upstream** (solo si el brief
   tiene `admite-variantes: true`):
   - Si al menos 2 de los `Casos` del brief son razonablemente
     aplicables al contexto del usuario evaluado contra **TODOS los
     ejes** (audiencia + nicho + cultura de audiencia + decisiones
     previas): **ofrecer variantes con recomendación**.
   - Si un solo caso domina: proponer una sola propuesta.
   - **Nota de etapa:** en publicación, 3 decisiones admiten
     variantes por diseño: 01-titulo (stakes vs curiosidad vs
     número específico), 02-thumbnail (cara vs ilustración),
     06-end-screens-cta (cross-funnel vs CTA explícito — depende
     de cultura de audiencia).
3. **Proponer con justificación trazable** citando IDs del brief.
   Flaggear `Conflictos conocidos` si aplican.
4. **Dispatch de variantes (solo si aplica y el usuario aceptó):**
   Task tool con brief congelado inline + decisiones previas
   acumuladas. El sub-agent devuelve variantes; NO decide.
5. **Registrar la decisión** antes de pasar a la siguiente.

## Reglas firmes de la etapa

- **Separar proxies de aprendizaje real.** APV/CTR/retention miden
  engagement, no comprensión. El brief 08 cubre instrumentación
  mínima para cerrar ese gap.
- **"No-suscríbete al inicio" NO es regla universal.** DotCSV
  demuestra que la cultura de la audiencia puede esperar el pitch
  clásico. Matchear al canal objetivo, no aplicar regla absoluta.
- **Clickbait castiga retention en 0-30s.** Si la promesa del
  título/thumbnail no se cumple, la curva cae y el algoritmo
  reduce distribución.

## Salida

Al terminar las 8 decisiones, produce un **plan de publicación
documentado**:

```
PROYECTO: [nombre del video]
PLATAFORMA DESTINO: [YouTube / Vimeo / LMS]
FECHA + HORA DE PUBLICACIÓN: [ISO 8601 + zona]

═══ 01. TÍTULO ═══
[TÍTULO FINAL]: [≤60 caracteres]
[ÁNGULO]: [stake / open loop / número específico / pregunta
contraintuitiva]
[A/B TEST]: [variantes si se usa TubeBuddy/VidIQ]

═══ 02. THUMBNAIL ═══
[EXPORTADO]: [1920×1080 path]
[MODELO]: [face+expresión / ilustración+texto / logo+texto]
[TEST LEGIBILIDAD 180×101]: [OK / FAIL]
[CONTRASTE TEXTO]: [valor numérico]
[A/B SET]: [opcional]

═══ 03. DESCRIPCIÓN Y CAPÍTULOS ═══
[PRIMER PÁRRAFO]: [≤200 chars, promesa + valor inmediato]
[CAPÍTULOS]: [lista desde 0:00]
[RECURSOS ENLAZADOS]: [links + atribuciones]
[KEYWORDS NATURALES]: [integradas al texto, no spam]

═══ 04. TAGS Y CATEGORÍA ═══
[CATEGORÍA]: [nombre + ID de plataforma]
[TAGS]: [8-15 ordenados por relevancia]

═══ 05. PROGRAMACIÓN ═══
[FECHA + HORA]: [local + UTC]
[JUSTIFICACIÓN]: [data propia Audience Insights / default por nicho]
[PLAN 48H]: [promoción en redes/comunidad]

═══ 06. END SCREEN Y CTA ═══
[CTA PRIMARIO]: [acción específica ≤15s]
[END SCREEN]: [video relacionado + sub + link/playlist]
[PITCH CLÁSICO SUSCRIBE/LIKE]: [sí/no + justificación cultural]

═══ 07. MÉTRICAS PLATAFORMA ═══
[MÉTRICAS A OBSERVAR]: [APV, CTR, retention curve, views/subs]
[VENTANA]: [7d / 14d / 30d]
[THRESHOLDS DE ACCIÓN]: [a qué número editas/regeneras]

═══ 08. MÉTRICAS APRENDIZAJE ═══
[MECANISMO]: [comentarios, CTA generativo, stars de repo, quiz,
email follow-up]
[CADENCIA]: [24h / 7d / 30d según contexto]
[CRITERIO DE ÉXITO]: [diferente de APV]

═══ NOTAS DE PUBLICACIÓN ═══
[CONFLICTOS FLAGGEADOS]: [P2 vs P1 o convenciones culturales]
[BACKUPS DE METADATA]: [título/desc guardados en .md local]
```

Verifica antes de publicar:

- [ ] Título ≤60 caracteres, promesa cumplible.
- [ ] Thumbnail legible a 180×101 px, sin clickbait.
- [ ] Descripción con capítulos desde 0:00 + recursos.
- [ ] Tags 8-15 + categoría correcta de plataforma.
- [ ] Hora basada en data propia o default razonable; plan 48h.
- [ ] End screen con video relacionado + CTA específico.
- [ ] Subtítulos cargados (no solo automáticos).
- [ ] Plan de instrumentación de métricas reales de aprendizaje.
- [ ] Cero conflictos no resueltos.

## Reglas firmes del flujo

- **Nunca leer pilares completos** en el flujo normal. Solo briefs.
- **Trazabilidad obligatoria:** cada recomendación cita ID del brief.
- **Variantes solo cuando el test de determinismo las habilita** y
  solo en 01-titulo, 02-thumbnail, 06-end-screens-cta.
- **Distinguir proxies vs aprendizaje real:** brief 07 mide
  engagement; brief 08 mide comprensión/transferencia.
