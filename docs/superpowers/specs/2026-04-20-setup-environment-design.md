# Spec — Portabilidad del plugin `video-explainer-guide` vía perfil de entorno

**Fecha:** 2026-04-20
**Topic:** `setup-environment` + renombrado de skills de mantenimiento

## Context

El plugin `video-explainer-guide` (Claude Code, skills-only) recomienda herramientas concretas para cada etapa de producción de videos explainer (grabación, edición, publicación, etc.). El Pilar 3 (`docs/pilares/03-herramientas.md`) lista ~66 herramientas organizadas por etapa, pero declarativamente se asume "hardware-agnostic" sin metadata estructurada de plataforma: solo 4 menciones explícitas de OS en todo el documento, y únicamente `docs/briefs/grabacion/05-captura-pantalla.md` segmenta recomendaciones por OS en texto libre.

Cuando Antonio instala el plugin en otra máquina (ej. Windows o macOS), las recomendaciones que salen de los skills de etapa asumen implícitamente su setup actual (Linux). Herramientas como OBS Studio, ffmpeg o DaVinci Resolve sí son cross-platform, pero otras (iMovie, Final Cut, Camtasia, ScreenFlow, Mouseposé) no — y el plugin no lo refleja de manera estructurada.

**Objetivo:** dar al usuario un comando re-invocable que establezca un perfil de su entorno (OS, preferencias, hardware, restricciones, herramientas ya elegidas), que los skills de etapa leen para filtrar recomendaciones, con fallback a búsqueda externa cuando el catálogo curado no tenga equivalente para su entorno. El resultado es un plugin que se "siente portable": el usuario configura una vez por máquina, el plugin se adapta.

**Decisión de scope colateral:** aprovechar el proyecto para alinear los 3 skills de mantenimiento interno (`actualizar-herramientas`, `actualizar-tendencias`, `sincronizar-briefs`) con la convención del ecosistema de Claude Code (slugs del plugin en inglés técnico), migrándolos a `update-tools`, `update-trends`, `sync-briefs`.

## Arquitectura y componentes

### 1. Skill nuevo: `setup-environment`

Ruta: `skills/setup-environment/SKILL.md`.

**Propósito:** construir y actualizar el perfil de entorno del usuario vía diálogo conducido por el agente.

**Comportamiento:**
- Re-invocable. En primera pasada introduce el concepto y hace preguntas en orden: OS → preferencias (open-source vs. paid, local vs. cloud) → restricciones (licencia corporativa, conectividad, idioma UI) → hardware (RAM, GPU, mic, cámara, resolución monitor, tableta gráfica) → herramientas ya elegidas por etapa.
- En re-invocaciones muestra el perfil actual, ofrece re-ejecutar solo las secciones que el usuario elija (ej. "solo actualizar hardware").
- Cuando un dato es verificable, le pide a Claude Code correr el comando apropiado al OS del usuario (`uname -a` / `systeminfo` / `wmic cpu get name` / `sysctl hw.memsize`). **Ningún script OS-específico se empaqueta con el plugin** — Claude Code se adapta al entorno del usuario.
- Al cerrar, escribe el perfil al archivo correspondiente y muestra un resumen.

**Lenguaje:** español de México (contenido, prosa del skill, preguntas al usuario). Slug en inglés técnico (`setup-environment`) consistente con la convención del ecosistema.

### 2. Perfil de entorno: archivos

**Global por máquina:** `~/.claude/video-explainer/profile.md`
**Override por proyecto (opcional):** `./video-explainer-profile.md` en la raíz del repo del usuario

**Formato:** markdown con frontmatter YAML + cuerpo con notas libres.

**Campos del frontmatter:**
```yaml
os: linux | mac | windows | wsl
shell: bash | zsh | pwsh | cmd
ram-gb: 16
gpu: "NVIDIA RTX 3070" | null
mic: "Shure SM7B" | null
camera: "Sony A7C" | null
monitor-res: "3840x2160" | null
tablet: true | false
licencia-preferida: open-source | free-tier | paid | subscription | cualquiera
modo-preferido: local | cloud | híbrido | cualquiera
conectividad: online | offline | intermitente
idioma-ui: es | en | ambos
herramientas-por-etapa:
  concepto: []
  guion: [Notion, Obsidian]
  grabacion: [OBS, Shure-SM7B]
  edicion: [DaVinci-Resolve, Whisper]
  publicacion: [YouTube-Studio]
restricciones-libres:  # texto libre; el skill las muestra al usuario al filtrar pero NO filtra automáticamente por ellas
  - "Sin software con telemetría"
  - "Licencia corporativa Adobe disponible"
actualizado: 2026-04-20
version: 1
```

