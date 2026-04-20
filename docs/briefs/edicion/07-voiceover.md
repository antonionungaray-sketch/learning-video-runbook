---
decision: edicion/07-voiceover
etapa: edicion
pregunta: ¿Regenerás partes con voz IA, regrabás, o dejás el audio original?
fuentes:
  - P1-§5.4                    # voz y personalización
  - P1-§2.3-#11                # voz humana cálida
  - P1-§2.3-#10                # personalización
  - P3-edicion-voiceover       # ElevenLabs / Coqui / Piper
admite-variantes: true
varia-por-eje: [rol-presentador, grado-edicion]
sync: 2026-04-20
version: 2
---

## Principio aplicable

**Voz humana cálida supera a voz sintética genérica** [P1-§2.3-#11,
P1-§5.4]. La brecha se ha estrechado con TTS modernos (ElevenLabs,
voces clonadas con prosodia natural); ya no es absoluta pero el gap
persiste para aprendizaje profundo.

**Personalización** [P1-§2.3-#10]: registro cercano/conversacional supera
a formal. TTS sin control de prosodia tiende a ser plano; TTS con
voice cloning puede transmitir personalización si se entrena con voz
del creador.

**Consistencia de voz** (implícito en §5.4): mezclar segmentos con voz
humana original y segmentos de TTS crea rupturas perceptuales que
distraen del contenido.

## Casos

- **Regrabar segmento específico** (opción preferida cuando el error
  es local): cuesta tiempo pero mantiene consistencia [P1-§5.4].
- **TTS con voz clonada** (ElevenLabs Professional Voice Cloning,
  [P3-edicion-voiceover]): opción viable para sustituir segmentos cortos
  si la voz clonada tiene >30 min de training del creador real. Permite
  mantener personalización [P1-§2.3-#10].
- **TTS genérico** (voz por default sin clonar): usar solo en bordes
  (intros corporativos, disclaimers) donde la consistencia emocional
  no importa. Degrada menos si el segmento es corto (<30s).
- **Coqui / Piper** [P3-edicion-voiceover]: open source, calidad menor,
  apto para borradores o scratch tracks en edición.

## Anti-patrón

**Mezclar voz original y TTS genérico sin transición.** El viewer
percibe la ruptura aunque no pueda nombrarla. Rompe personalización.

**Sustituir pistas largas con TTS genérico para ahorrar tiempo de
regrabado.** Acumula fatiga perceptual; reducción de engagement real
aunque el creador no lo escuche.

**TTS sin revisar prosodia.** Palabras técnicas o nombres propios se
pronuncian mal; números se leen raros. Revisión palabra-por-palabra
es obligatoria.

## Heurística numérica

- **Voz clonada requiere:** ≥30 min de audio limpio del creador para
  entrenar (ElevenLabs Professional) o ≥3 min para Instant Voice Cloning
  (calidad menor).
- **Segmentos TTS aceptables dentro de video con voz humana:**
  intro/outro tipo "bienvenidos a este video", disclaimers legales.
- **Ratio TTS en video completo:** si >20% es TTS, considerar regrabar
  o usar voz clonada en todo.

## Ajuste por eje

### Por `rol-presentador`

- **`narrador-omnisciente`:** voice-over post-grabación es el modo nativo. Nichols §9.2 — voice-of-god documental. Tono distante-autoritativo.
- **`narrador-1a-persona`:** voice-over autoral con tono íntimo. Nerdwriter, Matt D'Avella. Pilar 1 §10.2.
- **`investigador`:** voice-over + fragmentos en cámara. Johnny Harris.
- **`experto-neutral`:** voice-over complementa a face-cam o reemplaza (Fireship, Veritasium híbrido).
- **`demostrador`:** voice-over típicamente NO aplica — la voz es en vivo durante la demo.
- **`conversador` / `anfitrion-de-experto`:** **no aplica** voice-over post. El audio es el diálogo grabado.

### Por `grado-edicion`

- **`heavy`:** voice-over diseñado frase-a-frase al script, re-grabado si necesario.
- **`medium`:** voice-over limpio pero sin obsesión por re-grabaciones.
- **`light`:** **no aplica** — el audio es el take en vivo.
- **`zero`:** **no aplica** — live stream no admite voice-over post.

## Conflictos conocidos

Ninguno.

## Salida esperada

- Decisión por segmento (original / regrabado / TTS voz clonada /
  TTS genérico), con justificación.
- Si hay TTS: herramienta usada + confirmación de prosodia revisada
  palabra-por-palabra.
- Nota de consistencia: todos los segmentos suenan como la misma voz,
  sin rupturas perceptuales.
