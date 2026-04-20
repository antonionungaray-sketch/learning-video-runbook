---
name: record-explainer
description: "Use when the user is at the recording / capture stage of an explainer video (tutorial, divulgation, video-essay, documentary, data-journalism, product explainer, how-to, onboarding, conference, livestream, podcast, personal essay with pedagogical intent) — setting up audio, video, lighting, scenes, screen capture, multi-mic for podcast, live-stream infrastructure, or planning takes. Etapa de pre-producción y grabación del video-explainer-guide."
---

# Grabación del explainer video

Acompañas al creador a producir material crudo de calidad suficiente
para que la edición no tenga que rescatar defectos.

## Carga obligatoria al inicio

Antes de proponer cualquier decisión, **lee todos los briefs de esta
etapa**:

```
docs/briefs/grabacion/*.md
```

(7 archivos de 78-89 líneas cada uno. Orden alfabético = orden de flujo:
01-audio → 02-video-encuadre → 03-iluminacion → 04-escenas →
05-captura-pantalla → 06-tomas → 07-b-roll-plan.)

## Input opcional: Production Brief de previsualización

Preguntá al usuario si completó la etapa de previsualización y tiene un
**Production Brief** (`production-brief-<slug>.md` o similar, junto al
guion).

### Verificación de estado (lock gate)

Al cargarlo, **leé el header de metadatos** (`estado:` y `locked-at:`).

- **`estado: locked`** (con `locked-at` presente): contrato firme.
  Grabación lo consume como fuente de verdad sin re-discutir decisiones
  de storyboard, pacing, shotlist ni requisitos de captura. Si durante
  la grabación aparece una necesidad de cambio, se anota en **Notas
  de Producción** del plan de grabación y se avisa al usuario que
  tiene que re-invocar `storyboard-explainer` para re-lockear.

- **`estado: draft`**: avisar explícitamente al usuario:
  > "El Production Brief está en `draft`, no lockeado. Recomiendo
  > cerrarlo invocando `storyboard-explainer` antes de
  > grabar. ¿Preferís volver a cerrarlo o seguís adelante asumiendo
  > que el brief no es contrato?"
  No bloquear: si el usuario decide seguir, continuar con disclaimer
  registrado en Notas de Producción.

- **Sin header de estado** (artefacto antiguo pre-gate): tratarlo como
  draft y avisar.

### Consumo

- **Tipo de bloque** del storyboard → input para `02-video-encuadre`:
  si todos los bloques son `demo-pantalla`, auto-propón "sin face-cam";
  si hay `camara` y `mixto`, propón face-cam principal o PiP.
- **Duración estimada por bloque** → input para `06-tomas`: plan de
  bloques con duraciones objetivo y puntos de corte sugeridos.
- **Shotlist** → input para `05-captura-pantalla`: cursor/highlight
  declarado y props requeridos antes de grabar.
- **Requisitos de captura (sección 4)** → fuente de verdad para
  `04-escenas` cuando el brief está `locked`: escenas OBS con fuentes,
  crop y shortcut; mapa bloque→escena.
- **Referencias visuales** → input para `04-escenas` (intención
  estética).

**Cuando NO existe el Production Brief** (usuario saltó previsualización
o flujo antiguo), proceder autónomamente como antes. El skill es
funcional con o sin brief.

**Integración read-only.** Este skill nunca modifica el Production Brief;
solo lo referencia. Cambios se anotan en **Notas de Producción**.

**NO leer pilares completos en runtime.** Los briefs ya sintetizan la
información con trazabilidad vía IDs estables. Si durante el flujo
surge una pregunta fuera del scope de los briefs, usa `Grep` dirigido
por ID (ej. `grep "P3-preprod-audio"
docs/pilares/03-herramientas.md`), no `Read` del archivo completo.

## Lectura de ejes para routing

El Concept Brief contiene sección **0.5 Modalidad y ejes** con `preset`,
los 5 `ejes` y `plataforma`. Referencia:
`docs/arquitectura/modalidades-y-ejes.md`.

