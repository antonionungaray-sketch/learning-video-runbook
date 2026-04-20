---
name: update-tools
description: "Use when the user wants to refresh, update, or revisit the tools knowledge layer (pilar 3) of the video-explainer-guide. Busca releases, deprecations y alternativas nuevas, y actualiza el documento con aprobación del usuario. Also accepts structured payloads from setup-environment's external fallback to incorporate newly-discovered tools with full ficha metadata."
---

# Actualizar herramientas (pilar 3)

Mantenimiento del **pilar 3 — Herramientas** del toolkit. Las herramientas tecnológicas cambian rápido (releases, deprecations, alternativas emergentes cada semana).

## Chequeo previo: modo de ejecución

Este skill edita un archivo que viaja dentro del plugin (`docs/pilares/03-herramientas.md`). Si se corre sobre un plugin instalado vía marketplace, los cambios se pierden en la próxima actualización del plugin — es una skill de autor, no de consumo.

Antes de continuar, ejecuta:

```bash
if [[ -z "${CLAUDE_PLUGIN_ROOT:-}" ]] || [[ ! -d "${CLAUDE_PLUGIN_ROOT}/.git" ]]; then
  echo "INSTALLED_MODE"
else
  echo "DEV_MODE"
fi
```

Si el output es **`INSTALLED_MODE`**, detente y di al usuario:

> Este skill es para el autor del plugin `video-explainer-guide` — mantiene el catálogo de herramientas (pilar 3). Los cambios viven en el directorio de instalación (`$CLAUDE_PLUGIN_ROOT`) y se sobrescriben cuando el plugin se actualiza, así que no conviene editarlos desde acá.
>
> Si querías **usar el toolkit** para producir un video, invoca `/create-explainer`. Si querías **configurar tu perfil de herramientas locales**, invoca `/setup-environment`. Si quieres **proponer un cambio al catálogo**, abre un issue en https://github.com/antonionungaray-sketch/video-explainer-guide.

No continuar con el flujo. Terminar acá.

Si el output es **`DEV_MODE`**, continuar con el flujo normal abajo.

## Carga obligatoria

1. **Documento a actualizar**: `${CLAUDE_PLUGIN_ROOT}/docs/pilares/03-herramientas.md`. Léelo completo primero para entender qué hay y qué fechas de frescura tiene.

## Flujo

1. **Reportar el estado de frescura actual** revisando la tabla de "Frescura".

2. **Pregunta al usuario qué quiere actualizar:**
   - Una etapa específica.
   - Una herramienta concreta (ej. "actualicemos el bloque de ElevenLabs").
   - Todo el documento.

3. **Para cada sección, investiga**:
   - Releases recientes de las herramientas listadas (changelog oficial).
   - Deprecations o cambios disruptivos (cambios de pricing, EOL).
   - Alternativas emergentes (Product Hunt, Hacker News, Reddit r/videography, etc.).
   - Cambios en compatibilidad con sistemas comunes.

4. **Resume los hallazgos** estructurados como:
   - **Nuevas herramientas relevantes** (qué hacen, status, cuándo usarlas).
   - **Cambios en herramientas existentes** (versión nueva, feature relevante, breaking change).
   - **Herramientas a degradar/eliminar** (deprecated, abandonadas, reemplazadas por mejor opción).

5. **Pide aprobación item por item.** Mostrar cada cambio, esperar confirmación, aplicar solo lo aprobado.

6. **Actualiza el documento**:
   - Cada item con fecha de "última verificación" (YYYY-MM-DD).
   - Actualiza la tabla de "Frescura".
   - Mantener categorías por etapa para que las vistas por etapa puedan referenciar limpiamente.

## Reglas firmes

- **El toolkit es agnóstico de hardware.** Las herramientas deben listarse con sus requisitos generales (ej. "requiere GPU competente"), no asumir el setup específico de un usuario individual.
- **Status explícito.** Cada herramienta marca: estable / beta / cambia rápido / deprecated.
- **Cuándo elegirla.** No solo listar, sino explicar cuándo conviene esta herramienta vs alternativas.
- **No duplicar el pilar 2.** El pilar 3 lista *qué* herramientas existen y *cuándo* usarlas. El pilar 2 documenta tendencias y patrones. Si la información es "este patrón está de moda", va al pilar 2; si es "esta herramienta acaba de salir", va al pilar 3.
- **No tocar otros pilares.** Este skill solo actualiza el pilar 3.

## Cierre — verificación de briefs

Al terminar los cambios aprobados al pilar 3, ejecuta:

```bash
bash "${CLAUDE_PLUGIN_ROOT}/scripts/verificar-briefs.sh"
```

Si el output reporta **briefs stale**, es porque los cambios afectaron secciones citadas por briefs. **No editar los briefs desde acá.** Reporta al usuario la lista y sugiere:

> "Los siguientes briefs pueden haber quedado desactualizados tras los cambios al pilar 3: [lista]. Para re-sincronizarlos de forma guiada, invoca la skill `sync-briefs`."

Si 0 stale: reporta "briefs al día" y termina.

## Invocación con payload estructurado (desde fallback externo)

Cuando un skill de etapa (`record-explainer`, `edit-explainer`, `publish-explainer`) dispara su fallback externo y el usuario elige una herramienta nueva, puede invocar a este skill con un payload pre-poblado:

```yaml
payload:
  nombre: "Shotcut"
  url-oficial: "https://www.shotcut.org"
  seccion-destino: P3-edicion-editores
  plataformas: [linux, mac, windows]
  licencia: open-source
  modo: local
  hardware-min: null
  equivalentes: [kdenlive, davinci-resolve]
  contexto: "Fallback externo desde edit-explainer brief edicion/02-nle.md; perfil pedía windows + open-source y no había candidatos curados."
```

**Flujo con payload:**

1. Confirmar con el usuario los campos del payload (algunos pueden ser tentativos).
2. **Pedir los datos que faltan**:
   - Casos de uso concretos (2-3 proyectos donde encaja).
   - Cita a principio del Pilar 1 si aplica (ej. "encaja con [P1-§2.3-#8]").
   - Contraindicaciones conocidas (cuándo NO usarla).
3. **Escribir la ficha formal al Pilar 3** en la sección `seccion-destino`, con:
   - Bullet de herramienta con descripción breve.
   - Bloque `<!-- meta: <slug> -->` con todos los campos del payload.
   - Fecha de verificación: fecha de hoy.
4. **Correr verificaciones**:
   ```bash
   bash "${CLAUDE_PLUGIN_ROOT}/scripts/validar-metadata-pilar3.sh"
   bash "${CLAUDE_PLUGIN_ROOT}/scripts/verificar-briefs.sh" --strict
   ```
5. **Reportar al usuario**: "Agregada al catálogo como `<slug>` en `<seccion-destino>`. La próxima vez que un skill de etapa evalúe esa sección, la encontrará en el filtrado."
