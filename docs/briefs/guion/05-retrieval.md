---
decision: guion/05-retrieval
etapa: guion
pregunta: ¿Dónde insertas momentos de recuperación activa?
fuentes:
  - P1-§6.3                    # retrieval practice / testing effect
  - P1-§8.1                    # retrieval checkpoints dentro del contenido
  - P2-meta-tutorial
  - P2-meta-onboarding
  - P2-ficha-kurzgesagt
admite-variantes: false
sync: 2026-04-18
version: 1
---

## Principio aplicable

**Testing effect** [P1-§6.3] [P1-§8.1]: recuperar información supera a
releer la para retención a largo plazo (Roediger & Karpicke 2006;
Karpicke & Blunt 2011). No es intuitivo — se siente menos efectivo
(porque cuesta más), pero produce mejor consolidación.

**Preguntas generativas > preguntas de reconocimiento.** "¿Qué harías
en esta situación?" supera a "¿cuál de estas respuestas es correcta?".
El costo cognitivo de generar la respuesta es el driver del efecto.

## Casos

- **Tutorial técnico** [P2-meta-tutorial]: retrieval implícito en forma de
  pausas donde el espectador puede probar el comando antes de ver el
  resultado. "Pausá y probalo si querés; te espero."
- **Onboarding corporativo** [P2-meta-onboarding]: retrieval explícito vía
  quiz embebido, 1 cada 2-3 min. Plataformas LMS lo enforzan; YouTube no.
- **Divulgación**: retrieval casi inexistente en el formato estándar.
  Excepto Kurzgesagt [P2-ficha-kurzgesagt] que usa "piensa por un
  momento…" seguido de 2s de animación — aproximación a retrieval
  sin quiz.

## Anti-patrón

**Pregunta retórica sin pausa para respuesta.** "¿Cómo creen que funciona?
Bueno, funciona así." No es retrieval — el cerebro no tiene tiempo de
generar. Si hay pregunta, hay que darle tiempo (2-3s mínimo de animación
vacía o "pausá ahora").

## Heurística numérica

- **Tutorial técnico:** ≥1 retrieval checkpoint cada 5-10 min, típicamente
  como pausa-para-probar.
- **Onboarding:** más denso — 1 cada 2-3 min, quiz con pregunta generativa.
- **Divulgación:** 0-1 por video; la estructura narrativa hace el trabajo.

## Conflictos conocidos

Ninguno.

## Salida esperada

- Lista de retrieval checkpoints con timestamp estimado.
- Formato de cada uno (pausa-para-probar / quiz / pregunta-abierta con
  animación).
- Texto literal de la pregunta generativa (no de reconocimiento).