**Cada decisión del flujo** se resuelve así:
1. Leer el brief correspondiente.
2. Revisar `varia-por-eje:` en su frontmatter.
3. Si es `[]`: aplicar el brief tal cual.
4. Si es `[ejeX, ...]`: ir a `## Ajuste por eje` del brief y aplicar el
   sub-bloque correspondiente al valor del Concept Brief.

**Notas específicas para grabación:**
- `grado-edicion: zero` (live stream) colapsa varias decisiones — el
  setup OBS + escenas + Stream Deck son la "grabación" en vivo. Sin
  multi-take ni reshoots. Ver [P3-modalidades-live].
- `rol-presentador: narrador-omnisciente` → no hay cara en cámara;
  iluminación y encuadre no aplican. Grabación = voice-over post.
- `rol: conversador` / `anfitrion-de-experto` → multi-mic + multi-cam
  simétrico. Ver [P3-modalidades-podcast].

Si el Concept Brief no tiene sección 0.5, pregunta al usuario los 5
ejes antes de continuar.

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

1. **Cargar la sección del Pilar 3** y extraer todos los bullets de herramienta con sus bloques `<!-- meta: <slug> -->`. Las herramientas relevantes para esta etapa están en `docs/briefs/grabacion/`.

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

**Nota sobre captura de pantalla (OS-segmented):** el brief `docs/briefs/grabacion/05-captura-pantalla.md` ya incluye una tabla inline segmentada por OS con herramientas para cada plataforma. Este Paso 0.5 es **complementario** a esa tabla, no la reemplaza — ambos pueden mostrarse juntos: la tabla provee la recomendación base por OS, y el filtrado del perfil la refina por licencia, modo y hardware.

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

6. **Si el usuario acepta persistir:** invocar `update-tools` con payload estructurado (ver sección "Invocación con payload estructurado" en el skill update-tools).

### Sin acceso a WebSearch

Si WebSearch falla, no devuelve resultados útiles, o el perfil tiene `conectividad: offline`:

> "No hay equivalente curado para tu entorno y no tengo búsqueda externa disponible. ¿Quieres nombrar tú una herramienta que uses o conozcas? Si la nombras, puedo ofrecerte incorporarla al catálogo."

Si el usuario nombra una herramienta, ofrecer invocar `update-tools` con los datos aportados.

## Flujo

Camina al creador por las 7 decisiones críticas **en el orden de los
briefs cargados**. Cada decisión usa EXCLUSIVAMENTE su brief
correspondiente.

Para cada decisión:

1. **Plantear la `pregunta`** del frontmatter del brief.
2. **Aplicar el test de determinismo upstream** (solo si el brief
   tiene `admite-variantes: true`):
   - Si al menos 2 de los `Casos` listados son razonablemente aplicables
     al contexto actual del usuario evaluado contra **TODOS los ejes**
     (audiencia + nicho + presupuesto de producción + decisiones
     previas): **ofrecer variantes con recomendación**.
   - Si un solo caso domina: proponer una sola propuesta.
   - **Nota de etapa:** en grabación, 3 decisiones admiten variantes
     por diseño: 02-video-encuadre (face-cam vs sin-cara vs split),
     05-captura-pantalla (cursor / highlight / callouts en vivo vs
     post), 06-tomas (one-take vs bloques vs stream→edit down). El
     resto (audio, iluminación, escenas, B-roll) es determinista —
     principios o derivados del guión.
3. **Proponer con justificación trazable** citando IDs del brief.
   Flaggear `Conflictos conocidos` si aplican.
4. **Dispatch de variantes (solo si aplica y el usuario aceptó):**
   Task tool con brief congelado inline + decisiones previas
   acumuladas. El sub-agent devuelve variantes; NO decide.
5. **Registrar la decisión** antes de pasar a la siguiente.

## Reglas firmes de la etapa

- **Audio antes que video.** Si el setup de audio no está sólido
  (picos -6 a -3dB, promedio ~-18dB, noise floor ≤-60dBFS), no
  avanzar a otras decisiones. El upgrade de mayor retorno por $
  siempre es el micrófono [brief 01].
- **Iluminación antes que cámara de gama alta.** Cámara modesta bien
  iluminada supera cámara de gama alta mal iluminada [brief 03].
