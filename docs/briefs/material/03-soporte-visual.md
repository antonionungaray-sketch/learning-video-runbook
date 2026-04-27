---
decision: material/03-soporte-visual
etapa: material
pregunta: ¿Qué tipo de visual corresponde a qué tipo de concepto, y cómo se compone con el texto?
fuentes:
  - P1-§2.2                   # codificación dual
  - P1-§2.3-#2                # señalización (Mayer 2)
  - P1-§2.3-#4                # contigüidad espacial (Mayer 4)
  - P1-§2.3-#9                # multimedia (Mayer 9)
  - P1-§4.2                   # guía de mirada
  - P1-§11.1                  # gramática visual de datos
  - P1-§11.2                  # data-ink ratio
admite-variantes: true
varia-por-eje: [objetivo-cognitivo]
sync: 2026-04-26
version: 1
---

## Principio aplicable

**Codificación dual** [P1-§2.2]: información codificada en canal verbal *y* visual se recuerda mejor que la codificada en uno solo. Pero el visual debe **codificar información**, no decorar.

**Multimedia** [P1-§2.3-#9]: palabras + imágenes superan a palabras solas. Aplicado a material estático: un bloque sin visual es un bloque ciego al canal visual del lector. Está dejando memoria sobre la mesa.

**Contigüidad espacial** [P1-§2.3-#4]: texto e imagen relacionados deben estar visualmente cerca. Caption a 200 px de la imagen que describe degrada el aprendizaje. El texto vive *dentro* del visual o pegado a él.

Cada tipo de concepto admite ciertos visuales y resiste a otros. La taxonomía no es estética — es funcional. Mapa para concepto espacial; diagrama causal para proceso; comparativo para opciones; timeline para evolución; escena ilustrativa para narrativa.

## Casos

- **Concepto geográfico → mapa con anotaciones** [P1-§4.2]: la lámina "Capítulo 1 — Antes del hinduismo" usa un mapa del Indo con flechas de monzones + ubicaciones de Harappa/Mohenjo-Daro. La espacialidad real se traduce a espacialidad visual; el lector recorre con la mirada el territorio del que habla el texto.
- **Concepto causal → diagrama de flujo** [P1-§2.3-#4]: la lámina "Migraciones indoarias + locales = sincretismo proto-hinduista" usa 3 fuentes con flechas convergiendo a un círculo central. El proceso se vuelve legible visualmente; el lector ve la causalidad sin tener que reconstruirla del texto.
- **Concepto comparativo → matriz lado-a-lado** [P1-§11.1]: la lámina del capítulo 9 compara Hinduismo / Budismo / Cristianismo en 3 columnas con símbolo + concepto + definición. La estructura visual hace evidente la equivalencia funcional; saltar de columna a columna activa comparación directa.
- **Concepto evolutivo → timeline horizontal** [P1-§4.2]: el footer de las láminas con "3000 a.C. → 1500 a.C." y nodos cronológicos da contexto temporal sin gastar el cuerpo de la lámina. Direccionalidad de izquierda a derecha respeta el sesgo de progresión temporal en lectores hispanos.
- **Concepto cuantitativo → gráfico de barras o posición** [P1-§11.1]: cuando hay valores que comparar, posición en escala común gana sobre área (pie chart) o color (heatmap). Aplica a divulgación con datos.

## Anti-patrón

**Visual decorativo que no codifica información** [P1-§11.2]: fondo abstracto bonito, ilustración genérica de stock, decoración ambient. Desperdicia el canal visual y consume capacidad sin ganancia. AI slop entra aquí: imágenes técnicamente correctas pero que no representan el concepto del bloque.

**Texto descrito en vez de adyacente al visual** [P1-§2.3-#4]: "ver figura 3 en la página siguiente". Romper la contigüidad espacial degrada el aprendizaje cuando el texto y la imagen se relacionan.

**Mezclar dos tipos de visual en una sola unidad** [P1-§2.3-#2]: mapa + diagrama causal + matriz comparativa en la misma lámina. Si necesitas 2 tipos, casi siempre son 2 láminas distintas. Una excepción legítima: un visual primario + un sub-visual de contexto pequeño (ej. mapa grande + sello como inset).

**Pie chart cuando hay 5+ categorías** [P1-§11.1]: el ángulo es el peor encoding cuantitativo de la jerarquía Cleveland & McGill. Para comparación precisa, gráfico de barras gana siempre.

## Heurística numérica

- **Un concepto = un tipo de visual.** Mezclar dos tipos suele indicar dos bloques.
- **Data-ink ratio alto** [P1-§11.2]: cada elemento debe codificar información. Decoración pura, fuera. Si lo quitas y el bloque sigue funcionando, sobraba.
- **Texto integrado a ≤30 px del elemento que describe** (escala visual; el principio es "leerlo sin mover los ojos lejos") [P1-§2.3-#4].
- **Señalización con propiedades preattentive** [P1-§11.1]: color saturado, tamaño muy dispar, orientación distinta. Procesado en <200 ms sin foco consciente. Usar para destacar el dato clave vs el contexto.

## Ajuste por eje

### Por `objetivo-cognitivo`

- **`adquirir-habilidad`:** visuales procedimentales — capturas de pantalla anotadas, diagramas de flujo de pasos, antes/después. La visual replica la ejecución para que el lector la imite.
- **`corregir-intuicion`:** visual de contraste — intuición errónea ↔ realidad, lado a lado [P1-§11.1]. Predice/verifica explícito; el lector ve la brecha entre lo que pensaba y lo que es.
- **`decidir-informado`:** matriz comparativa con criterios y opciones. Heatmap solo si los criterios admiten gradiente cuantitativo; si son cualitativos, mejor tabla con símbolos contrastantes.
- **`orientarse`:** mapas, diagramas de zoom (vista panorámica → zoom progresivo). El mapa puede ser literal (geográfico) o metafórico (mapa mental, taxonomía).
- **`formar-opinion`:** visual evocativo — fotografía editorial, ilustración de autor, símbolo culminante [P1-§4.2]. La imagen es retórica, no analítica; sostiene la tesis.
- **`apreciar`:** visual sensorial — gama tonal completa, composición rica. La imagen *es* el contenido, no su ilustración. La densidad visual sustituye la densidad textual.

## Conflictos conocidos

**Preset de estilo rico vs objetivo cognitivo analítico**: cuando el preset (ver brief 05) pide ilustración rica (`historico-grabado`, `narrativo-comic`) pero el objetivo es `corregir-intuicion` o `decidir-informado` (que pide claridad analítica), hay tensión. La riqueza visual puede comprometer la legibilidad del contraste o la precisión del encoding [P1-§11.1]. **Flaggear al usuario**: o se baja la riqueza estilística para los bloques analíticos, o se acepta que esos bloques se verán menos cohesionados con el resto del set.

**Concepto que no admite buen visual** (ej. una distinción puramente lingüística entre dos términos): forzar un visual decorativo viola coherencia [P1-§11.2]. Aceptar el bloque mostly-text con solo tipografía de apoyo es válido cuando el concepto es genuinamente verbal.

## Salida esperada

Para cada bloque del Didactic Brief, especificar:

- **Tipo de visual** (mapa / diagrama causal / comparativo / timeline / matriz / escena ilustrativa / gráfico cuantitativo / mostly-text con tipografía).
- **Elementos a representar** (qué objetos, escenas, conceptos aparecen literalmente).
- **Texto integrado** (qué etiquetas, captions, cajas viven dentro del visual — para garantizar contigüidad espacial).
- **Encoding** (si aplica): cómo se mapean los valores a propiedades visuales (posición / longitud / color / etc.).
