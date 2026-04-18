---
decision: guion/04-segmentacion
etapa: guion
pregunta: ¿Cuántos bloques y de qué duración?
fuentes:
  - P1-§2.3-#6                # principio de segmentación
  - P1-§2.4                    # ~6 min decay (Guo et al. 2014)
  - P2-meta-tutorial
  - P2-meta-divulgacion
  - P2-meta-onboarding
admite-variantes: false
sync: 2026-04-18
version: 1
---

## Principio aplicable

**Principio de segmentación** [P1-§2.3-#6]: dividir contenido en unidades
manejables con cierres claros supera a flujo continuo, porque cada unidad
permite consolidar en memoria de trabajo antes de seguir.

**Guo et al. 2014 (MOOCs)** [P1-§2.4]: engagement decae pasado ~6 min en
contenido lectivo continuo. No es "ley de 6 min" — es mediana observada
en MOOCs con aprendices motivados. En nichos distintos (entertainment-ed,
onboarding con tareas) los números se mueven.

## Casos

- **Tutorial técnico anglo** [P2-meta-tutorial]: videos 8-15 min con
  bloques de 2-4 min. Fireship 4 min total sin segmentación explícita
  (el video ENTERO es un bloque denso).
- **Divulgación corta** [P2-meta-divulgacion]: 5-12 min con bloques de
  60-90s marcados por transición visual.
- **Onboarding corporativo** [P2-meta-onboarding]: microlearning ≤5 min
  con 80% completion, vs 20% en formato largo continuo.

## Anti-patrón

**Video de 25 min sin segmentación visible.** Un solo bloque continuo.
Retention típica <30% a los 10 min. Si el tema requiere 25 min, hacer
serie de 4-5 partes.

## Heurística numérica

- **Tutorial técnico:** bloques de 2-4 min, total 5-15 min.
- **Divulgación:** bloques de 60-120s, total 6-12 min.
- **Onboarding:** microlearning ≤5 min por unidad, serie para temas grandes.
- **Regla de pulgar:** si el video pasa de 10 min, la segmentación debe ser
  VISUALMENTE marcada (título de bloque, cambio de fondo, chapter marker).

## Conflictos conocidos

Ninguno.

## Salida esperada

- Duración total estimada.
- Número de bloques y título de cada uno.
- Duración aproximada de cada bloque.
- Método de marcado visual entre bloques (chapter marker, título en
  pantalla, cambio de escena).