- **Codec consistente** en todas las tomas evita transcodings
  innecesarios en edición. **Default recomendado para OBS:** container
  `MKV` durante grabación (recupera archivos si OBS crashea o el
  sistema se cuelga, a diferencia de MP4); encoder `x264` con CRF
  18-20 si CPU aguanta, o `NVENC`/`QSV`/`VideoToolbox` si hardware
  modesto; 30 o 60 fps CFR; sample rate audio 48 kHz. **Remux a MP4
  sin re-encode** al cerrar sesión de grabación (`ffmpeg -i in.mkv
  -c copy out.mp4`) para compatibilidad con editores.

## Salida

Al terminar las 7 decisiones, produce un **plan de grabación
documentado**:

```
PROYECTO: [nombre del video]
DURACIÓN ESTIMADA: [N] min
GUIÓN DE REFERENCIA: [link al artefacto de script-explainer]

═══ 01. AUDIO ═══
[MICRÓFONO]: [modelo + tipo]
[NIVELES DE PRUEBA]: [picos, promedio, noise floor]
[TRATAMIENTO ESPACIO]: [medidas aplicadas]
[SAMPLE RATE / BIT DEPTH]: [48kHz/24bit típico]

═══ 02. VIDEO Y ENCUADRE ═══
[MODELO]: [sin-cara / face-cam principal / face-cam PiP / studio]
[ENCUADRE POR TOMA]: [composición específica]
[RESOLUCIONES DE CAPTURA]: [cam + screen]

═══ 03. ILUMINACIÓN ═══
[SETUP]: [key + fill + back o simplificación]
[BALANCE DE BLANCOS]: [5500K o 3200K manual]
[VERIFICACIÓN]: [captura de prueba]

═══ 04. ESCENAS ═══
[LISTA DE ESCENAS]: [nombre + composición de fuentes + shortcut]
[MAPEO A BLOQUES DEL GUIÓN]: [qué escena para cada bloque]

═══ 05. CAPTURA DE PANTALLA ═══
[CURSOR]: [visible/oculto] + [herramienta de highlight si aplica]
[CALLOUTS EN VIVO]: [sí/no + método]
[ZOOM PREVISTO EN POST]: [zonas aproximadas]

═══ 06. TOMAS ═══
[ESTRATEGIA]: [one-take / bloques / stream→edit down]
[PLAN DE BLOQUES]: [duración estimada de cada uno + pausas]
[PLAN DE RETOMAS]: [qué hacer si falla]

═══ 07. B-ROLL PRE-PRODUCIDO ═══
[LISTA]: [nombre + tipo + timestamp objetivo en el video]
[RECURSOS EXTERNOS]: [con atribución]

═══ NOTAS DE PRODUCCIÓN ═══
[CONFLICTOS FLAGGEADOS]: [lista si aplica]
[BACKUPS]: [ubicaciones de archivos crudos]
```

Verifica antes de declarar la etapa completa:

- [ ] Audio capturado limpio (sin clipping, sin ruido distrayente).
- [ ] Video estable, encuadre consistente entre tomas relacionadas.
- [ ] Iluminación coherente (sin saltos de balance de blancos).
- [ ] Todas las escenas del guión están grabadas.
- [ ] B-roll y recursos auxiliares listos (no se busca en edición).
- [ ] Backup de archivos crudos en al menos 2 ubicaciones.
- [ ] Notas de edición para momentos a cortar, repetir, o destacar.
- [ ] Cero conflictos no resueltos (P2 vs P1 o P1 vs restricción
      externa).

## Reglas firmes del flujo

- **Nunca leer pilares completos** en el flujo normal. Solo briefs.
- **Trazabilidad obligatoria:** cada recomendación cita ID del brief.
- **El toolkit es agnóstico de hardware.** No asumir un sistema
  operativo, GPU o software específico. Si el usuario menciona
  limitaciones, sugerir alternativas dentro del presupuesto.
- **Variantes solo cuando el test de determinismo las habilita** y
  solo en 02-video-encuadre, 05-captura-pantalla, 06-tomas.
