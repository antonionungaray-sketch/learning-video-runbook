---
name: sync-briefs
description: "Use when the user wants to sync briefs after the pilares have changed, or after running update-trends / update-tools. Detects drift between briefs and pilares, guides re-sync decisions, and commits. Mantenimiento de la capa de briefs."
---

# Sincronizar briefs con pilares

Mantiene la capa de briefs (`docs/briefs/<etapa>/*.md`) sincronizada con
los pilares (`docs/pilares/0{1,2,3}-*.md`) y sus fichas asociadas en
`docs/casos-de-exito/`.

## Cuándo invocar

- Después de correr `update-trends` o `update-tools`
  (ambos flaggean al final que briefs pueden haber quedado stale).
- Después de cualquier edición manual de pilares hecha fuera de los
  skills `actualizar-*`.
- Como check periódico (mensual, trimestral) sin que haya habido un
  cambio explícito — el script detectará 0 stale y terminará rápido.

## Flujo

1. **Ejecutá el script de detección**:
   ```bash
   bash scripts/verificar-briefs.sh
   ```
   El output reporta tres contadores:
   - `Total briefs stale: N` — briefs cuya sección citada en el pilar
     fue editada después del `sync:` del brief (detección por rango
     de sección: detecta edits en contenido, no solo en el header).
   - `Total IDs no encontrados en pilar: N` — typos o IDs borrados.
   - `Total IDs inline no declarados en fuentes: N` — citas en el
     cuerpo del brief que no están en el frontmatter.

2. **Si los tres contadores dan 0:** reporta al usuario "Briefs al día"
   y termina. No commitear nada (no hay cambios).

3. **Si hay warnings de typos o inline-no-declarados:** son bugs de
   integridad, no drift real. Reporta al usuario qué briefs tienen el
   problema y pide permiso para arreglarlos directamente (añadir el
   ID a `fuentes:` del frontmatter, o corregir el typo). **Esto NO
   es re-sync — es saneamiento del brief.**

4. **Para cada brief STALE reportado:**
   - **a.** Muestra al usuario qué cambió en el pilar:
     `git log -1 -p -L <start>,<end>:<pilar_file>` con el rango
     reportado por el script (ej. `13-27`) muestra el último commit
     que tocó esa sección con diff.
   - **b.** Muestra al usuario el brief actual (al menos los bloques
     `Principio aplicable` + `Casos` + `Heurística numérica` donde
     el cambio típicamente impacta).
   - **c.** Pregunta explícitamente:
     ```
     ¿El cambio del pilar afecta este brief?
       a) Sí, editar el brief (te propongo los cambios).
       b) No, el cambio fue cosmético — solo bumpeo sync:.
       c) Diferir — dejar stale por ahora, volveré después.
     ```
   - **d.** Según la respuesta:
     - **(a) Editar:** propón los edits concretos line-by-line a
       `Principio` / `Casos` / `Heurística` / `Conflictos` afectados.
       Espera aprobación por cada edit. Al final, actualiza
       `sync: YYYY-MM-DD` al día actual. **Regla dura:** nunca editar
       un brief sin mostrar primero el diff propuesto.
     - **(b) Bumpear sync:** edita solo la línea `sync:` del
       frontmatter. Nada más.
     - **(c) Diferir:** salta este brief, no toques nada. Anota en el
       reporte final.

5. **Después de procesar todos los briefs stale:**
   - Corre de nuevo `bash scripts/verificar-briefs.sh` y verifica que
     ahora los briefs procesados ya no aparecen stale (los diferidos
     seguirán apareciendo, eso es OK).
   - Corre `bash scripts/regenerar-vistas.sh` si alguno de los briefs
     editados cambió su `pregunta:` o `fuentes:` (cambios que la vista
     derivada refleja).

6. **Commit agregado** con todos los cambios:
   ```
   Re-sync briefs tras cambios en pilares (YYYY-MM-DD)

   - <brief-X>: editado — <resumen 1 línea del cambio>.
   - <brief-Y>: sync bump (cambio cosmético en pilar).
   - <brief-Z>: diferido.
   ```
   Si solo hubo saneamiento (punto 3), usa mensaje distinto:
   ```
   briefs: saneamiento (IDs faltantes en frontmatter)
   ```

## Reglas firmes

- **Detección automática, sync manual.** El script detecta; el humano
  (guiado por ti) decide. Nunca editar un brief sin mostrar el diff
  propuesto y esperar aprobación.

- **No inventar contenido.** Los briefs sólo contienen lo que ya está
  en el pilar. Si durante el re-sync descubres información nueva que
  debería estar en el pilar pero no está, **detente** y sugiere al
  usuario invocar `update-trends` o `update-tools`
  primero.

- **Un brief por vez.** No proceses varios briefs en paralelo ni
  batch-edit — cada uno merece su pausa de revisión humana.

- **El diferir es válido.** Si el usuario no tiene tiempo o contexto
  para decidir, acepta "diferir" sin presionar. El brief seguirá
  apareciendo stale hasta que vuelva.

- **Regenerar vistas solo si cambió el frontmatter público**
  (`pregunta:` o `fuentes:`). Si el cambio fue interno (bloques del
  cuerpo), la vista derivada no cambia y no hace falta regenerar.

## Output esperado al usuario

Reporte final consolidado:

```
Sincronización de briefs — YYYY-MM-DD

Procesados: N
  Editados: [lista]
  Sync-bumped: [lista]
  Diferidos: [lista]

Saneamiento (IDs inline no declarados): [lista si aplica]

Verificación final: verificar-briefs.sh reporta
  - N-diferidos stale
  - 0 IDs no encontrados
  - 0 IDs inline no declarados

Commit: <SHA>
```
