---
decision: guion/07-voz-registro
etapa: guion
pregunta: ¿Tono, pacing y persona narrativa?
fuentes:
  - P1-§2.3-#10                # personalización (tú/nosotros)
  - P1-§2.3-#11                # voz humana cálida
  - P1-§2.3-#8                 # modalidad (compensación WPM bajo con visual denso)
  - P1-§5.4                    # voz y personalización
  - P2-idea-guion-patrones
  - P2-ficha-fireship
  - P2-ficha-midudev
  - P2-ficha-3b1b
  - P2-ficha-kurzgesagt
  - P1-§9.2                    # voz documental (narrador-omnisciente)
  - P1-§10.2                   # voz autoral ensayo (narrador-1a-persona)
  - P2-ficha-mouredev          # registro cercano hispano
admite-variantes: true
varia-por-eje: [rol-presentador, arco-dominante]
sync: 2026-04-19
version: 2
---

## Principio aplicable

**Personalización** [P1-§2.3-#10]: lenguaje conversacional ("tú",
"nosotros", "imagina que…") supera a lenguaje formal para aprendizaje.
El cerebro procesa la personalización como diálogo, activando más áreas
de comprensión social.

**Voz humana cálida** [P1-§2.3-#11] [P1-§5.4]: voz humana con prosodia
natural supera a voz sintética genérica. La brecha se ha estrechado con
TTS modernos (ElevenLabs, etc.); ya no es absoluta pero el gap persiste
en aprendizaje profundo.

## Casos (WPM observados)

- **Alta densidad anglo:** Fireship ~235 [P2-ficha-fireship],
  ThePrimeagen 189-206.
- **Alta densidad hispana:** Midudev ~188 [P2-ficha-midudev], MoureDev
  ~185.
- **Divulgación media:** 3Blue1Brown ~190 [P2-ficha-3b1b], Veritasium
  ~178, QuantumFracture ~168.
- **Divulgación lenta:** Kurzgesagt ~150 [P2-ficha-kurzgesagt] —
  compensado con animación densa [P1-§2.3-#8].

**Calibración por variante del español:** los WPM hispanos observados
son mayormente peninsular. Para variantes con prosodia más marcada,
ajustar 10-15 WPM a la baja; para neutro-latam dejar igual.

## Anti-patrón

**Registro formal/corporativo en contenido personal.** "En este video
procederemos a examinar…" degrada engagement vs "Mira lo que podemos
hacer con…". El registro formal tiene su lugar (compliance, legal), no
en tutorial ni divulgación.

## Heurística numérica

- **Tutorial técnico denso:** 180-240 WPM, canal verbal alto, canal visual
  acompaña con code snippets.
- **Divulgación estándar:** 150-190 WPM.
- **Divulgación con animación densa:** 140-165 WPM (compensación Mayer).
- **Onboarding corporativo formativo:** 130-160 WPM, más pausas por
  retrieval.

## Ajuste por eje

### Por `rol-presentador`

- **`experto-neutral`:** 2a persona, registro cercano-profesional, WPM 150-200. Fireship, Veritasium.
- **`narrador-1a-persona`:** 1a persona autoral, registro íntimo-reflexivo, WPM 140-180 con pausas marcadas. Nerdwriter, Contrapoints [P1-§10.2].
- **`narrador-omnisciente`:** 3a persona impersonal, tono distante-autoritativo, WPM 130-170. Kurzgesagt largos, Curtis [P1-§9.2].
- **`investigador`:** 1a persona con matiz periodístico, WPM 160-190, admite dudas explícitas. Johnny Harris.
- **`demostrador`:** 2a persona imperativa-cercana, WPM 160-220, admite errores honestos ("se me cayó esto, vamos a ver") [P2-ficha-mouredev].
- **`conversador`:** registro de diálogo natural, WPM variable (no prescribible); emerge de la conversación.
- **`anfitrion-de-experto`:** registro de entrevistador respetuoso, WPM 140-170 para dar espacio al invitado. Lex Fridman.

### Por `arco-dominante`

- **`expositivo`:** tono claro, lenguaje directo, pocas inflexiones.
- **`narrativo`:** tono evocador, pausas dramáticas, tiempo narrativo.
- **`argumentativo`:** tono retórico, admite escalada emocional controlada al culminar la tesis.
- **`performativo`:** tono operativo-imperativo ("ahora abrimos X"), pausa-para-probar integrada.
- **`conversacional`:** no prescribible — emerge del diálogo.

## Conflictos conocidos

- **WPM bajo + animación pobre = aburrido.** El WPM bajo se sostiene solo
  con canal visual compensatorio. Flaggear al usuario que elige <150 WPM
  sin plan de visual denso.

## Salida esperada

- Registro explícito (cercano conversacional / profesional cercano /
  profesional formal).
- WPM objetivo con justificación del canal visual que lo acompaña.
- Nota sobre uso de segunda persona ("tú") o primera plural
  ("nosotros") — consistente a lo largo del video.
