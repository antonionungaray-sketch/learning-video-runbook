---
decision: publicacion/03-descripcion-capitulos
etapa: publicacion
pregunta: ¿Qué metadata acompaña al video para SEO, navegabilidad y CTA?
fuentes:
  - P2-publicacion-patrones    # capítulos marcados reducen abandono
  - P2-ficha-3b1b              # capítulos sistemáticos
  - P2-ficha-veritasium        # capítulos + recursos enlazados
  - P2-ficha-kurzgesagt        # capítulos + fuentes
  - P3-publicacion-plataformas
admite-variantes: false
varia-por-eje: [grado-edicion, plataforma]
sync: 2026-04-20
version: 2
---

## Principio aplicable

**Capítulos marcados reducen abandono** [P2-publicacion-patrones]. El
viewer que busca una parte específica no tiene que scroll arriesgado
por la timeline; salta directo. El video gana views de "navegadores"
que sin capítulos se irían.

**Primer párrafo reafirma la promesa** y entrega valor inmediato (no
"hi welcome to my channel"). La audiencia que llega desde search o
recommendations lee ese párrafo antes de decidir seguir viendo.

## Casos

- **3Blue1Brown** [P2-ficha-3b1b]: capítulos sistemáticos con títulos
  que ya explican la estructura ("0:00 - Un problema sorprendente",
  "3:24 - La intuición", etc.). Visible en cada video >10 min
  [P2-publicacion-patrones].
- **Veritasium** [P2-ficha-veritasium]: capítulos + recursos enlazados
  en descripción (papers, experimentos originales) + disclaimer de
  sponsor cuando aplica.
- **Kurzgesagt** [P2-ficha-kurzgesagt]: capítulos + lista de fuentes
  con links académicos. La transparencia de fuentes es parte de la
  marca. Apoyo en plataforma [P3-publicacion-plataformas] (YouTube
  reconoce capítulos en descripción con formato `timestamp título`).

## Anti-patrón

**Descripción genérica copy-pasted entre videos.** Zero SEO
diferencial.

**Capítulos demasiado granulares** (cada 30s): ruido en la timeline,
no ayuda.

**Primer párrafo con auto-promoción** ("soy X y hago videos de Y —
si te gusta suscríbete"): desperdicia el primer screen de
descripción.

**Links rotos o enlaces que redirigen a páginas genéricas.** Los
links se revisan en el momento de publicar, no "cuando tenga tiempo".

**Primer capítulo NO en `0:00`.** YouTube exige que el primer
timestamp sea `0:00` para reconocer los capítulos como funcionales.
Poner "0:30 - Hook" con el 0:00 sin marcar rompe el chapter parser
— los capítulos no aparecen en la barra de reproducción. Error
común: asumir que el hook no cuenta como capítulo.

## Heurística numérica

- **Capítulos:** 3-8 típicamente para video 5-15 min; ≥4 para
  videos >10 min.
- **Primer capítulo:** debe empezar en `0:00` (YouTube requisito
  para reconocerlos como capítulos funcionales).
- **Duración mínima de capítulo:** 10s (YouTube regla); evitar 10s
  — esos son secciones demasiado finas.
- **Primer párrafo:** 2-3 oraciones, ≤200 caracteres visible antes
  de "read more".
- **Descripción total:** 300-800 palabras típicamente; más si hay
  lista extensa de recursos/fuentes.

## Ajuste por eje

### Por `grado-edicion`

- **`heavy` / `medium`:** capítulos planeados en la edición; timestamps exactos.
- **`light`:** capítulos marcados post-hoc desde la estructura temática (TED, conferencia).
- **`zero`:** capítulos generados post-stream desde el chat/highlights; poco confiables sin trabajo editorial explícito.

### Por `plataforma`

- **`long-form-horizontal`:** capítulos en descripción obligatorios para videos ≥8 min (YouTube los reconoce como segments).
- **`shorts-vertical`:** no aplican capítulos — formato demasiado corto.
- **`podcast-audio-primario`:** capítulos **críticos** (Spotify/Apple muestran timestamps + títulos).
- **`live-with-vod`:** capítulos añadidos al re-upload; live no los soporta.
- **`corporate-lms`:** estructura de capítulos = secciones SCORM/xAPI. Cada módulo es un "chapter" completo trackable por el LMS (marcas de completion independientes).

## Conflictos conocidos

Ninguno.

## Salida esperada

- Descripción completa con estructura: (a) primer párrafo con promesa
  + valor inmediato, (b) índice de capítulos con timestamps desde
  `0:00`, (c) recursos enlazados (repos, docs, referencias), (d)
  keywords naturales integradas al texto (no spam), (e) redes/CTAs
  al final.
- Capítulos pegados en descripción en formato YouTube-válido:
  `0:00 Título del capítulo`.
- Verificación de que el primer capítulo inicia en `0:00`.
