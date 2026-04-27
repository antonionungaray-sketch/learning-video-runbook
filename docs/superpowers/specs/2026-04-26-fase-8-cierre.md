# Cierre de Fase 8 — Material didáctico no-video

**Fecha de cierre de implementación:** 2026-04-26
**Versión resultante:** 1.4.0
**Estado:** implementación completa, smoke tests humano-en-loop pendientes
**Branch:** `main`
**Push al remoto:** pendiente (push manual del usuario por convención del repo)

---

## Qué se construyó

La Fase 8 amplía `video-explainer-guide` para producir, además de video explainer, **material didáctico no-video**: láminas didácticas secuenciales (estilo libro de historia ilustrado), slides para presentar en vivo (formato Marp), y long-form escrito con visualizaciones embebidas. El disparador concreto fue un set de 9 láminas sobre "El origen del yoga" que el usuario generó con un prompt curado a mano y resultó muy efectivo; esta fase sistematiza ese trabajo.

### Componentes nuevos

| Componente | Ubicación | Tamaño / contenido |
|---|---|---|
| Skill nueva | `skills/material-explainer/SKILL.md` | 371 líneas. Standalone (no invoca `concept-explainer`). Paso 0 mini Concept Brief (4 preguntas) → Paso 1 generar Didactic Brief con gate de lock → Paso 2 materializar en uno o varios formatos. |
| 7 briefs nuevos | `docs/briefs/material/01-...07-*.md` | 69-116 líneas cada uno. Frontmatter completo, ≥5 citas inline al Pilar 1, contrato del repo. |
| 5 presets de estilo | en `docs/briefs/material/05-estilo-visual-coherencia.md` | `historico-grabado`, `tecnico-flat`, `cientifico-informativo`, `narrativo-comic`, `editorial-periodico`. Cada uno como meta-prompt verbatim. |
| Vista regenerada | `docs/vistas-por-etapa/material.md` | Auto-generada por `regenerar-vistas.sh`. |
| Bifurcación | `skills/create-explainer/SKILL.md` | Pregunta inicial "video o material estático" antes del flujo de etapa de video. |
| Script extension | `scripts/regenerar-vistas.sh:14` | Una línea: `material` agregado al array `ETAPAS`. |

### Componentes actualizados (meta-docs)

- `CLAUDE.md` — sección "Skills layout" + sección "Layer 2 — Briefs" (43 → 50 briefs).
- `ROADMAP.md` — fila "Fase 8" en la tabla + sección detallada al cierre del v2.
- `CHANGELOG.md` — entrada `[1.4.0]` con detalle completo (añadido / cambiado / notas técnicas / verificación).
- `.claude-plugin/plugin.json` — bump 1.3.3 → 1.4.0.
- `.claude-plugin/marketplace.json` — bump 1.3.0 → 1.4.0 (estaba desfasado).
- `README.md` — descripción ahora cubre las dos familias (video + material), árbol de skills incluye `material-explainer`, sección "Uso" agrega ejemplos para detonar el flujo de material.
- `docs/onboarding/guia-rapida.md` — agrega "los dos pipelines" (video + material), agrega Didactic Brief al patrón de briefs lockeables, separa skills directos por flujo.

### Memoria del proyecto

- `~/.claude/projects/-home-antonio-Proyectos-local-video-explainer-guide/memory/project_fase_8_material_cerrada.md`
- `MEMORY.md` actualizada con pointer.

---

## Decisiones tomadas durante la implementación

### Versionado

El plan original asumía v1.2.0 → 1.3.0. Al ejecutar descubrí que el plugin ya estaba en **1.3.3** (hubo trabajo entre fase 7 y ahora: cleanup de rioplatense en 1.3.1/1.3.3, enriquecimiento de pilares en 1.3.2, fixes en 1.3.x). Decisión: bump real a **1.4.0** (minor por feature nueva). `marketplace.json` estaba desfasado en 1.3.0; lo alineé a 1.4.0 en el mismo commit.

### Drift pre-existente

`verificar-briefs.sh --strict` reportaba 8 briefs stale al inicio (no relacionados con Fase 8 — eran del trabajo previo del 2026-04-23 sin sincronizar). Se agruparon en 3 cambios distintos del pilar:

| Cambio del pilar | Briefs afectados | Acción |
|---|---|---|
| `P2-ficha-theprimeagen` (cosmético: "dale like" → "deja like") | 5 briefs | sync-bump |
| `P3-edicion-postproc` (agrega `auto-editor`) | 2 briefs | sync-bump (auto-editor no aplica a estos briefs específicos) |
| `P3-edicion-composicion` (enriquece HyperFrames) | 1 brief | sync-bump (el brief no profundiza en HyperFrames) |

Los 8 sync-bump quedaron en commit `7bd67d8` con justificación detallada.

### Ajustes al plan original

- **B1 fuentes:** agregué `P1-§6.1` (cambio conceptual) que el plan citaba inline pero no declaraba en `fuentes:`.
- **B7 fuentes:** omití la cita a `P3-IA-imagen` que el plan mencionaba — esa sección no existe en el Pilar 3. Solo cito Pilar 1.
- **Pseudo-eje `formato`:** los briefs 02/04/06 declaran `varia-por-eje: [formato]` con valores `lamina | slide | long-form`. `formato` no es uno de los 5 ejes formales del repo (que son `arco-dominante`, `objetivo-cognitivo`, `grado-edicion`, `grado-guion`, `rol-presentador`). Se aceptó como pseudo-eje ad-hoc para esta etapa porque `verificar-briefs.sh` no parsea `varia-por-eje:` (solo `fuentes:`) y los skills de video no tocan briefs de material. Follow-up: si crece su uso, formalizar como atributo separado (estilo `plataforma`) en `docs/arquitectura/modalidades-y-ejes.md`.

### Patrón de dispatch

El plan asumía subagent-driven development (un subagente por task con dos reviewers). En la práctica:

- El primer subagente para Brief B1 entró automáticamente en plan mode y no pudo ejecutar Write/Bash (probablemente por config global de la sesión).
- `SendMessage` (la herramienta para continuar un agente existente) no estaba disponible.
- Spawnear un agente nuevo con `Agent` perdía el contexto del anterior.

Decisión: **abandoné el patrón subagent-driven** a partir de B1 y ejecuté las tareas directamente como controller. Mantuve el rigor (cada brief verificado con `--strict` antes de commit) pero simplifiqué el dispatch. Documentado por si se repite en futuras sesiones con este setup.

### Limitación operativa: plugin no instalado

El plugin `video-explainer-guide` no está instalado en el Claude Code del usuario (solo lo desarrolla en `~/Proyectos_local/video-explainer-guide`). Esto significa que:

- Las skills del plugin (`/sync-briefs`, `/concept-explainer`, etc.) no son invocables como slash commands desde la sesión actual.
- Para los smoke tests de Fase E, hay que instalar el plugin localmente primero o simular el flujo manualmente.

Cuando intentamos correr `sync-briefs` para limpiar el drift, esto se manifestó: terminé simulando el flujo del SKILL.md manualmente en lugar de invocar la skill.

---

## Verificación realizada

Antes de cerrar la sesión:

- ✅ `bash scripts/verificar-briefs.sh --strict` cierra exit 0 (0 stale, 0 IDs missing, 0 inline missing).
- ✅ `bash scripts/regenerar-vistas.sh` ejecuta sin errores; emite las 7 vistas (incluye `material.md`).
- ✅ Los 7 briefs nuevos cumplen el contrato del repo: frontmatter válido, ≥5 citas inline a IDs declarados en `fuentes:`, longitud entre 69-116 líneas, bloques fijos completos.
- ✅ `skills/material-explainer/SKILL.md` lee correctamente, frontmatter válido.
- ✅ `skills/create-explainer/SKILL.md` tiene la nueva sección "Bifurcación inicial" en el orden correcto (antes de "Flujo del orquestador (cuando es video)" y antes de "Filtro de scope").
- ✅ `git status` limpio, 17 commits nuevos en `main`.

---

## Pendientes — Fase E (smoke tests humano-en-loop)

Los 5 smoke tests requieren **el plugin instalado** y/o **juicio humano del usuario** (no se pueden simular completamente en una sesión de controller). Detalle de cada uno:

### Test 1 — Caso yoga (calibrador)

**Propósito:** verificar que el preset `historico-grabado` reproduce el estilo del set real que generó el disparador de Fase 8.

**Flujo:**
1. Invocar `/material-explainer` (con plugin instalado) o simular el SKILL.md manualmente.
2. Input: concepto "El origen del yoga: 5,000 años de evolución desde el Valle del Indo hasta el yoga moderno"; audiencia "público general adulto sin experiencia"; objetivo `orientarse`; restricciones "~15 min, autoadministrado, divulgativo"; preset `historico-grabado`.
3. Materializar como láminas → produce `prompts-laminas.md`.
4. Comparar el prompt del capítulo 1 contra la lámina real "Capítulo 1 — Antes del hinduismo: El Valle del Indo" del set existente.

**Validar:**
- ¿La secuencia de capítulos sugerida es similar (Valle del Indo → Vedas → Upanishads → ... → moderno)?
- ¿El meta-prompt de `historico-grabado` produciría una lámina con paleta sepia + ilustración tipo grabado + tipografía libro de historia?
- ¿Las cajas "concepto clave" y "para estudiar" están presentes?
- ¿La estratificación cromática por época (rojo Indo, amarillo védico, verde moderno) está capturada en el preset, o es customización que debería sugerirse en el diálogo de afinamiento del brief 05?

**Si discrepan:** ajustar el preset `historico-grabado` en `docs/briefs/material/05-estilo-visual-coherencia.md` y volver a ejecutar.

### Test 2 — Caso técnico (OAuth)

**Propósito:** verificar el preset `tecnico-flat` y la materialización a long-form + slides simultáneos.

**Flujo:**
1. Input: concepto "Cómo funciona OAuth 2.0: del problema al flujo authorization code"; audiencia "developers que solo han implementado login email+password"; objetivo `orientarse`; restricciones "~30 min, presentado en vivo + handout posterior, técnico-cercano"; preset `tecnico-flat`.
2. Materializar como **long-form + slides simultáneamente** desde el mismo Didactic Brief.
3. Comparar coherencia entre los dos formatos.

**Validar:**
- ¿Long-form y slides cubren los mismos bloques en el mismo orden con el mismo mensaje?
- ¿La diferencia entre los dos es solo densidad y tono (per brief 06), no contenido distinto?
- ¿Las speaker notes de los slides contienen prosa equivalente a los párrafos del long-form correspondiente?

### Test 3 — Caso científico (Coriolis)

**Propósito:** verificar el preset `cientifico-informativo` y el ajuste por eje `corregir-intuicion` (que debe usar predice-antes-de-ver, no quiz formal).

**Flujo:**
1. Input: concepto "Efecto Coriolis: por qué los huracanes giran en sentidos opuestos en cada hemisferio"; audiencia "público general adulto sin formación en física"; objetivo `corregir-intuicion`; restricciones "~10 min, autoadministrado, divulgativo"; preset `cientifico-informativo`.
2. Materializar como láminas → produce `prompts-laminas.md`.

**Validar:**
- ¿El bloque de retrieval (brief 04 sub-bloque `corregir-intuicion`) propone "predice-antes-de-ver" al inicio de cada bloque?
- ¿El cierre incluye contraste explícito intuición errónea vs realidad?
- ¿NO aparece quiz formal embebido?

### Test 4 — Filtro fuera-de-scope

**Propósito:** verificar que `create-explainer` rechaza correctamente casos sin intención pedagógica.

**Flujo:**
1. Input al orquestador: "Hazme un meme sobre la generación Z" (o similar).
2. Esperar respuesta.

**Validar:**
- ¿El orquestador identifica que es fuera-de-scope?
- ¿La respuesta es clara y sugiere no usar el toolkit (ver lista en `skills/create-explainer/SKILL.md` §"Filtro de scope")?
- ¿No procede a invocar `material-explainer` ni `concept-explainer`?

### Test 5 — Re-invocación con Brief locked

**Propósito:** verificar que `material-explainer` detecta correctamente el lock y pregunta antes de modificar.

**Flujo:**
1. Tomar el Didactic Brief generado en Test 1 (caso yoga) y cambiar manualmente:
   - `estado: draft` → `estado: locked`
   - `locked-at: —` → `locked-at: 2026-04-26`
