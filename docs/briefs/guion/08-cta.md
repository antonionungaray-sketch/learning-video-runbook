---
decision: guion/08-cta
etapa: guion
pregunta: ¿Qué acción le pides al espectador y cómo cierras el loop narrativo?
fuentes:
  - P1-§6.4                    # transferencia
  - P1-§6.2                    # cierre de open loops
  - P2-idea-guion-antipatrones
  - P2-ficha-fireship
  - P2-ficha-veritasium
  - P2-ficha-midudev
admite-variantes: false
sync: 2026-04-18
version: 1
---

## Principio aplicable

**Transferencia** [P1-§6.4]: el aprendizaje se consolida cuando se aplica
en un contexto distinto al original. Un CTA que invita a aplicar
(construir, probar, enseñar a otro) produce mejor retención que "suscribite".

**Cierre de open loop** [P1-§6.2]: la pregunta abierta del hook debe
resolverse en el cierre. Dejarla abierta frustra (Zeigarnik inverso).

## Casos

- **Fireship** [P2-ficha-fireship]: CTA = link al repo/docs + "hacé el
  tutorial oficial" (invita a transferencia). "Suscribite" al final,
  después del valor entregado.
- **Veritasium** [P2-ficha-veritasium]: CTA = pregunta generativa
  ("¿cómo aplicarías esto en tu caso?") + invitación a otro video
  relacionado.
- **Midudev** [P2-ficha-midudev]: CTA al curso propio explícito al final,
  bien justificado con lo que se aprendería nuevo.

## Anti-patrón

**"Suscribite al inicio" sin valor entregado** [P2-idea-guion-antipatrones]:
caída típica de retention. El CTA de suscripción al inicio, antes de
demostrar valor, correlaciona con abandono a los 30s.

**CTA genérico sin acción específica.** "Espero les haya gustado" no
invita a nada. Correlaciona con click-through rate bajo.

## Heurística numérica

- **CTA ≤ 15s.** Más es auto-promoción que rompe el cierre.
- **1 acción específica.** No 3 opciones — reduce la probabilidad de cada
  una por fatiga de decisión.

## Conflictos conocidos

Ninguno.

## Salida esperada

- Cierre del open loop del hook (una frase explícita que conecta hook↔cierre).
- CTA específico: acción concreta ("probá X con este repo", "leé Y en el
  link", "contame en comentarios qué harías en Z caso").
- Suscripción opcional al final, después del valor — no al inicio.
