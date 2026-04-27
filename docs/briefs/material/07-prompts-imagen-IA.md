---
decision: material/07-prompts-imagen-IA
etapa: material
pregunta: ¿Cómo escribes un prompt para IA de imagen que produzca una pieza coherente con el set y libre de AI slop?
fuentes:
  - P1-§2.3-#1                # coherencia (Mayer 1)
  - P1-§2.3-#2                # señalización (Mayer 2)
  - P1-§2.3-#4                # contigüidad espacial (Mayer 4)
  - P1-§2.3-#9                # multimedia (Mayer 9)
  - P1-§3.1                   # color modesto, context-dependent
admite-variantes: false
varia-por-eje: []
sync: 2026-04-26
version: 1
---

## Principio aplicable

**Un prompt para IA de imagen es un contrato funcional, no una descripción literaria.** Cuatro componentes obligatorios:

1. **Estilo verbatim del preset** — el meta-prompt fijo del brief 05, palabra por palabra. Esto es lo que da consistencia entre piezas del set [P1-§2.3-#1].
2. **Composición específica** — layout, jerarquía, dónde va cada elemento. La IA improvisa composición si no le indicas; resultado: cada lámina queda con framing distinto.
3. **Elementos concretos** — qué objetos / escenas / diagramas aparecen, listados explícitamente. Si pides "una representación del Valle del Indo" la IA inventa; si pides "mapa con río Indo + ubicaciones de Harappa y Mohenjo-Daro + flechas de monzones del suroeste", la IA ejecuta.
4. **Texto literal entre comillas** — el texto que va integrado en la imagen, cita exacta. Pedirle a la IA que "incluye un encabezado sobre el Valle del Indo" produce texto inventado (con typos en IA generativa).

Sumado: **restricciones negativas explícitas para evitar slop** [P1-§3.1]. La IA responde mejor a "sin gradientes modernos, sin sombras realistas, sin elementos genéricos de stock" que a "alta calidad, profesional, hermoso" — los positivos vagos son ruido; los negativos concretos son señal.

## Casos

- **Lámina del set yoga, capítulo 1**: el prompt incluye verbatim el meta-prompt de `historico-grabado` (paleta sepia, tipografía libro de historia, ilustración tipo grabado), especifica composición "doble página con header dominante + 3 paneles numerados + footer + timeline al pie", lista elementos ("mapa del Indo con flechas de monzones del suroeste, sello de piedra con figura en postura de loto y animales alrededor, diagrama de migraciones convergentes desde estepas y costa"), incluye texto literal entre comillas (header "CAPÍTULO 1 — ANTES DEL HINDUISMO: EL VALLE DEL INDO", caja "Civilización urbana avanzada hace más de 5,000 años", footer "PARA ESTUDIAR: Monzones, Indoarios, Harappa, Mohenjo-Daro, Sincretismo"), y cierra con restricciones ("paleta tierra/sepia restringida, ilustración tipo grabado o litografía, sin fotorealismo, sin gradientes modernos, sin AI slop").

- **Slide técnica de OAuth, preset `tecnico-flat`**: meta-prompt sans-serif moderno + paleta neutra + acentos saturados, composición "1 visual hero centrado + sin texto integrado al visual (los bullets viven aparte)", elementos ("3 entidades: Usuario, App cliente, Servidor de autorización; flechas numeradas de 1 a 4 mostrando el flujo authorization code; tokens estilizados como badges"), texto literal vacío (porque va aparte en bullets), restricciones ("flat sin sombras, sin gradientes, sin photo-realism, sin elementos decorativos no funcionales").

## Anti-patrón

**Prompt vago tipo "haz una infografía sobre X"**: sin estilo verbatim ni composición concreta, la IA improvisa. Resultado: cada lámina del set se ve distinta. Coherencia rota [P1-§2.3-#1].

**Texto descrito en vez de literal entre comillas** [P1-§2.3-#4]: pedir "incluye un encabezado sobre la civilización del Indo" produce texto que la IA inventa con typos comunes en IA generativa de imagen ("Cilivization", "Hindusm"). Texto entre comillas se integra fielmente la mayoría del tiempo.

**Restricciones positivas vagas en vez de negativas concretas** [P1-§3.1]: "alta calidad, profesional, hermoso" no evita slop. "Sin gradientes modernos, sin sombras realistas, sin AI slop, sin elementos genéricos de stock, sin manos deformes" sí. La IA responde mejor a exclusiones explícitas.

**Cambiar el meta-prompt de estilo entre piezas del set** [P1-§2.3-#1]: parafrasear "ilustración tipo grabado" en una lámina y "estilo litográfico" en la siguiente produce variaciones que la IA percibe como direcciones distintas. Verbatim siempre.

## Heurística numérica

- **Anatomía estable:** estilo (5-10 líneas verbatim del preset) + composición (3-5 líneas) + elementos (1 línea por elemento) + texto literal (entre comillas) + restricciones (5-8 negaciones explícitas).
- **Verbatim del meta-prompt en cada prompt del set.** No parafrasear. El verbatim es lo que da consistencia entre piezas [P1-§2.3-#1].
- **Iteración:** si la 1ª salida no convence, ajustar UN elemento del prompt (estilo / composición / elemento puntual). No reescribir todo — pierdes la trazabilidad de qué cambió.
- **Restricciones negativas:** mínimo 5 negaciones explícitas por prompt, ajustadas al preset.

## Anatomía de prompt para set coherente

Estructura recomendada (una sección por capítulo en `prompts-laminas.md`):

```
## Capítulo N — <título>
**Concepto:** <uno solo>
**Texto integrado:** <lo que va literalmente en la lámina>

### Prompt para IA de imagen

[META-PROMPT DE ESTILO — verbatim del preset elegido en brief 05]
Paleta: <colores específicos del preset>
Tipografía: <familias específicas del preset>
Tratamiento: <tipo de ilustración del preset>
Composición global: <doble página / grid / asimétrico — del preset>

[COMPOSICIÓN ESPECÍFICA DE ESTA LÁMINA]
Layout: <header + N paneles + footer + timeline si aplica>
Jerarquía visual: <qué domina, qué es secundario>

[ELEMENTOS]
- <objeto / escena / diagrama 1>
- <objeto / escena / diagrama 2>
- ...

[TEXTO LITERAL]
- Header: "<texto exacto entre comillas>"
- Caja "concepto clave": "<texto exacto>"
- Footer "para estudiar": "<lista exacta>"
- Timeline (si aplica): "<rango de fechas>"

[RESTRICCIONES]
- Sin fotorealismo
- Sin gradientes modernos
- Sin AI slop / elementos genéricos de stock
- Paleta restringida a la lista de arriba
- <restricciones específicas del preset>

### Notas de iteración
- Si la 1ª salida no convence: <qué ajustar concretamente>
- Variación recomendada: <opcional, si hay alternativa válida>
```

## Conflictos conocidos

**Herramientas de IA imagen distintas responden a distintos formatos** [P1-§2.3-#9]: el template anterior está calibrado contra Claude artifact y GPT image. Midjourney prefiere prompts más densos con `--ar 16:9` para aspect ratio. Stable Diffusion tolera weights `(elemento:1.3)` para énfasis. Si el usuario usa Midjourney/SD, sugerir adaptar la sintaxis sin cambiar el contenido del prompt.

**IA con limitaciones de texto** [P1-§2.3-#4]: si la herramienta elegida produce texto deformado consistentemente (problema histórico, mejorando con generaciones nuevas), aceptar generar el visual sin texto y agregar el texto en post (Figma, Canva). El prompt en ese caso solo lista el texto como referencia para el layout, no lo pide integrado.

**Costo de iteración**: cada generación cuesta tiempo y/o créditos. Si después de 3 intentos el resultado no converge, el problema suele estar en el prompt (composición vaga, elementos contradictorios) más que en la IA. Re-leer el prompt con ojo crítico antes de seguir iterando.

## Salida esperada

`prompts-laminas.md` con N secciones (una por capítulo del Didactic Brief), cada una con:

- Anatomía completa del prompt según el template arriba.
- Notas de iteración aplicables.
- El meta-prompt de estilo **verbatim e idéntico** en todas las secciones — ese es el contrato de coherencia visual del set [P1-§2.3-#1].
