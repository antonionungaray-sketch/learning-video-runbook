---
decision: edicion/02-senalizacion
etapa: edicion
pregunta: ¿Qué se destaca visualmente, con qué técnica, y cuándo?
fuentes:
  - P1-§2.3-#2                 # principio de señalización
  - P1-§2.3-#1                 # coherencia (señalización decorativa)
  - P1-§4.2                    # guía de mirada (gaze guidance)
  - P2-edicion-patrones
  - P2-edicion-antipatrones    # callouts redundantes
  - P2-ficha-fireship          # zoom dinámico sobre zona explicada
  - P2-ficha-coding-train      # highlight sobre código relevante
  - P2-ficha-3b1b              # color + movimiento sobre término nuevo
admite-variantes: true
varia-por-eje: [grado-edicion]
sync: 2026-04-19
version: 2
---

## Principio aplicable

**Principio de señalización** [P1-§2.3-#2]: destacar lo esencial con
flechas, contornos, color de acento o contraste tipográfico mejora la
atención selectiva. Funciona porque reduce búsqueda visual en el canal
ya cargado.

**Guía de mirada** [P1-§4.2]: el ojo sigue movimiento, caras y texto.
Técnicas como zoom dinámico sobre la zona relevante o highlight
animado guían sin pedir esfuerzo metacognitivo.

**Coherencia** [P1-§2.3-#1]: señalización decorativa (callouts "¡Mirá!",
efectos de partículas sin función) es carga extraña.

## Casos

- **Fireship** [P2-ficha-fireship]: zoom dinámico digital sobre la zona
  del editor donde aparece el código relevante. Evita pedir al viewer
  "buscá el cursor" [P2-edicion-patrones].
- **The Coding Train** [P2-ficha-coding-train]: highlight tipográfico
  (background amarillo) sobre la línea de código que está explicando
  en ese momento.
- **3Blue1Brown** [P2-ficha-3b1b]: color + movimiento conjunto sobre
  término nuevo en una ecuación. El término se ilumina en color distinto
  justo cuando Grant lo nombra (contigüidad temporal). La animación
  Manim lo hace natural.

## Anti-patrón

**Callouts "¡IMPORTANTE!" o cajas de texto redundantes con la narración**
[P2-edicion-antipatrones]: violan redundancia (#3) + coherencia (#1).
Si el narrador ya lo dijo, el texto en pantalla NO debe repetirlo
literal; a lo más, resumirlo en 2-3 palabras clave.

**Señalización permanente** (flecha que queda 30s apuntando a algo): el
sistema atencional se habitúa y la flecha deja de funcionar. Señalización
debe ser transiente (aparece, marca, desaparece).

## Heurística numérica

- **Duración de señalización dinámica:** 1-3s por callout. Más es
  habituación.
- **Densidad:** en contenido técnico denso, 1 señalización cada 10-15s.
  En divulgación con animación continua, la animación misma es la
  señalización — no agregar callouts superpuestos.
- **Colores de acento:** máximo 2-3 consistentes a lo largo del video
  (ej. amarillo = destacado positivo, rojo = error/crítico). Más
  colores = canal visual saturado.

## Ajuste por eje

### Por `grado-edicion`

- **`heavy`:** señalización planeada densa — callouts animados, zoom dinámico digital sobre zona explicada, highlight vectorial sincronizado frase-por-frase. 3-6 señalizaciones/min en formato denso (Fireship). Coherencia Mayer [P1-§2.3-#1] obliga: cada callout con función, nunca decorativo.
- **`medium`:** señalización puntual — callout en momentos clave (introducción de término, cambio de tema), sin overlay continuo. 1-2/min típicamente.
- **`light`:** señalización mínima — lower thirds para presentación de speaker + 1-2 chapter markers visibles. Sin elementos gráficos competidores con el speaker. TED, conferencia.
- **`zero`:** señalización en vivo vía escenas OBS — zoom escena, highlight del cursor, alertas. La señalización es decisión de ejecución, no post-producción.

## Conflictos conocidos

Ninguno relevante.

## Salida esperada

Lista de señalizaciones por timestamp:
- Qué se destaca (zona de pantalla o elemento específico).
- Técnica elegida (zoom dinámico / highlight tipográfico / flecha
  animada / color de acento).
- Duración de cada señalización (1-3s).
- Justificación por qué esa técnica en ese momento.
