---
name: actualizar-herramientas
description: "Use when the user wants to refresh, update, or revisit the tools knowledge layer (pilar 3) of the training video toolkit. Busca releases, deprecations y alternativas nuevas, y actualiza el documento con aprobación del usuario."
---

# Actualizar herramientas (pilar 3)

Mantenimiento del **pilar 3 — Herramientas** del toolkit. Las herramientas tecnológicas cambian rápido (releases, deprecations, alternativas emergentes cada semana).

## Carga obligatoria

1. **Documento a actualizar**: `docs/pilares/03-herramientas.md`. Léelo completo primero para entender qué hay y qué fechas de frescura tiene.

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

Al terminar los cambios aprobados al pilar 3, ejecutá:

```bash
bash scripts/verificar-briefs.sh
```

Si el output reporta **briefs stale**, es porque los cambios afectaron secciones citadas por briefs. **No editar los briefs desde acá.** Reportá al usuario la lista y sugerí:

> "Los siguientes briefs pueden haber quedado desactualizados tras los cambios al pilar 3: [lista]. Para re-sincronizarlos de forma guiada, invocá la skill `sincronizar-briefs`."

Si 0 stale: reportá "briefs al día" y terminá.
