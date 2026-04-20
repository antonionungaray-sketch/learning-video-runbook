---
decision: grabacion/07-b-roll-plan
etapa: grabacion
pregunta: ¿Qué material auxiliar (B-roll, screenshots, recursos) necesitas producir antes de editar?
fuentes:
  - P1-§2.3-#5                 # contigüidad temporal
  - P1-§2.3-#4                 # contigüidad espacial
  - P1-§2.3-#1                 # coherencia (B-roll decorativo)
  - P2-preprod-patrones
  - P2-preprod-antipatrones    # stock footage decorativo
  - P2-ficha-veritasium        # B-roll documental pre-producido
  - P2-ficha-fireship          # screenshots + memes
  - P2-ficha-kurzgesagt        # animación pre-producida por equipo
  - P1-§9.1                    # modos documentales (arco narrativo)
  - P1-§10.3                   # evidencia visual en ensayo argumentativo
  - P1-§11.3                   # investigación visible (periodismo)
admite-variantes: false
varia-por-eje: [grado-edicion, arco-dominante]
sync: 2026-04-19
version: 2
---

## Principio aplicable

**Contigüidad temporal y espacial** [P1-§2.3-#5] [P1-§2.3-#4]: los
visuales de apoyo deben aparecer **en sincronía** con la frase que
ilustran y **cerca del elemento** al que se refieren. Para que esto
funcione en edición, los recursos deben estar disponibles antes —
cazarlos en mitad del edit rompe flujo.

**Pre-producir lo que no sea grabable en vivo** (animaciones custom,
diagramas, screenshots de otros entornos, recortes de otros videos)
ahorra horas de fricción en edición y mejora la calidad del resultado.

## Casos

- **Tutorial técnico simple:** screenshots del IDE en momentos clave,
  terminal con comandos específicos, diagrama conceptual (Excalidraw,
  draw.io) — preparables en 15-30 min antes de la grabación principal.
- **Divulgación documental** [P2-ficha-veritasium]: B-roll
  cinematográfico, entrevistas, on-location. Semanas de pre-producción.
  Fuera del scope del creator típico del toolkit.
- **Divulgación animada** [P2-ficha-kurzgesagt]: animación producida
  por equipo dedicado. Fuera del scope de creator solo.
- **Tutorial denso con overlays** [P2-ficha-fireship]: screenshots,
  meme inserts, logos y gráficos — biblioteca propia reutilizada entre
  videos, se va construyendo con el tiempo.

## Anti-patrón

**Planear B-roll "lo busco en edición"** sin lista previa: en edición
se descubre que "aquí faltaría un diagrama", se pierde media hora
haciéndolo, se vuelve al edit, se repite. Múltiples context switches.
Listar antes, producir en batch, editar sin interrupciones.

**Stock footage decorativo** (manos escribiendo, código verde matrix):
carga extraña sin función [P2-preprod-antipatrones] [P1-§2.3-#1]. Mejor
sin B-roll que con B-roll genérico.

**Screenshots sin resolución suficiente para el frame final**
(capturas a 1280×720 intentando llenar 1920×1080 con escalado):
pixelación visible, señal de producción descuidada. Capturar siempre
a resolución nativa o superior.

## Heurística numérica

- **Resolución de screenshots:** ≥1920×1080 nativa (capturar desde
  monitor 1080p o mayor, sin escalado).
- **Tiempo estimado de producción de B-roll pre-grabación:** 30-60
  min por cada 5-7 min de video final (para creator solo, contenido
  técnico con screenshots + diagramas simples).
- **Formato de archivos:** PNG para screenshots sin animación; MP4
  H.264 para capturas animadas; SVG para diagramas editables.
- **Nomenclatura:** `<bloque>-<slug>.<ext>` (ej. `03-diagrama-arquitectura.png`)
  para ubicar rápido en edición.

## Ajuste por eje

### Por `grado-edicion`

- **`heavy`:** B-roll abundante y planeado — shotlist paralelo al script. 30-60% del tiempo final en pantalla es B-roll (Veritasium, Kurzgesagt, Johnny Harris). Requiere presupuesto significativo: producción documental, motion graphics, archivo licenciado.
- **`medium`:** B-roll estratégico — inserts para momentos clave (3-8 por video de 10 min). Stock genérico aceptable si es específico al punto.
- **`light`:** B-roll mínimo o inexistente (TED, conferencia, podcast multi-cam). Cobertura visual = multi-cámara + expresión del speaker.
- **`zero`:** **no aplica** — el live stream no permite B-roll pre-producido. Imágenes ilustrativas vía browser source en OBS, en vivo.

### Por `arco-dominante`

- **`performativo`:** B-roll = screenshots del flujo + closeups del hardware/código + capturas de outputs. Funcional al procedimiento; nunca decorativo [P1-§2.3-#1].
- **`narrativo`:** B-roll narrativo extenso — archivo, recreación, establecedoras, retratos. 40-70% del video en documental. Ver modos documentales [P1-§9.1].
- **`argumentativo`:** B-roll de **evidencia citada** — clips de la obra analizada, documentos, papers, datos visualizados. Cada pieza con función argumentativa; ver pilar 1 §10.3 y §11.3.
- **`expositivo`:** B-roll ilustrativo — diagramas, animaciones de concepto, metáforas visuales (Kurzgesagt isotype, 3B1B Manim).
- **`conversacional`:** B-roll raro — graphics insert ocasional (Huberman con diagramas mid-conversación); Lex Fridman rara vez usa B-roll.

## Conflictos conocidos

Ninguno.

## Salida esperada

- Lista de recursos a producir antes de grabar: nombre, tipo, timestamp
  aproximado en el video donde va.
- Lista de recursos a conseguir de terceros (con atribución planeada):
  screenshots de docs oficiales, logos, recortes de otros videos con
  permiso.
- Carpeta organizada con los recursos listos antes del primer cut.