2. Re-invocar `/material-explainer` en el mismo directorio.

**Validar:**
- ¿La skill detecta el lock al cargar el archivo?
- ¿Pregunta explícitamente "este brief está locked desde 2026-04-26; ¿re-abrir como `draft` o seguir directo a materializar?"?
- ¿El comportamiento posterior depende correctamente de la respuesta del usuario?

---

## Cómo retomar la sesión

Cuando vuelvas a este trabajo:

### 1. Push del trabajo local

Por convención del repo, los `git push` a `main` los haces tú manualmente desde tu terminal. Status actual del local: 17 commits ahead de `origin/main`, branch limpia.

```bash
cd ~/Proyectos_local/video-explainer-guide
git log origin/main..HEAD --oneline   # debe listar los 17 commits
git push origin main                  # cuando estés listo
```

### 2. Instalar el plugin localmente

Para invocar `/material-explainer` y los smoke tests, el plugin debe estar instalado. El comando exacto depende de la versión actual de Claude Code; típicamente:

```bash
# Verificar instalación actual
cat ~/.claude/plugins/installed_plugins.json | grep video-explainer

# Si no aparece, instalar desde el repo local (sintaxis aproximada — verificar en /plugin help)
/plugin install ~/Proyectos_local/video-explainer-guide
```

Tras instalar, las skills del plugin aparecerán en el available-skills y serán invocables como slash commands.

### 3. Ejecutar los 5 smoke tests

En orden: Test 1 (yoga calibrador) → Test 2 (OAuth técnico) → Test 3 (Coriolis científico) → Test 4 (filtro fuera-de-scope) → Test 5 (re-invocación con lock). Cada uno produce evidencia (Didactic Brief + outputs) que vale guardar en `/tmp/material-<caso>/` para revisión.

Si Test 1 revela que el preset `historico-grabado` no reproduce bien el estilo, ajustar `docs/briefs/material/05-estilo-visual-coherencia.md` y commit del fix.

### 4. (Opcional) Documentar resultados de smoke tests

Guardar los outputs y conclusiones en `docs/superpowers/specs/2026-04-26-smoke-tests-fase-8.md` para trazabilidad. Si todos pasan, marcar el todo de Fase E como completado y la fase 8 queda formalmente cerrada.

---

## Mapa de archivos referenciados

**Implementación de Fase 8 (todo en `~/Proyectos_local/video-explainer-guide/`):**

- `skills/material-explainer/SKILL.md` — skill nueva
- `skills/create-explainer/SKILL.md` — bifurcación agregada
- `docs/briefs/material/01-secuenciacion-conceptual.md`
- `docs/briefs/material/02-densidad-y-bloque.md`
- `docs/briefs/material/03-soporte-visual.md`
- `docs/briefs/material/04-retrieval-y-consolidacion.md`
- `docs/briefs/material/05-estilo-visual-coherencia.md`
- `docs/briefs/material/06-adaptacion-formato.md`
- `docs/briefs/material/07-prompts-imagen-IA.md`
- `docs/vistas-por-etapa/material.md` (auto-generada)
- `scripts/regenerar-vistas.sh` (1 línea agregada)
- `CLAUDE.md`, `ROADMAP.md`, `CHANGELOG.md`, `README.md`, `docs/onboarding/guia-rapida.md` (todos actualizados)
- `.claude-plugin/plugin.json`, `.claude-plugin/marketplace.json` (bump 1.4.0)

**Spec y plan:**

- `/home/antonio/.claude/plans/quiero-hacer-una-warm-mochi.md` — spec de brainstorming aprobado
- `docs/superpowers/plans/2026-04-26-material-explainer.md` — plan de implementación detallado (referencia para futuras fases similares)
- `docs/superpowers/specs/2026-04-26-fase-8-cierre.md` — este documento

**Memoria:**

- `~/.claude/projects/-home-antonio-Proyectos-local-video-explainer-guide/memory/project_fase_8_material_cerrada.md`
- `~/.claude/projects/-home-antonio-Proyectos-local-video-explainer-guide/memory/MEMORY.md` (pointer agregado)
