---
decision: previsualizacion/01-storyboard-y-referencias
etapa: previsualizacion
pregunta: ¿Cómo se ve cada bloque del guion y a qué referencia visual se parece?
fuentes:
  - P1-§2.3-#2                 # señalización
  - P1-§2.3-#4                 # contigüidad espacial
  - P1-§2.3-#12                # imagen del instructor
  - P1-§3.2                    # contraste WCAG
  - P1-§4.2                    # guía de mirada
  - P1-§4.3                    # direccionalidad de lectura
  - P2-ficha-fireship
  - P2-ficha-midudev
  - P2-ficha-3b1b
  - P2-ficha-kurzgesagt
  - P3-modalidades-live        # layout OBS como storyboard en live
admite-variantes: false
varia-por-eje: [grado-edicion, grado-guion]
sync: 2026-04-20
version: 2
---

## Principio aplicable

**Contigüidad espacial** [P1-§2.3-#4]: texto y elemento visual
relacionados cerca. El storyboard fija dónde vive cada callout antes
de editar; sin plan, surge callout-arriba-código-abajo.

**Señalización** [P1-§2.3-#2]: declarar por bloque qué destacar y qué
dejar neutro. Sin plan, edición sobre-señaliza.

**Guía de mirada** [P1-§4.2]: con face-cam, fijar si el instructor
mira a cámara o al contenido. Mirada al contenido acelera transferencia.

**Direccionalidad** [P1-§4.3]: diagramas y líneas temporales
izquierda→derecha para audiencia hispano/anglo; romperlo solo con
intención declarada.

**Tipo de bloque (campo obligatorio):** `camara` | `demo-pantalla` |
`mixto` | `b-roll`. Lo lee el brief 03 para auto-skip y
`grabacion/02-video-encuadre` para pre-proponer face-cam.

## Casos

- **Fireship** [P2-ficha-fireship]: bloques casi todos `demo-pantalla`,
  cursor visible, callouts de 1-2 palabras en edición, sin face-cam.
  Storyboard = descripción textual densa del estado de pantalla +
  timestamp ancla.
- **Midudev** [P2-ficha-midudev]: mayormente `mixto`. Marca fuente
  dominante por bloque y dónde vive el PiP. Referencias por bloque a
  videos propios con timestamp.
- **3Blue1Brown** [P2-ficha-3b1b]: bloques `b-roll` Manim. Storyboard
  es guion de animación: posición, color, transición. Direccionalidad
  estricta en secuencias causales.
- **Kurzgesagt** [P2-ficha-kurzgesagt]: bloques `b-roll` isotype.
  Incluye moodboard de paleta (3-4 colores) + composición por bloque.

## Anti-patrón

**Storyboard sin tipo de bloque.** Sin ese campo, brief 03 no puede
auto-skippear y grabación no pre-propone encuadre — storyboard
decorativo en lugar de operativo.

**"Look global" sin anclaje por bloque.** Pedir paleta/ritmo al video
entero sin atar a bloques produce "ritmo ágil"/"paleta tech-forward"
— no ejecutable. Mejor vacío que vago.

**Contraste no verificado.** Si hay texto sobre fondo, declarar
combinación cromática contra WCAG 2.2 AA [P1-§3.2]: 4.5:1 cuerpo,
3:1 texto grande.

## Heurística numérica

- **Referencias por bloque:** 0–2. Más indica indecisión, no riqueza.
- **Un solo tipo por bloque.** Si "mezcla todo", marcar `mixto` y
  declarar fuente dominante.
- **Esfuerzo objetivo:** video 8 min, 5 bloques → ~15-25 min llenando
  este brief. Más es sobre-ingeniería.

## Ajuste por eje

### Por `grado-edicion`

- **`heavy`:** storyboard detallado por bloque — encuadre específico (WS/MS/CU), duración estimada, overlays previstos, transición de entrada/salida. Kurzgesagt, Nerdwriter escriben cada frame; storyboard HTML interactivo aplicable [scripts/storyboard-draft.template.html].
- **`medium`:** storyboard por secciones con encuadre genérico + notas de B-roll. Menos granular pero útil como guía de grabación.
- **`light`:** storyboard mínimo — cobertura multi-cámara + ángulos principales. El ritmo lo decide el speaker en vivo. TED, conferencia.
- **`zero`:** **no aplica** storyboard formal. Prep = escenas OBS + alertas + chat layout + Stream Deck buttons. Ver `docs/briefs/grabacion/04-escenas` y [P3-modalidades-live].

### Por `grado-guion`

- **`guionado`:** storyboard 1:1 con el guión — cada frase tiene visual asociado con timing. Permite generar draft HTML interactivo via storyboard-explainer.
- **`semi-guionado`:** storyboard por secciones/bloques (no por frase). Captura intención visual sin over-specification.
- **`improvisado`:** **no aplica** — no hay guión para storyboardear. El "storyboard" emerge post-hoc en la edición del VOD (si aplica).

## Conflictos conocidos

- **Imagen del instructor** [P1-§2.3-#12] **vs autopreferencia.**
  El storyboard puede mostrar que el face-cam compite con contenido
  en bloques densos. Flag al usuario: ¿marca o densidad? Pilar 1 gana
  salvo override explícito.

## Salida esperada

Matriz por bloque:

```
BLOQUE N — <título>
  Tipo: <camara | demo-pantalla | mixto | b-roll>
  Visual: <descripción densa; ASCII layout opcional para terminal>
  Fuera de pantalla: <qué NO se ve y por qué>
  Transición al siguiente: <corte seco | fade | zoom-out | …>
  Referencia: <link + timestamp, o vacío>
  Notas señalización: <callouts, highlights, flechas previstos>
```

Tipo de bloque obligatorio; los demás campos pueden quedar vacíos.
