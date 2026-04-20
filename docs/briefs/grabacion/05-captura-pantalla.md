---
decision: grabacion/05-captura-pantalla
etapa: grabacion
pregunta: ¿Cursor visible o oculto? ¿Callouts en vivo durante grabación o añadidos en edición?
fuentes:
  - P1-§4.2                    # guía de mirada (gaze guidance)
  - P1-§2.3-#2                 # señalización
  - P2-preprod-patrones
  - P3-preprod-captura
  - P2-ficha-fireship          # zoom dinámico post
  - P2-ficha-coding-train      # cursor visible live-coding
  - P2-ficha-mouredev          # cursor + ocasional callout post
  - P1-§11.3                   # investigación visible (evidencia citada)
admite-variantes: true
varia-por-eje: [arco-dominante]
sync: 2026-04-19
version: 2
---

## Principio aplicable

**Guía de mirada** [P1-§4.2]: el ojo sigue movimiento, caras y texto.
Cursor moviéndose en la pantalla guía la mirada al área activa; cursor
oculto transfiere la carga al viewer de "buscar dónde pasa algo".

**Señalización** [P1-§2.3-#2]: destacar la zona relevante mejora
atención selectiva. Puede hacerse en vivo (cursor grande, highlight
ring) o en post (zoom digital, callouts, flechas).

**Tradeoff grabación vs edición:** hacer señalización en vivo reduce
trabajo de edición pero compromete flexibilidad. Hacerla en post
exige más tiempo pero permite ajustar según ritmo final.

## Casos

- **Cursor visible, sin callouts en vivo, zoom en post** (modelo
  Fireship) [P2-ficha-fireship]: graba pantalla limpia con cursor del
  sistema visible; en edición aplica zoom dinámico sobre zona relevante
  + highlights tipográficos. Máxima flexibilidad, más tiempo de post.
- **Cursor visible con highlight, sin callouts en vivo** (modelo
  Coding Train / MoureDev) [P2-ficha-coding-train] [P2-ficha-mouredev]:
  cursor con círculo amarillo al click; graba con ese overlay siempre
  activo. Señalización implícita en el puntero mismo.
  Herramientas por plataforma (agnósticas de hardware):
    - **macOS:** Mouseposé, Highlight Pro.
    - **Windows:** CursorPro, ZoomIt (Sysinternals, gratuito).
    - **Multiplataforma:** Keyviz (muestra teclas también), Pensela.
    - **Linux:** Key-mon, plugin OBS `Input Overlay`.
- **Callouts en vivo con plugin de OBS:** usar fuente "Browser" con
  overlay dinámico controlado por shortcut. Más complejo, menos común
  en el atlas.
- **Cursor oculto en demos de animación pura** (3B1B, Kurzgesagt):
  no aplicable — no hay cursor porque no hay software en pantalla.

## Anti-patrón

**Cursor sistema invisible + sin señalización** en screencast técnico:
el viewer pierde contexto de dónde está pasando la acción. Obliga a
esfuerzo metacognitivo que debería hacer el editor.

**Callouts en vivo mal sincronizados** (delay del plugin, click fuera
de la zona pretendida): peor que no tenerlos. Si se usa en vivo, probar
antes de grabar tomas importantes.

**Zoom demasiado agresivo en post** (pantalla cortada al 40% del
contenido): deja al viewer sin contexto de dónde está en el flujo de
trabajo global.

## Heurística numérica

- **Cursor ring/highlight al click:** 30-50px de diámetro, color de
  contraste con el fondo (amarillo o rojo sobre tema oscuro).
- **Zoom dinámico en post:** 1.3-1.6× sobre zona explicada. Más es
  pérdida de contexto.
- **Duración de zoom:** sostener mientras se explica la zona (~3-8s);
  volver a la vista completa después.

## Ajuste por eje

### Por `arco-dominante`

- **`performativo`:** captura de pantalla es el canal visual dominante. Cursor visible obligatorio (resaltado con efecto en OBS o post-grabación); callouts sobre elementos relevantes. Tutoriales, how-to, live coding.
- **`expositivo`:** captura accesoria a face-cam o voz-over — screenshots puntuales para ilustrar un punto. Cursor ligeramente resaltado si aparece.
- **`narrativo`:** **no aplica** captura de pantalla como elemento estructural. Excepción: screenshot específico mostrado como evidencia narrativa (Adam Curtis usa cortes de archivo + texto de computadora ocasionalmente).
- **`argumentativo`:** captura de pantalla solo como **evidencia citada** — screenshot de paper, tuit, documento, data viz referenciada. Ver investigación visible [P1-§11.3] aplicada a periodismo visual.
- **`conversacional`:** **no aplica** — el formato podcast/live stream conversacional no tiene pantalla como elemento dominante. Excepción: paneles que proyectan slide detrás del hablante.

## Conflictos conocidos

Ninguno.

## Salida esperada

- Decisión explícita: cursor visible (sí/no), highlight al click
  (sí + herramienta / no), callouts en vivo (sí + método / no),
  zoom-en-post previsto (sí + zonas aproximadas / no).
- Software de cursor highlight instalado y probado (Mouseposé,
  CursorPro, Highlight Pro) si se usa.