**Merge de override:** el override por proyecto gana **campo por campo**, no reemplaza el archivo completo. Ej. si el global dice `licencia-preferida: open-source` y el override del proyecto dice `licencia-preferida: subscription`, en ese proyecto gana subscription; los demás campos (RAM, GPU, etc.) siguen viniendo del global.

**Persistencia:**
- Global en `~/.claude/` — no se commitea a ningún repo.
- Override por proyecto — el usuario decide si lo commitea (útil para colaboración cross-OS).

### 3. Pilar 3 enriquecido con metadata estructurada

Archivo: `docs/pilares/03-herramientas.md`.

**Cambio:** cada herramienta listada (~66 entries) recibe un bloque de metadata estructurada al pie de su sección. Los IDs estables existentes (`[P3-edicion-nle]`, `[P3-grabacion-captura]`, etc.) **no cambian** — el contrato de citas desde briefs se preserva.

**Campos por herramienta:**
```yaml
plataformas: [linux, mac, windows, wsl, cloud]
licencia: open-source | free-tier | paid | subscription
modo: local | cloud | híbrido
hardware-min:  # opcional; solo cuando importa
  gpu: "any discrete" | "NVIDIA CUDA" | null
  ram-gb: 8
equivalentes: [P3-<otra-tool>, ...]  # mapeo explícito a equivalentes cross-OS
```

**Formato:** bloque al final de cada sección de herramienta, con marcador `<!-- meta -->` para que el script de verificación pueda ubicarlo. Ejemplo:

```markdown
### DaVinci Resolve [P3-edicion-nle-davinci]
NLE profesional con capas de color, audio (Fairlight), VFX (Fusion)...
<!-- meta -->
plataformas: [linux, mac, windows]
licencia: free-tier  # también hay Studio paid
modo: local
hardware-min:
  gpu: any discrete
  ram-gb: 16
equivalentes: [P3-edicion-nle-premiere, P3-edicion-nle-fcp, P3-edicion-nle-kdenlive]
```

### 4. Skills de etapa modificadas

Se agrega un **Paso 0.5** (después de leer Concept/Production Brief, antes de recorrer decisiones) a los 4 skills siguientes:

- `skills/concept-explainer/SKILL.md`
- `skills/record-explainer/SKILL.md`
- `skills/edit-explainer/SKILL.md`
- `skills/publish-explainer/SKILL.md`

**Paso 0.5 — leer perfil de entorno:**
1. Intentar leer `~/.claude/video-explainer/profile.md`.
2. Intentar leer `./video-explainer-profile.md` en el cwd del usuario.
3. Si existen ambos, mergear por campo (override por proyecto gana).
4. Si no existe ninguno → mostrar 1 mensaje: "no tienes perfil de entorno configurado; invoca `setup-environment` para adaptar recomendaciones a tu setup. Sigo con recomendaciones generales." y continuar sin filtrado.

**En cada decisión que cite `[P3-<tool>]`:**
1. Extraer herramientas candidatas del brief.
2. Filtrar por perfil: `os ∈ plataformas` + `licencia-preferida` compatible + `modo-preferido` compatible + `hardware-min` ≤ perfil-reported.
3. Si quedan ≥ 1 → proponer con cita trazable (igual que hoy).
4. Si quedan 0 → disparar fallback externo (siguiente sección).

**Skills que NO se modifican:** `script-explainer` y `storyboard-explainer` no recomiendan herramientas de forma material (trabajan con texto/bocetos). `create-explainer` solo agrega una mención sugerida a `setup-environment` como paso opcional pre-flujo.

### 5. Fallback externo — cuando el filtrado deja 0 candidatos

**Flujo:**
1. El skill de etapa construye una query estructurada combinando: la categoría de la herramienta (del ID de Pilar 3), el campo `equivalentes:` de las herramientas filtradas fuera, y parámetros del perfil (OS + licencia + modo + restricciones).
2. Invoca `WebSearch` con esa query.
3. Parsea los resultados, filtra ruido (prefiere resultados oficiales del desarrollador, wikis, comparativas conocidas).
4. Presenta 2-3 candidatos al usuario con bullets: nombre, URL oficial, ajuste al perfil, riesgo/limitación conocida.
5. El usuario elige 1 o rechaza todos (en cuyo caso el skill flagea el gap y sigue con la decisión siguiente sin recomendación).
6. Si elige 1 → el skill ofrece invocar `update-tools` pasándole un payload estructurado con lo descubierto. `update-tools` abre su flujo normal de creación de ficha (cita a Pilar 1 si aplica + casos + contraindicaciones + frontmatter completo con la metadata nueva) y agrega la herramienta al Pilar 3 con ID nuevo estable.
7. La próxima invocación del mismo brief encontrará la herramienta en el catálogo.

