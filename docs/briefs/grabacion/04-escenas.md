---
decision: grabacion/04-escenas
etapa: grabacion
pregunta: ¿Qué escenas OBS preparás antes de grabar, y cuándo cambiar entre ellas?
fuentes:
  - P1-§2.3-#1                 # coherencia
  - P1-§2.3-#6                 # segmentación
  - P1-§4.4                    # frecuencia de cortes: heurística, no ley
  - P2-preprod-patrones
  - P2-ficha-coding-train      # escenas para live-coding
  - P2-ficha-mouredev          # escenas para live-coding hispano
  - P3-preprod-captura         # OBS Scene Management
  - P3-modalidades-live        # Stream Deck + escenas live
admite-variantes: false
varia-por-eje: [grado-guion, grado-edicion]
sync: 2026-04-19
version: 3
---

## Principio aplicable

**Si existe Production Brief locked, su sección `Requisitos de captura`
es la fuente de verdad de este brief.** El storyboard ya decidió qué
escenas hacen falta (nombres, fuentes, crops, shortcuts). Grabación
ejecuta: abre OBS, crea/carga la scene collection con exactamente esas
escenas, asigna los shortcuts, corre sanity test. No re-decide tipología
ni cantidad.

**Cuando NO hay Production Brief,** grabación deriva las escenas desde
el guion: cada bloque narrativo (hook, contenido, retrieval, cierre)
obtiene una escena o shortcut para variante. Es fallback operable, no
el camino preferido [P1-§2.3-#6].

**OBS Scene Management** [P3-preprod-captura]: fuentes + overlays +
transiciones por escena, cambio en vivo con shortcut. Reduce edición.

**Cortes como función, no decoración** [P1-§4.4] [P1-§2.3-#1]: cada
cambio de escena tiene motivo (bloque nuevo, ángulo nuevo, señalización
alineada con cambio conceptual). Sin motivo = corte decorativo que
viola coherencia.

## Casos

- **Con Production Brief:** cargar scene collection con exactamente las
  escenas de `Requisitos de captura`. Ej. `pantalla-full [F1]`,
  `pantalla-zoom-cli [F2]`, `cam-full [F3]`, `coding-pip [F4]`. El
  mapa bloque→escena del Production Brief dicta los cambios en vivo.
- **Sin Production Brief, tutorial técnico:** (1) Hook — face-cam full;
  (2) Contenido — screen full + face-cam PiP; (3) Call-out — screen
  zoom + overlay; (4) Cierre — face-cam + lower-third.
- **Live-coding** [P2-ficha-coding-train] [P2-ficha-mouredev]: (1)
  Intro/Outro — face-cam full; (2) Coding — editor full + face-cam PiP
  + terminal lateral.

## Anti-patrón

**Ignorar los Requisitos de captura del Production Brief y redefinir
escenas desde cero.** Rompe el contrato previsualización→grabación:
el storyboard pidió "zoom-cli" y grabación arma "zoom genérico" con
otro crop → inconsistencia entre bloques.

**Cambiar escena sin motivo conceptual** (ej. cada 30s por inercia):
ritmo visual decorativo que satura [P1-§4.4]. La escena cambia cuando
cambia la idea.

**Grabar todo en una escena y separar en edición.** Funciona pero
duplica trabajo en post (recortes, reframings) que OBS resuelve en
grabación con 2-click [P2-preprod-patrones]. Preparar escenas es
inversión front-loaded.

**Escenas complejas (6+ fuentes superpuestas)** que rompen performance
por CPU/GPU saturada. Mantener ≤4 fuentes activas simultáneas
[P3-preprod-captura].

## Heurística numérica

- **Número de escenas:** 3-5 cubre tutorial técnico o divulgación
  estándar.
- **Fuentes por escena:** ≤4 activas.
- **Tiempo de cambio (transición):** 0.3-1s. Corte duro (0s) para
  estilo Fireship-denso.

## Ajuste por eje

### Por `grado-guion`

- **`guionado`:** escenas OBS planeadas 1:1 con el script — escena A para bloque 1, B para demo, C para cierre. Transiciones pre-programadas; el creador invoca transiciones en puntos exactos. Fireship, MoureDev estructurados.
- **`semi-guionado`:** escenas por tipo de segmento (code view, talking head, Q&A) — el presentador decide cuándo cambiar. Veritasium, Johnny Harris.
- **`improvisado`:** escenas OBS + Stream Deck físico para invocar cambios en tiempo real (live stream). Layout incluye chat overlay, alerts, sub/donation banners, webcam + escena de pausa. ThePrimeagen, Muratori. Ver [P3-modalidades-live].

### Por `grado-edicion`

- **`heavy`:** grabación multi-toma por escena; captura overshoot del 150-200% del tiempo final. El editor selecciona; las escenas son amplias.
- **`medium`:** grabación con menos reshoots; 1-2 takes por bloque; confiar en el performance.
- **`light`:** una toma maestra cubriendo todo; multi-cámara; sin recomposición estructural post. Conferencia grabada, podcast.
- **`zero`:** la "grabación" es el stream — las escenas son herramienta de ejecución en vivo, no de corrección posterior.

## Conflictos conocidos

- **Production Brief pide escena con >4 fuentes en hardware modesto.**
  Flag: ¿simplificar escena y asumir recorte en post, o usar un equipo
  distinto? Decisión del usuario, no se resuelve en silencio.

## Salida esperada

- Scene collection de OBS configurada con las escenas del Production
  Brief (o derivadas del guion si no hay brief) + shortcuts asignados.
- Mapa bloque → escena coincidente con el Production Brief (si existe).
- Sanity test: grabar 30s cambiando entre todas las escenas para
  confirmar que la PC aguanta sin dropped frames.
