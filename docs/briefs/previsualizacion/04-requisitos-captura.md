---
decision: previsualizacion/04-requisitos-captura
etapa: previsualizacion
pregunta: ¿Qué setup de captura (escenas OBS, ángulos, b-roll, props) exige el storyboard antes de apretar REC?
fuentes:
  - P1-§2.3-#1                 # coherencia
  - P1-§2.3-#2                 # señalización
  - P1-§2.3-#4                 # contigüidad espacial
  - P3-preprod-captura         # OBS Scene Management
  - P2-preprod-patrones
  - P2-ficha-fireship
  - P2-ficha-midudev
  - P2-ficha-coding-train
  - P3-edicion-composicion     # overlays auxiliares previstos
admite-variantes: false
varia-por-eje: [rol-presentador, grado-edicion]
sync: 2026-04-20
version: 2
---

## Principio aplicable

**Ciertas "transiciones" no son post-producibles.** Zoom al menú de
una app, close-up de cara, PiP sobre pantalla, cut-away a b-roll: el
setup existe **antes** de grabar. Si no, re-grabar.

**OBS Scene Management como contrato** [P3-preprod-captura]: cada
decisión visual (zoom, PiP, fuente alternativa) se materializa como
escena pre-configurada con fuentes, crop y shortcut.

**Coherencia** [P1-§2.3-#1] + **señalización** [P1-§2.3-#2] +
**contigüidad espacial** [P1-§2.3-#4]: el storyboard descarta lo no
pedido; zooms y crops son señalización ejecutada en captura, y el
call-out cae cerca del elemento porque el crop ya lo encuadró.

**Overlays auxiliares previstos.** El storyboard marca los overlays
que se generan en post (catálogo canónico de 10 tipos + `otro` libre,
ver `edicion/10-overlays-auxiliares`) bloque por bloque y los propaga a
`edicion/10-overlays-auxiliares` [P3-edicion-composicion].

## Auto-skip

Si el storyboard no declara escena alternativa ni overlays, registra
**"N/A"** y el skill pasa al cierre.

## Casos

- **Fireship** [P2-ficha-fireship]: pantalla-full + zoom con crop
  40-60% nombrado por bloque (`zoom-cli-output`, no "zoom genérico").
- **Midudev** [P2-ficha-midudev]: PiP como fuente fija con posición,
  tamaño y shortcut para mostrar/ocultar.
- **Coding Train** [P2-ficha-coding-train]: intro/outro face-cam +
  editor/PiP/terminal; cambio por shortcut.

## Anti-patrón

**"Zoom in post".** Sobre 1080p degrada calidad; sobre 1440p/4K suma
trabajo. Si el storyboard lo pide, pre-configurar escena OBS
[P2-preprod-patrones].

**Escenas sin shortcut, "por las dudas" o sin crop pre-definido.**
Pausa visible + ruido de mouse, framing al azar, violan coherencia
[P1-§2.3-#1] [P3-preprod-captura].

**Overlay sin bloque ni timestamp.** Llega desconectado a edición.

## Heurística numérica

- **≤4 fuentes activas por escena** [P3-preprod-captura]: dropped
  frames en hardware modesto si se supera.
- **3-5 escenas** cubre tutorial técnico o divulgación estándar.
- **Shortcuts numpad (1-9) o F-keys dedicadas;** evitar combos con
  modificador para cambio rápido en vivo.

## Ajuste por eje

### Por `rol-presentador`

- **`demostrador`:** captura pantalla + face-cam PiP + mic dedicado. Setup tutorial.
- **`experto-neutral` / `narrador-omnisciente`:** face-cam estudio o sin cara (animación/b-roll). Sin captura de pantalla dominante.
- **`narrador-1a-persona`:** face-cam cuidada + B-roll autoral. Estudio o on-location.
- **`investigador`:** face-cam on-location + capturas de fuentes/documentos en pantalla + archivo.
- **`conversador` / `anfitrion-de-experto`:** multi-cámara (una por persona) + audio multi-mic. No pantalla.

### Por `grado-edicion`

- **`heavy`:** captura sobredimensionada — múltiples ángulos, B-roll, cobertura redundante. El editor selecciona.
- **`medium`:** captura alineada al shotlist; poca redundancia.
- **`light`:** una toma multi-cámara que cubre el performance; sin reshoots.
- **`zero`:** captura = setup OBS en vivo; escenas pre-configuradas; alertas, chat overlay.

## Conflictos conocidos

- **Hardware modesto vs escenas complejas.** PiP + screen + call-out
  + overlay = 4 fuentes simultáneas, límite en portátiles sin GPU.
  Flag: ¿simplificar escena o aceptar recorte en post?

## Salida esperada

Sección del Production Brief tipo:

```
## Requisitos de captura
Escenas OBS:
  1. pantalla-full     (display 1)                     [F1]
  2. pantalla-zoom-cli (display 1, crop 40%)           [F2]
  3. cam-full          (webcam 1080p)                  [F3]
  4. coding-pip        (display 1 + cam PiP top-left)  [F4]
B-roll, ángulos, props.
Mapa bloque→escena: B1→cam-full · B2→coding-pip→zoom-cli · …
Overlays auxiliares previstos:
  B1  intro-animada  00:00-04  branding + título
  B3  stat-callout   01:12-15  "8.3% inflación anual"
  B4  lower-third    02:11-16  "Dra. Claudia Soto · Banco Central"
```

Input **obligatorio** para `grabacion/04-escenas` y para
`edicion/10-overlays-auxiliares`.