**Sin acceso a WebSearch** (el tool falla, no devuelve resultados, o el usuario tiene `conectividad: offline` en su perfil): el skill muestra mensaje explícito "no hay equivalente curado y no tengo búsqueda externa disponible — ¿quieres nombrar tú una herramienta?". Si el usuario la nombra, ofrece invocar `update-tools` con lo que aportó el usuario.

### 6. Renombrado de skills de mantenimiento

Aprovechando el proyecto para alinear toda la capa de mantenimiento con la convención de slugs en inglés:

| Antes | Después |
|---|---|
| `skills/actualizar-herramientas/` | `skills/update-tools/` |
| `skills/actualizar-tendencias/` | `skills/update-trends/` |
| `skills/sincronizar-briefs/` | `skills/sync-briefs/` |

**Impactos a migrar:**
- Carpetas y archivos `SKILL.md` adentro: renombrar carpeta.
- Referencias cruzadas entre skills (ej. el skill `update-tools` sugiere invocar `sync-briefs` al final; `update-trends` idem).
- Referencias en `CLAUDE.md` (varios párrafos).
- Referencias en `ROADMAP.md` y otros docs del repo.
- `.claude-plugin/plugin.json` y `marketplace.json` — bump de version (a 1.2.0) y cualquier referencia explícita.
- `MEMORY.md` en memoria global del usuario — actualizar menciones si las hay.
- Hooks configurados en `.claude/settings.json` — ninguno usa estos skills por nombre, pero auditar.

**Contenido de los skills renombrados:** la prosa interna permanece en **español de México** (igual que hoy). Solo cambia el slug/carpeta. El principio: slugs en inglés, contenido en español.

### 7. Cambios menores en `update-tools` (ex `actualizar-herramientas`)

Además del renombrado, `update-tools` acepta invocación con **payload estructurado** desde el fallback externo de los skills de etapa, para cerrar el ciclo de "descubrir → persistir":

- Nombre propuesto de la herramienta
- URL oficial
- Categoría/etapa destino (ID del Pilar 3 donde va)
- Plataformas, licencia, modo, hardware-min (candidatos)
- Contexto: desde qué brief y por qué se dispara el fallback

El skill recibe el payload, pide al usuario datos que falten (casos de uso, cita a principio de Pilar 1 si aplica, contraindicaciones), y escribe la ficha completa al Pilar 3 con ID nuevo estable.

## Edge cases cubiertos

- **Perfil desactualizado (>6 meses):** `setup-environment` en re-invocación compara `actualizado:` con fecha actual y ofrece re-validar secciones sensibles al tiempo (hardware, herramientas por etapa).
- **Herramienta declarada en `herramientas-por-etapa` del perfil pero no existe en Pilar 3:** `setup-environment` avisa y ofrece invocar `update-tools` para agregarla con ficha formal.
- **Conflicto entre global y override por proyecto:** merge campo por campo, no reemplazo completo.
- **Scope filter negativo (proyecto fuera de scope — vlog, gameplay):** `create-explainer` lo detecta y saltea la lectura de perfil; no se invocan los skills de etapa afectados.
- **Usuario sin perfil:** aviso informativo una vez al arrancar un skill de etapa, no bloqueante.
- **Query de WebSearch no devuelve resultados útiles:** skill presenta los 2-3 mejores igual con nota de baja confianza, o si todo es irrelevante, flagea el gap al usuario y sigue.

## Out of scope explícito (YAGNI)

- Múltiples perfiles nombrados por máquina (corporativo / personal / freelance). Un global + override por proyecto cubre >80% de los casos. Si se necesita después, se agrega.
- Verificación activa de que las herramientas declaradas en el perfil están realmente instaladas (ej. correr `which ffmpeg`). El perfil es declarativo; el plugin confía.
- Sincronización multi-máquina del perfil global (ej. vía Git). Manual por ahora.
- Modificar briefs para que cada uno declare su propia tabla de `equivalentes-por-plataforma`. La metadata vive en Pilar 3; los briefs siguen citando por ID. Excepción preexistente: `docs/briefs/grabacion/05-captura-pantalla.md` ya tiene segmentación inline por OS y se mantiene como está.
- Scripts de auto-detección empaquetados con el plugin. Se delega a Claude Code correr comandos apropiados al OS del usuario dentro del diálogo.
- Internacionalización del perfil más allá de español/inglés. Nombres de campos y prosa en español de México; valores arbitrarios.

## Archivos críticos a modificar/crear

**Crear:**
- `skills/setup-environment/SKILL.md`
- Template interno del perfil (referenciado desde el skill, no un archivo standalone distribuible)

