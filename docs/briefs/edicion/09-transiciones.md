---
decision: edicion/09-transiciones
etapa: edicion
pregunta: ¿Qué transición aplicar entre bloques del crudo, cuándo usar corte seco, y cuándo re-grabar porque falta setup?
fuentes:
  - P1-§2.3-#1                 # coherencia
  - P1-§2.3-#6                 # segmentación
  - P1-§4.4                    # frecuencia de cortes (heurística)
  - P2-edicion-patrones
  - P2-edicion-antipatrones
  - P2-ficha-fireship
  - P2-ficha-kurzgesagt
  - P3-edicion-editores
admite-variantes: true
varia-por-eje: []
sync: 2026-04-20
version: 2
---

## Principio aplicable

**Transición como función de segmentación** [P1-§2.3-#6]: el cambio
entre bloques es una señal cognitiva — "cerraste una unidad, empieza
otra". El corte seco ya cumple ese rol en 90% de los casos; las
transiciones animadas se justifican solo cuando aportan más que un
corte.

**Coherencia** [P1-§2.3-#1]: cada transición aplicada suma carga
extraña si no tiene función. La pregunta previa a elegir animación es
"¿qué pasa si uso corte seco?". Si la respuesta es "nada malo", usar
corte seco.

**Qué NO es post:** zooms, PiP, cambios de ángulo, cut-away a b-roll
pre-grabado viven en `previsualizacion/04-requisitos-captura` como
escenas OBS. Si el crudo no tiene la segunda escena, este brief no
puede rescatar — se re-graba o se acepta la limitación.

## Casos

- **Corte seco** [P2-ficha-fireship] [P2-edicion-patrones]: default
  universal. Ritmo alto, respeta atención, cero carga extraña. 90% de
  las transiciones en tutoriales técnicos y explainers.
- **Cross-dissolve (0.3-0.5s)** [P2-ficha-kurzgesagt]: cambio de
  escena narrativa mayor (fin de capítulo, salto temporal). Suaviza
  sin distraer. Evitar por debajo de 200ms (no se percibe) o arriba
  de 800ms (se siente lento).
- **Match cut** [P2-edicion-patrones]: dos tomas con composición
  similar cortadas duro — pasa como transición conceptual. Requiere
  planning en previsualización; no improvisable en edición.
- **J-cut / L-cut de audio** [P2-edicion-patrones]: el audio del
  bloque siguiente entra antes que su video (J), o el audio del
  bloque anterior sigue bajo el video nuevo (L). Efecto de
  continuidad sin cortar imagen.

## Anti-patrón

**Transiciones decorativas por default (whoosh, glitch, spin, cube)**
[P2-edicion-antipatrones]: violan coherencia [P1-§2.3-#1], añaden
carga extraña, y envejecen mal. Default del editor ≠ default correcto.

**Cross-dissolve entre cada bloque.** Convierte la segmentación
cognitiva en soup visual [P1-§2.3-#6]. Usar con parsimonia.

**"Arreglar en post" un zoom que no se grabó.** El zoom digital en
1080p degrada; en 1440p/4K suma trabajo y aún se nota. Si falta la
escena OBS, re-grabar o aceptar la toma sin zoom. No ocultarlo con
una transición elaborada.

## Heurística numérica

- **Duración del corte:** 0s (duro) por default; 300-500ms cross-dissolve
  solo en cambio narrativo mayor.
- **Transiciones animadas por video:** ≤2, y solo si cumplen función
  explícita (open loop, cambio de capítulo).
- **Frecuencia de cortes:** derivada de `edicion/01-pacing`, no se
  decide aquí [P1-§4.4].

## Conflictos conocidos

- **Preferencia de marca por transiciones animadas vs coherencia.**
  Creador que vio que "los canales grandes usan whooshes" quiere
  replicarlo. Flag: los canales maduros usan cortes duros con
  identidad visual en otros lados (tipografía, color, música), no
  en transiciones [P2-edicion-patrones].

## Salida esperada

Lista por video:

```
TRANSICIONES APLICADAS
  B1→B2: corte seco
  B2→B3: cross-dissolve 400ms  (cambio de capítulo)
  B3→B4: J-cut audio B4 -300ms
NO POST-PRODUCIBLES (resueltas en captura):
  B2 zoom→zoom-cli: escena OBS F2
  B4 cut-away: b-roll-02.mp4
```

Validación: ¿cada transición no-dura tiene función? Si no, reemplazar
por corte seco.
