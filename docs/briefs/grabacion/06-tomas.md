---
decision: grabacion/06-tomas
etapa: grabacion
pregunta: ¿Grabas todo de corrido en una toma, o segmentas por bloques con pausas?
fuentes:
  - P1-§2.3-#6                 # segmentación
  - P1-§1.3                    # anticipación dopaminérgica (cansancio del creador)
  - P2-preprod-patrones
  - P2-ficha-theprimeagen      # stream largo → edit down
  - P2-ficha-mouredev          # stream largo → edit down
  - P2-ficha-coding-train      # one-take live-coding
admite-variantes: true
varia-por-eje: [grado-guion, grado-edicion]
sync: 2026-04-19
version: 2
---

## Principio aplicable

**Segmentación por bloques** [P1-§2.3-#6]: grabar por segmentos alineados
con los bloques del guión permite descansar entre uno y otro, repetir
si algo falla sin perder tomas buenas, y revisar calidad antes de
seguir. Es más eficiente que descubrir en edición que una línea a mitad
de una hora de grabación tenía un problema de audio.

**Fatiga del creador** [P1-§1.3]: la calidad de la narración decae con
el tiempo. Grabar 1 hora seguida produce últimos 20 min peores que los
primeros. Pausas breves entre bloques restauran energía.

## Casos

- **Toma única (one-take) estilo live-coding** [P2-ficha-coding-train]:
  autenticidad máxima, errores visibles → self-deprecación → calidez
  humana. Requiere preparación previa (tema dominado) y audiencia que
  valore ese formato (tutorial/streaming). Tiempo de post bajo.
- **Grabación por bloques alineados con guión** (default recomendado):
  1 bloque = 1-3 tomas + pausa. Repite si algo falla. Más común en el
  atlas para videos producidos (Fireship, MoureDev, Midudev, Veritasium).
- **Stream largo → edit down** [P2-ficha-theprimeagen] [P2-ficha-mouredev]:
  4-6h de Twitch destiladas a 4-12 min de YouTube (ratio 20-30x).
  Requiere editor dedicado + audiencia previa que ya alimente el stream
  en vivo. **NO es punto de entrada** para creators nuevos
  [P2-preprod-patrones].

## Anti-patrón

**Intentar one-take sin dominar el contenido:** produce 30-40 intentos
fallidos antes de uno publicable. Por fatiga, los intentos tardíos son
peores que los primeros. Costo oculto alto.

**Grabar sin pausas en bloques largos** (>45 min sin parar):
agotamiento vocal audible en el master; errores acumulados.

**Stream → edit down como estrategia de arranque:** los creators nuevos
que lo intentan sin audiencia previa caen en loop de producción sin
publicación. Aprendizaje tácito: la monetización/engagement del stream
sostiene el esfuerzo; sin eso, se abandona.

## Heurística numérica

- **Duración ideal de bloque de grabación:** 5-15 min por bloque + 2-5
  min de pausa.
- **Intentos razonables por bloque antes de frustrarse:** 3-5. Si un
  bloque necesita 10+ intentos, el problema es el guión (reescribirlo),
  no la ejecución.
- **Video de producción vs tiempo de grabación:** ratio 1:3 a 1:8
  típico (1 min de video final = 3-8 min de grabación bruta con
  retomas).
- **Stream → edit down:** ratio 20-30x (reportado Primeagen,
  MoureDev).

## Ajuste por eje

### Por `grado-guion`

- **`guionado`:** tomas segmentadas por bloque del script; 3-8 takes por frase compleja; sesiones largas en cabina para voice-over (Nerdwriter, Kurzgesagt). El material bruto es 3-5× la duración final.
- **`semi-guionado`:** tomas por bloque con fraseo flexible; 1-2 takes por bloque. El presentador improvisa conectores dentro de un outline.
- **`improvisado`:** una sola toma continua sin reshoots. Live stream (zero cortes), podcast (1-3 takes sin recorte extensivo), conferencia grabada (1 take dictada por el evento).

### Por `grado-edicion`

- **`heavy`:** multi-take normalizado; captura overshoot del 150-250% del tiempo final. Edit selecciona el mejor take de cada frase.
- **`medium`:** 1-2 takes limpios por bloque; decisión rápida de cuál usar.
- **`light`:** 1 take maestra + coverage multi-cámara; problemas menores se aceptan. TED edit.
- **`zero`:** stream continuo; los "errores" son parte del formato y refuerzan credibilidad del demostrador.

## Conflictos conocidos

Ninguno directo. Hay tradeoff entre autenticidad (favor one-take) y
calidad técnica (favor por bloques); elección depende del contexto.

## Salida esperada

- Estrategia explícita elegida (one-take / bloques / stream→edit down)
  con justificación.
- Si bloques: plan de grabación (qué bloques, en qué orden, pausas
  previstas).
- Plan de retomas: qué hacer si un bloque falla (repetir en el
  momento / anotar y seguir / cortar en post).
