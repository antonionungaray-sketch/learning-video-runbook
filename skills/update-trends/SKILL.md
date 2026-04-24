---
name: update-trends
description: "Use when the user wants to refresh, update, or revisit the trends and success cases knowledge layer (pilar 2) of the video-explainer-guide. Busca novedades en fuentes definidas, resume y actualiza el documento con aprobación del usuario."
---

# Actualizar tendencias y casos de éxito (pilar 2)

Mantenimiento del **pilar 2 — Tendencias y casos de éxito** del toolkit. Este pilar caduca rápido (semanas/meses), por eso necesita revisiones periódicas.

## Chequeo previo: modo de ejecución

Este skill edita un archivo que viaja dentro del plugin (`docs/pilares/02-tendencias-y-casos.md`). Si se corre sobre un plugin instalado vía marketplace, los cambios se pierden en la próxima actualización del plugin — es una skill de autor, no de consumo.

Antes de continuar, ejecuta:

```bash
if [[ -z "${CLAUDE_PLUGIN_ROOT:-}" ]] || [[ ! -d "${CLAUDE_PLUGIN_ROOT}/.git" ]]; then
  echo "INSTALLED_MODE"
else
  echo "DEV_MODE"
fi
```

Si el output es **`INSTALLED_MODE`**, detente y di al usuario:

> Este skill es para el autor del plugin `video-explainer-guide` — mantiene las tendencias y casos de éxito (pilar 2). Los cambios viven en el directorio de instalación (`$CLAUDE_PLUGIN_ROOT`) y se sobrescriben cuando el plugin se actualiza.
>
> Si querías **usar el toolkit** para producir un video, invoca `/create-explainer`. Si quieres **proponer una tendencia o caso nuevo**, abre un issue en https://github.com/antonionungaray-sketch/video-explainer-guide.

No continuar con el flujo. Terminar aquí.

Si el output es **`DEV_MODE`**, continuar con el flujo normal abajo.

## Carga obligatoria

1. **Documento a actualizar**: `${CLAUDE_PLUGIN_ROOT}/docs/pilares/02-tendencias-y-casos.md`. Léelo completo primero para entender qué hay y qué fechas de frescura tiene.

## Flujo

1. **Reportar el estado de frescura actual.** Identifica qué secciones tienen más tiempo sin revisarse (revisar la tabla de "Frescura" del documento).

2. **Pregunta al usuario qué quiere actualizar:**
   - Una etapa específica (Idea→Guión, Grabación, Edición, Publicación).
   - Meta-formatos.
   - Todo el documento.

3. **Para cada sección a actualizar, busca novedades** usando WebSearch / WebFetch en las fuentes listadas al final del documento (YouTube Creator Insider, papers ACM L@S, etc.). Si el usuario sugiere fuentes adicionales, úsalas también.

4. **Resume los hallazgos** estructurados como:
   - Patrones nuevos que están funcionando (con fuente, fecha, métrica si la hay).
   - Casos de éxito recientes (creador, formato, métrica).
   - Anti-patrones nuevos (lo que dejó de funcionar y por qué).
   - Items existentes que parecen haber caducado (proponer eliminar o degradar).

5. **Pide aprobación item por item.** No actualizar el documento en bloque. Para cada cambio:
   - Mostrar el cambio propuesto (añadir / modificar / eliminar).
   - Esperar confirmación del usuario.
   - Aplicar solo lo aprobado.

6. **Actualiza el documento**:
   - Cada item nuevo o modificado lleva fecha de verificación (formato YYYY-MM-DD).
   - Actualiza la tabla de "Frescura" con la fecha de hoy para las secciones tocadas.
   - Si la fuente original cambió, actualizar también las URL.

## Reglas firmes

- **No actualizar sin verificar.** No copiar tendencias de blogs comerciales sin contrastar. Si una afirmación contradice el pilar 1 (fundamentos cognitivos), flaggearlo y NO incluirla salvo que el usuario lo apruebe explícitamente con conocimiento del conflicto.
- **Cada item con fecha.** Sin fecha no se puede saber qué está caduco.
- **Prefierir evidencia mensurable.** "Esto funciona porque tal canal lo usa y tiene X% retention" > "esto funciona según opinión de blog Y".
- **No tocar el pilar 1.** Este skill solo actualiza el pilar 2. Si el usuario pide cambiar el pilar 1, recordarle que es la capa estable y debe tener un proceso de revisión más cuidadoso (peer-review, no tendencias).

## Cierre — verificación de briefs

Al terminar los cambios aprobados al pilar 2, ejecuta:

```bash
bash "${CLAUDE_PLUGIN_ROOT}/scripts/verificar-briefs.sh"
```

Si el output reporta **briefs stale**, es porque los cambios afectaron secciones citadas por briefs. **No editar los briefs desde aquí.** Reporta al usuario la lista y sugiere:

> "Los siguientes briefs pueden haber quedado desactualizados tras los cambios al pilar 2: [lista]. Para re-sincronizarlos de forma guiada, invoca la skill `sync-briefs`."

Si 0 stale: reporta "briefs al día" y termina.