**Modificar:**
- `docs/pilares/03-herramientas.md` — agregar bloques `<!-- meta -->` a las ~66 herramientas
- `skills/concept-explainer/SKILL.md` — agregar Paso 0.5 + lógica de filtrado y fallback
- `skills/record-explainer/SKILL.md` — idem
- `skills/edit-explainer/SKILL.md` — idem
- `skills/publish-explainer/SKILL.md` — idem
- `skills/create-explainer/SKILL.md` — mencionar `setup-environment` como paso opcional pre-flujo
- `CLAUDE.md` — actualizar nombres de skills renombrados y documentar `setup-environment` + perfil de entorno
- `.claude-plugin/plugin.json` + `.claude-plugin/marketplace.json` — bump a 1.2.0

**Renombrar (carpetas):**
- `skills/actualizar-herramientas/` → `skills/update-tools/` (+ modificaciones internas para aceptar payload)
- `skills/actualizar-tendencias/` → `skills/update-trends/`
- `skills/sincronizar-briefs/` → `skills/sync-briefs/`

**Referenciados/auditados (pueden requerir ajustes textuales):**
- `ROADMAP.md`
- `scripts/verificar-briefs.sh` — auditar si cita nombres de skills; probablemente no lo hace pero confirmar
- `scripts/hook-verificar-pilares.sh` — idem

## Verificación end-to-end

1. **Smoke test del skill nuevo:**
   - Invocar `setup-environment` en una máquina Linux (la de Antonio). Completar el diálogo. Verificar que escribe `~/.claude/video-explainer/profile.md` con frontmatter válido.
   - Re-invocar `setup-environment`. Verificar que lee el perfil, muestra resumen, ofrece actualizar sólo secciones pedidas.

2. **Integración con skill de etapa:**
   - Crear un override mínimo en `./video-explainer-profile.md` con `os: windows` y `licencia-preferida: paid`.
   - Invocar `edit-explainer` en un proyecto mock. Verificar que el Paso 0.5 lee ambos perfiles, mergea correctamente, y filtra las recomendaciones de briefs (ej. Kdenlive/DaVinci libres → Premiere/Camtasia paid).

3. **Fallback externo:**
   - Simular un perfil con combinación rara (ej. Windows + sin GPU + open-source only). Verificar que al menos 1 decisión dispara fallback, que presenta 2-3 candidatos, y que ofrece invocar `update-tools` si el usuario elige.

4. **Metadata de Pilar 3:**
   - Correr `scripts/verificar-briefs.sh --strict`. Debe pasar sin warnings nuevos (IDs estables preservados).
   - Correr `scripts/regenerar-vistas.sh`. Debe regenerar vistas sin romper nada.
   - Verificar manualmente 5-10 herramientas representativas (OBS, DaVinci, Premiere, Whisper, Descript, Camtasia, ffmpeg) tienen metadata coherente.

5. **Renombrado de skills:**
   - Invocar `update-tools`, `update-trends`, `sync-briefs` por sus nombres nuevos. Deben funcionar igual que antes.
   - Grep en el repo por `actualizar-herramientas`, `actualizar-tendencias`, `sincronizar-briefs` — debe devolver 0 hits (salvo changelog histórico).
   - Verificar que `create-explainer` y demás skills que citaban los nombres viejos ahora citan los nuevos.

6. **Plugin packaging:**
   - Bump de version en `plugin.json` y `marketplace.json` a 1.2.0.
   - Sanity check que el plugin carga sin errores en Claude Code.

7. **Regression sanity:**
   - Correr un flujo completo de `create-explainer` → `concept-explainer` → `script-explainer` → `edit-explainer` → `publish-explainer` con un perfil simple. Verificar que todo el flujo completa sin regresiones.

## Plan de implementación (a detallar con writing-plans)

El spec es autocontenido pero la implementación se beneficia de un plan que ordene las fases:

1. **Fase A — Renombrado de skills de mantenimiento.** Bajo riesgo, alto valor de limpieza. No depende de nada más.
2. **Fase B — Metadata estructurada en Pilar 3.** Pre-requisito de toda la capa de filtrado. Trabajo mecánico pero extenso (~66 entries).
3. **Fase C — Skill `setup-environment` y formato del perfil.** Independiente de skills de etapa; el usuario ya puede construir perfil aunque las skills aún no lo lean.
4. **Fase D — Integración en skills de etapa (Paso 0.5 + filtrado + fallback).** Depende de A, B, C. Aquí entra la lógica de WebSearch.
5. **Fase E — Ampliación de `update-tools` para aceptar payload estructurado.** Cierra el ciclo de descubrimiento.
6. **Fase F — Documentación, verificación E2E, bump de version.**

El plan detallado por tarea, con dependencies cruzadas, criterios de done y subagents a dispatchar, lo produce el skill `writing-plans` tras aprobar este spec.
