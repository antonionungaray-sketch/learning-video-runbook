---
decision: material/01-secuenciacion-conceptual
etapa: material
pregunta: ¿En qué orden presentas los conceptos para que cada uno active el conocimiento previo necesario para el siguiente?
fuentes:
  - P1-§2.1                   # CLT — carga intrínseca y nivel previo
  - P1-§2.3-#7                # pre-entrenamiento (Mayer 7)
  - P1-§2.4                   # segmentación / unidad útil (Guo et al.)
  - P1-§6.1                   # confusión productiva y cambio conceptual
  - P1-§6.4                   # problema de transferencia
  - P1-§7                     # principios de diseño basados en evidencia
  - P1-§8.3                   # variedad contextual
admite-variantes: true
varia-por-eje: [objetivo-cognitivo]
sync: 2026-04-26
version: 1
---

## Principio aplicable

**El orden de presentación gobierna la carga intrínseca acumulada.** Cada concepto nuevo cuesta capacidad de memoria de trabajo proporcional a su distancia respecto al conocimiento ya activado [P1-§2.1]. Si el bloque N introduce un concepto que el bloque N-1 no sentó como prerequisito, la audiencia paga doble: parsea el concepto nuevo *y* construye el ancla que debió venir antes. Resultado: saturación silenciosa que se ve como "no engancharon", "no entendieron", "el material es denso".

**Pre-entrenamiento como contrato upstream** [P1-§2.3-#7]: nombres, vocabulario y componentes clave entran antes del flujo principal. La secuencia se diseña hacia adelante por dependencias, no hacia atrás por categorías temáticas.

Este brief vive **upstream** de densidad por bloque (decide 02) y de soporte visual (decide 03). Aquí solo se ordenan los conceptos; la cantidad de cada uno y su forma visual se calibran después.

## Casos

- **Tema histórico secuenciado por época** [P1-§2.4]: el set "El origen del yoga" arranca antes del hinduismo (Valle del Indo) → mundo védico → upanishads → darshanas → yoga clásico → tantra/hatha → yoga moderno. Cada capítulo presupone el anterior y agrega un solo elemento nuevo. La secuencia replica el scaffolding histórico real, así que el orden cronológico coincide con el orden conceptual.
- **Tema técnico con prerequisito explícito** [P1-§2.3-#7]: explicar OAuth empieza por "qué problema resuelve" (sesiones / cookies básicas, conocimiento que la audiencia ya tiene) → flujo authorization code → tokens de acceso → refresh tokens. Saltar al flujo sin construir el problema deja a la audiencia memorizando pasos sin entender por qué existen.
- **Tema científico con cambio conceptual** [P1-§6.1]: el efecto Coriolis empieza por marco rotacional (la Tierra gira) → fuerza ficticia (lo que se siente desde adentro de un sistema rotante) → desviación percibida en proyectiles y vientos. Saltar al fenómeno final ("los huracanes giran en sentidos opuestos") sin construir el marco produce memorización del dato sin reestructuración del modelo mental erróneo.

## Anti-patrón

**Orden por afinidad temática del autor en vez de por prerequisitos cognitivos** [P1-§6.4]. Es tentador agrupar "todo lo del Valle del Indo en bloque 1, todo lo védico en bloque 2"; pero si bloque 2 introduce un término que el bloque 7 necesita, hay que adelantarlo o re-explicarlo. Las categorías son cómodas para el autor; las dependencias son lo que importa al aprendiz.

**Asumir conocimiento que la audiencia no tiene** [P1-§2.1]. Si el primer bloque requiere haber leído algo externo o haber estudiado un prerequisito implícito, la secuencia falla en el primer puente. La audiencia abandona o se desconecta sin avisar.

**Saltar la confusión productiva en temas con misconceptions** [P1-§6.1]. Empezar por "esto es así" sin primero exponer "tú probablemente crees que es así otra" desperdicia el motor de cambio conceptual. La intuición errónea persiste por debajo del dato correcto memorizado.

## Heurística numérica

- **Un concepto nuevo por bloque** [P1-§2.3-#7]. Bloques con 2+ conceptos nuevos saturan la memoria de trabajo. Si tu bloque introduce dos cosas, son dos bloques.
- **Pre-training cap:** si para entender el bloque N hace falta explicar 3+ términos del bloque N-1 que la audiencia no tiene, el bloque N-1 está mal segmentado o falta un bloque puente entre ambos.
- **6-9 bloques** suele ser el rango sano para un tema completo. Más de 9 satura aún con buen scaffolding [P1-§2.4]; menos de 6 suele sub-explicar o forzar densidad alta por bloque.
- **Variedad contextual al cierre** [P1-§8.3]: el último bloque presenta el mismo principio en un contexto distinto al usado para enseñarlo (transferencia explícita).

## Ajuste por eje

### Por `objetivo-cognitivo`

- **`adquirir-habilidad`:** secuencia procedimental — orden por dependencias de ejecución (no se puede X sin Y). Cada bloque agrega un paso del procedimiento. Cierre con aplicación práctica completa.
- **`corregir-intuicion`:** secuencia que primero refuerza la intuición errónea, luego la confronta con evidencia, luego ofrece el modelo correcto. La confusión productiva [P1-§6.1] es el motor — sin construirla, el dato correcto no reemplaza el modelo viejo.
- **`decidir-informado`:** secuencia comparativa — primero establece criterios de decisión, luego presenta opciones contra esos criterios. Cierre con matriz de decisión consolidada. Saltar criterios produce comparaciones sin marco.
- **`orientarse`:** secuencia estilo mapa — vista panorámica del dominio primero, luego zooms a sub-dominios. La estructura espacial supera a la temporal cuando el dominio no tiene cronología natural [P1-§7].
- **`formar-opinion`:** secuencia argumentativa — premisa → evidencia → contra-argumento → síntesis. NO empezar por la conclusión; el lector debe acompañar el argumento.
- **`apreciar`:** secuencia evocativa — anclas sensoriales primero, contexto histórico/teórico después. La emoción precede al análisis [P1-§7]; invertir el orden anestesia el material.

## Conflictos conocidos

**Dos secuencias naturales contradictorias** (cronológica vs conceptual): elegir una y nombrar la elección al usuario. Híbridos confunden. Ejemplo: la historia del yoga puede contarse cronológicamente (Valle del Indo → moderno) o por escuela (Hatha vs Raja vs Bhakti). Mezclar ambas en la misma serie produce vértigo. **Flaggear al usuario** y dialogar sobre cuál ordenamiento sirve mejor al objetivo cognitivo.

**Audiencia con alto conocimiento previo** [P1-§7]: forzar todo el scaffolding a un experto fastidia y dispara abandono. Si la audiencia es intermedia o avanzada, comprimir o saltar bloques iniciales.

**Tema sin dependencias internas claras** (p. ej. una colección de tips independientes): la "secuencia" se vuelve arbitraria. Considerar si el material realmente es un explainer de concepto o si es una lista — y replantear formato si es lista.

## Salida esperada

Una lista numerada de N bloques (rango sano 6-9) donde cada bloque declara:

1. **Título** del bloque (corto, descriptivo).
2. **Concepto nuevo introducido** (uno solo, explícito).
3. **Conocimiento previo activado** (qué se asume — del bloque anterior o del bagaje de la audiencia).
4. **Por qué este orden** (qué falla si lo movemos — la dependencia concreta).

El último bloque debe ofrecer **variedad contextual** [P1-§8.3]: aplicar el principio en un contexto distinto al usado para enseñar.
