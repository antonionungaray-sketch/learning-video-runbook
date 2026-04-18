---
decision: guion/06-modalidad-dual
etapa: guion
pregunta: ¿Qué se dice con voz y qué se muestra en pantalla?
fuentes:
  - P1-§2.2                    # codificación dual (Paivio)
  - P1-§2.3-#3                 # principio de redundancia
  - P1-§2.3-#8                 # principio de modalidad
  - P1-§2.3-#2                 # principio de señalización
  - P2-idea-guion-patrones
admite-variantes: false
sync: 2026-04-18
version: 1
---

## Principio aplicable

**Codificación dual** [P1-§2.2]: canales verbal y visual son procesados en
paralelo y se integran en memoria. Contenido complementario en ambos canales
supera a contenido en uno solo.

**Principio de modalidad** [P1-§2.3-#8]: cuando hay gráfico, **narración
hablada** supera a **texto en pantalla**. El texto en pantalla compite
con el gráfico por el canal visual.

**Principio de redundancia** [P1-§2.3-#3]: texto en pantalla idéntico a la
narración hablada **degrada** el aprendizaje. El canal verbal es uno solo
— escrito o hablado, no ambos simultáneamente idénticos.

**Principio de señalización** [P1-§2.3-#2]: destacar lo esencial con
callouts, flechas, highlight tipográfico, mejora la atención selectiva.

## Casos

- **Kurzgesagt** [P2-ficha-kurzgesagt]: narración + animación isotype
  densa. Cero texto en pantalla que duplique la narración. Textos solo
  como labels de elementos visuales.
- **3Blue1Brown** [P2-ficha-3b1b]: ecuaciones en pantalla + narración que
  las explica paso a paso. La ecuación NO se lee literal — se señaliza
  con color y movimiento.
- **Fireship** [P2-ficha-fireship]: code snippets en pantalla + narración
  que comenta qué hacen. Texto del snippet ≠ narración — complementarios.

## Anti-patrón

**Subtítulos decorativos que repiten textualmente la narración en el
canal de B-roll** (no confundir con subtítulos de accesibilidad, que son
distintos). Añade carga extraña sin ganancia de aprendizaje [P1-§2.3-#3].

## Heurística numérica

- **Texto en pantalla máximo 5-7 palabras por elemento.** Más es ensayo.
- **Callouts/señalizaciones:** cada 10-15s en contenido técnico denso;
  menos en divulgación con animación continua.

## Conflictos conocidos

- **Accesibilidad vs. redundancia:** subtítulos para sordos SON redundantes
  con narración, pero son obligatorios por accesibilidad. El principio de
  redundancia NO aplica a subtítulos. Flaggear al usuario si intenta
  removerlos por "optimización cognitiva".

## Salida esperada

Marcado explícito en el guión por cada momento relevante de:
- Qué va en narración (literal).
- Qué va en pantalla (visual + texto corto si aplica).
- Dónde hay señalización (flecha, highlight, callout).
