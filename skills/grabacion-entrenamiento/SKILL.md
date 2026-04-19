---
name: grabacion-entrenamiento
description: "Use when the user is at the recording / capture stage of a training video — setting up audio, video, lighting, scenes, screen capture, or planning takes. Etapa de pre-producción y grabación del toolkit de entrenamiento audiovisual."
---

# Grabación de entrenamiento audiovisual

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
guion). Si existe, cargalo como contexto estructurante read-only:

- **Tipo de bloque** del storyboard → input para `02-video-encuadre`:
  si todos los bloques son `demo-pantalla`, auto-proponé "sin face-cam";
  si hay `camara` y `mixto`, proponé face-cam principal o PiP.
- **Duración estimada por bloque** → input para `06-tomas`: plan de
  bloques con duraciones objetivo y puntos de corte sugeridos.
- **Shotlist** → input para `05-captura-pantalla`: lee cursor/highlight
  declarado y props requeridos antes de grabar. Para
  `04-escenas`, cada demo es una escena mapeable.
- **Referencias visuales** → input para `04-escenas`: intención estética
  por bloque, composición de fuentes acorde a la referencia citada.

**Cuando NO existe el Production Brief** (usuario saltó previsualización
o es un flujo antiguo), proceder autónomamente como siempre. No bloquear
ni insistir; el skill es funcional con o sin brief.

**Integración read-only.** Este skill nunca modifica el Production Brief;
solo lo referencia. Si durante la grabación surge un cambio (nueva toma,
nuevo orden), se anota en **Notas de Producción** de este plan, no
edita el brief.

**NO leer pilares completos en runtime.** Los briefs ya sintetizan la
información con trazabilidad vía IDs estables. Si durante el flujo
surge una pregunta fuera del scope de los briefs, usá `Grep` dirigido
por ID (ej. `grep "P3-preprod-audio"
docs/pilares/03-herramientas.md`), no `Read` del archivo completo.

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
GUIÓN DE REFERENCIA: [link al artefacto de guion-entrenamiento]

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
