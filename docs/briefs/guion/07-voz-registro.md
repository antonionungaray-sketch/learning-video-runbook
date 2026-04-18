---
decision: guion/07-voz-registro
etapa: guion
pregunta: ¿Tono, pacing y persona narrativa?
fuentes:
  - P1-§2.3-#10                # personalización (tú/nosotros)
  - P1-§2.3-#11                # voz humana cálida
  - P1-§5.4                    # voz y personalización
  - P2-idea-guion-patrones
  - P2-ficha-fireship
  - P2-ficha-midudev
  - P2-ficha-3b1b
  - P2-ficha-kurzgesagt
admite-variantes: false
sync: 2026-04-18
version: 1
---

## Principio aplicable

**Personalización** [P1-§2.3-#10]: lenguaje conversacional ("tú",
"nosotros", "imaginá que…") supera a lenguaje formal para aprendizaje.
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
  compensado con animación densa (pilar 1 §2.3 #8 modalidad).

## Anti-patrón

**Registro formal/corporativo en contenido personal.** "En este video
procederemos a examinar…" degrada engagement vs "Mirá lo que podemos
hacer con…". El registro formal tiene su lugar (compliance, legal), no
en tutorial ni divulgación.

## Heurística numérica

- **Tutorial técnico denso:** 180-240 WPM, canal verbal alto, canal visual
  acompaña con code snippets.
- **Divulgación estándar:** 150-190 WPM.
- **Divulgación con animación densa:** 140-165 WPM (compensación Mayer).
- **Onboarding corporativo formativo:** 130-160 WPM, más pausas por
  retrieval.

## Conflictos conocidos

- **WPM bajo + animación pobre = aburrido.** El WPM bajo se sostiene solo
  con canal visual compensatorio. Flaggear al usuario que elige <150 WPM
  sin plan de visual denso.

## Salida esperada

- Registro explícito (cercano conversacional / profesional cercano /
  profesional formal).
- WPM objetivo con justificación del canal visual que lo acompaña.
- Nota sobre uso de segunda persona ("vos", "tú") o primera plural
  ("nosotros") — consistente a lo largo del video.
