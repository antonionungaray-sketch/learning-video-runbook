---
decision: concepto/01-audiencia
etapa: concepto
pregunta: ¿Para quién es este video y con qué nivel previo cuentan?
fuentes:
  - P1-§2.1                   # carga intrínseca y nivel previo
  - P1-§2.3-#7                # pre-entrenamiento
  - P2-meta-tutorial          # audiencias canónicas de tutorial técnico
  - P2-meta-divulgacion       # audiencias de divulgación
  - P2-meta-onboarding        # audiencias de onboarding (audiencia captiva)
  - P2-ficha-fireship         # caso audiencia dev anglo pre-entrenada
  - P2-ficha-midudev          # caso audiencia dev hispana junior-mid
  - P2-ficha-kurzgesagt       # caso audiencia general sin background
admite-variantes: false
varia-por-eje: [objetivo-cognitivo]
sync: 2026-04-19
version: 2
---

## Principio aplicable

**El nivel previo gobierna qué carga intrínseca tolera el aprendiz**
[P1-§2.1]. Sin nombrar audiencia con nivel previo explícito no se puede
calibrar nada downstream: ni cadencia, ni vocabulario asumido, ni
profundidad técnica, ni qué necesita pre-entrenamiento [P1-§2.3-#7].

Este brief vive **upstream** del objetivo medible (que se decide en 02).
Aquí solo se nombra al perfil con nivel previo. La acción medible viene
después, encadenada a esta definición.

## Casos

- **Tutorial técnico anglo pre-entrenado** [P2-ficha-fireship]: devs que
  ya programan, vocabulario asumido (npm, framework, deploy). Soporta
  WPM ~235 y "React in 100 Seconds" sin explicar términos básicos.
- **Tutorial técnico hispano junior-mid** [P2-ficha-midudev]: devs
  hispanos en transición; pre-entrenamiento on-the-fly para términos
  nuevos (Vite vs webpack); WPM ~188.
- **Divulgación general sin background** [P2-ficha-kurzgesagt]: público
  amplio sin formación específica; pre-entrenamiento via animación
  isotype durante 60-90s antes del argumento central.
- **Onboarding corporativo audiencia captiva** [P2-meta-onboarding]:
  empleados obligados a tomar el módulo; el desafío no es atraer sino
  sostener — completion ~80% en microlearning, ~20% en long-form.

## Anti-patrón

**Audiencia difusa ("para todos los que quieran aprender X")**
[P2-meta-tutorial]. Garantiza calibración mal: el video queda demasiado
básico para los avanzados y demasiado rápido para los novatos.
Correlaciona con caídas de retention por ambos extremos.

**Confundir "audiencia objetivo" con "audiencia que llega"**: la primera
se decide aquí; la segunda se mide en publicación (CCN fit). Mezclarlas
en concepto produce hooks que no encajan con nadie.

## Heurística numérica

- **Una audiencia por video.** Bifurcaciones internas ("para junior y
  para senior") explotan la modalidad dual sin ganancia [P2-meta-tutorial].
- **Pre-entrenamiento bound:** si el guión que va a salir necesita
  >20% del audio inicial explicando términos, la audiencia definida
  aquí no coincide con la audiencia real del contenido [P1-§2.3-#7].
- **Edad y idioma como ejes silenciosos:** registro hispano junior
  tolera anglicismos (`deploy`, `commit`); divulgación general no
  [P2-meta-divulgacion].

## Ajuste por eje

### Por `objetivo-cognitivo`

- **`adquirir-habilidad`:** audiencia definida por "¿quién va a ejecutar qué tarea?" Nivel previo = familiaridad con el dominio procedimental (stack, herramienta, método).
- **`corregir-intuicion`:** audiencia definida por "¿quién sostiene la intuición errónea?" Nivel previo = exposición al fenómeno pero sin modelo correcto. Pilar 1 §6.1 (cambio conceptual).
- **`decidir-informado`:** audiencia definida por rol decisor ("¿quién compra / adopta / autoriza?"). Nivel previo = conocimiento del problema de negocio pero no de las alternativas.
- **`orientarse`:** audiencia definida por "¿quién entra al dominio por primera vez?" Nivel previo típicamente bajo; pre-entrenamiento extensivo.
- **`formar-opinion`:** audiencia definida por exposición al debate ("¿quién ya discute X?"). Nivel previo = opiniones parciales formadas.
- **`apreciar`:** audiencia definida por sensibilidad estética previa ("¿quién ya sigue este género / autor / dominio?"). Nivel previo = sensibilidad, no conocimiento técnico.

## Conflictos conocidos

Si el cliente pide "público amplio" pero el contenido es técnico
profundo, hay conflicto P1-§2.1 (la carga intrínseca no escala a
audiencias sin pre-entrenamiento) vs requerimiento del cliente.
**Flaggear al usuario:** el toolkit no resuelve esto en silencio;
o se acota la audiencia, o se baja la profundidad, o se agrega
pre-entrenamiento explícito.

## Salida esperada

Una sola frase:

- **Audiencia:** "[perfil con nivel previo explícito y eje cultural si
  importa, ej. 'devs backend hispanos con experiencia en Node pero sin
  haber tocado Bun', o 'público adulto general sin background técnico
  en biología']".

Sin objetivo medible (eso lo decide el brief 02). Sin formato (lo
decide el 04). Audiencia limpia.
