---
name: actualizar-tendencias
description: "Use when the user wants to refresh, update, or revisit the trends and success cases knowledge layer (pilar 2) of the training video toolkit. Busca novedades en fuentes definidas, resume y actualiza el documento con aprobación del usuario."
---

# Actualizar tendencias y casos de éxito (pilar 2)

Mantenimiento del **pilar 2 — Tendencias y casos de éxito** del toolkit. Este pilar caduca rápido (semanas/meses), por eso necesita revisiones periódicas.

## Carga obligatoria

1. **Documento a actualizar**: `docs/pilares/02-tendencias-y-casos.md`. Léelo completo primero para entender qué hay y qué fechas de frescura tiene.

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

Al terminar los cambios aprobados al pilar 2, ejecutá:

```bash
bash scripts/verificar-briefs.sh
```

Si el output reporta **briefs stale**, es porque los cambios afectaron secciones citadas por briefs. **No editar los briefs desde acá.** Reportá al usuario la lista y sugerí:

> "Los siguientes briefs pueden haber quedado desactualizados tras los cambios al pilar 2: [lista]. Para re-sincronizarlos de forma guiada, invocá la skill `sincronizar-briefs`."

Si 0 stale: reportá "briefs al día" y terminá.
