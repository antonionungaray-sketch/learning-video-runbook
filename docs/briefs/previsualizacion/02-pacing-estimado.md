---
decision: previsualizacion/02-pacing-estimado
etapa: previsualizacion
pregunta: ¿Cuánto dura cada bloque y dónde hay riesgo de sobrecarga o muerto cognitivo?
fuentes:
  - P1-§2.1                    # carga intrínseca
  - P1-§2.3-#1                 # coherencia
  - P1-§2.3-#6                 # segmentación
  - P1-§2.3-#8                 # modalidad
  - P1-§2.4                    # segmentación 6 min
  - P1-§4.4                    # frecuencia de cortes (heurística)
  - P2-ficha-fireship
  - P2-ficha-midudev
  - P2-ficha-kurzgesagt
admite-variantes: false
sync: 2026-04-18
version: 1
---

## Principio aplicable

**WPM default, lectura manual opt-in.** Duración = palabras ÷ WPM. El
WPM personal viene de `guion/07-voz-registro` si existe; si no,
benchmark por formato (ver Heurística). **No pedir lectura en voz alta
del guion completo** — doble trabajo para solo-creator. Opt-in solo
para bloques críticos (hook, cierre, pasajes densos).

**Segmentación** [P1-§2.3-#6] [P1-§2.4]: engagement cae marcadamente
pasados 6 min. Un bloque único >6 min es flag duro; video total
>10 min requiere segmentación interna clara (retrievals, open loops
resueltos).

**Compensación modalidad** [P1-§2.3-#8]: bloque con WPM <150 sin
canal visual denso es riesgo de pérdida de atención. Pacing se
evalúa contra el storyboard del brief 01, no aislado.

**Frecuencia de cortes es heurística** [P1-§4.4]: no imponer "un
corte cada 15-30s". Cadencia exacta se valida con curva de retención
propia. Se flaggean tomas estáticas largas, no como error, sino
como potencial riesgo.

## Casos

- **Fireship** [P2-ficha-fireship]: WPM ~235, bloques 30-90s, cortes
  frecuentes. Bloque >2 min sin cambio visual → flag.
- **Midudev** [P2-ficha-midudev]: WPM ~188, bloques 1-3 min. Tolera
  toma más larga si hay face-cam + screen share alternando.
- **Kurzgesagt** [P2-ficha-kurzgesagt]: WPM ~150, bloques 30-60s con
  animación continua. WPM bajo sostenido por canal visual denso
  [P1-§2.3-#8].

## Anti-patrón

**Cronometrar el guion completo en voz alta.** Doble lectura. WPM
calculado es ~85% tan preciso para planeación.

**Ignorar el WPM personal de guion/07-voz-registro.** Si el usuario
ya lo declaró, manda. El 150 default es último recurso.

**Evaluar pacing sin mirar storyboard.** Un bloque denso de 1 min
con WPM alto cabe matemáticamente, pero si el brief 01 no lo
sostiene visualmente, el pacing no es viable. Evaluar juntos.

**Regla fija "corte cada 15s".** Heurística, no evidencia
[P1-§4.4]. Validar con retención si existe.

## Heurística numérica

- **WPM por formato:** tutorial técnico denso 180-240 · divulgación
  150-190 · divulgación con animación densa 140-165 · onboarding
  formativo 130-160.
- **Bloque único >6 min** → flag duro.
- **WPM <150 + bloque `camara` sin variación** → flag de riesgo.
- **Tolerancia delta vs target:** ±15%. Más allá, ajustar guion o
  bajar WPM target.

## Conflictos conocidos

- **WPM alto + storyboard denso** [P1-§2.3-#1]: hablar rápido sobre
  pantalla cargada satura memoria de trabajo [P1-§2.1]. Flag: bajar
  WPM target o simplificar storyboard.
- **Bloque `b-roll` con WPM alto + animación densa:** ambos canales
  compiten. Pilar 1 (modalidad) gana: bajar un canal.

## Salida esperada

Timeline por bloque:

```
BLOQUE N — <título>
  Palabras: <N>
  WPM usado: <personal / 150 / 180 / …>
  Duración estimada: <min:seg>
  Método: <calculado | opt-in lectura manual>
  Ajuste usuario: <+/- Xs y razón, o ninguno>
  Flags: <ej. "supera 6min", "WPM bajo sin compensación visual">
```

Al final: **duración total estimada** y **delta vs target**. Si delta
>15%, señalar: recortar guion o aceptar duración real.
