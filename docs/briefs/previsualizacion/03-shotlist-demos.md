---
decision: previsualizacion/03-shotlist-demos
etapa: previsualizacion
pregunta: ¿En qué orden ejecutable y con qué props se graba cada demo de pantalla?
fuentes:
  - P1-§2.3-#5                 # contigüidad temporal
  - P1-§2.3-#7                 # pre-entrenamiento
  - P1-§4.2                    # guía de mirada (cursor)
  - P2-ficha-fireship
  - P2-ficha-midudev
  - P2-ficha-coding-train
admite-variantes: false
sync: 2026-04-18
version: 1
---

## Principio aplicable

**Contigüidad temporal** [P1-§2.3-#5]: narración y acción simultáneas.
Sin shotlist, el creador improvisa clicks y desfasa; edición no rescata
sin re-dubbing.

**Pre-entrenamiento** [P1-§2.3-#7]: cada demo asume estado inicial
(archivos, datos, UI). Sin documentación explícita, falla en vivo o
queda inconsistente entre tomas.

**Cursor como guía de mirada** [P1-§4.2]: registrar cursor visible u
oculto, con o sin highlight. Input para `grabacion/05-captura-pantalla`
cuando consume el Production Brief.

## Auto-skip

Se salta si el brief `01-storyboard-y-referencias` no marcó ningún
bloque como `demo-pantalla` ni `mixto`. El Production Brief registra
**"N/A — video sin demos"**. Para añadir una demo, volver al brief 01.

## Casos

- **One-take sin fallbacks** [P2-ficha-fireship]: props pre-cargados,
  editor limpio, comandos ya en clipboard como backup. Si algo falla,
  corta y re-graba la demo entera.
- **Por pasos con checkpoints** [P2-ficha-midudev]: checkpoint cada
  30-60s (verificación visible: log, UI, test verde). Permite retomar
  desde checkpoint sin re-grabar todo.
- **Live-coding continuo** [P2-ficha-coding-train]: shotlist
  minimalista — solo estado inicial + objetivo final. Camino improvisa
  en vivo; errores quedan como contenido. Válido solo si el formato
  tolera errores visibles.

## Anti-patrón

**Sin estado inicial declarado.** Re-grabar con estado distinto
produce inconsistencia entre tomas. Siempre declarar archivos,
datos, versión.

**Orden de clicks no especificado.** "Abre el menú y dale a exportar"
deja improvisar — cursor pasea, narración desfasa. Declarar numerado:
1. File → 2. Export → 3. PDF.

**Sin fallback.** Demo de 2 min que falla al 1:30 obliga re-grabar
todo. Checkpoint a 0:45 = re-grabar solo 45s.

**Props externos sin offline-plan.** Demo dependiente de API caída
= grabación perdida. Declarar fallback (dataset local, mock, cache).

## Heurística numérica

- **Pasos por demo:** 3-8 atómicos. >10 = segmentar.
- **Checkpoint cada:** 30-60s. Menos, overhead; más, pérdida grande
  si falla.
- **Estado inicial:** 3-5 ítems (archivo abierto, datos, UI en tab X).
  Si >10, la demo es demasiado compleja — simplificar.

## Conflictos conocidos

- **Demo pulida vs auténtica.** Shotlist exhaustivo produce demo
  "artificial"; live-coding con errores se siente auténtico pero
  compromete pacing. Sin ganador universal; flag al usuario para
  elección consciente.

## Salida esperada

Una entrada por bloque `demo-pantalla` o `mixto`:

```
DEMO (bloque N) — <título>
  Estado inicial: <archivo abierto | datos/mock | versión crítica>
  Props: <archivos auxiliares, clipboard, snippets pre-escritos>
  Pasos (orden exacto):
    1. <acción → efecto esperado>
    2. …
  Checkpoint(s): <paso N: verificación visible>
  Cursor: <visible | oculto | con highlight>
  Fallback: <retomar desde checkpoint | re-grabar | narrar y seguir>
  Dependencias externas: <ninguna | API X con plan offline: …>
```

Diseñado para leer DURANTE la grabación (lista impresa o panel
lateral abierto), no documento con scroll.
