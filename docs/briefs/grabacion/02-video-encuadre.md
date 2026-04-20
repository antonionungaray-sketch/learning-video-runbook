---
decision: grabacion/02-video-encuadre
etapa: grabacion
pregunta: ¿Face-cam, sin cara, o split? ¿Qué encuadre para la cámara y qué para la pantalla?
fuentes:
  - P1-§4.1                    # movimiento bottom-up
  - P1-§2.3-#12                # imagen del instructor (condicional)
  - P2-preprod-patrones
  - P2-preprod-variantes
  - P2-preprod-antipatrones    # forzar face-cam cuando contenido visual manda
  - P2-ficha-fireship          # sin cara + animación
  - P2-ficha-3b1b              # sin cara + Manim
  - P2-ficha-kurzgesagt        # sin cara + animación equipo
  - P2-ficha-veritasium        # face-cam on-location
  - P2-ficha-coding-train      # face-cam + live-coding
  - P2-ficha-theprimeagen      # face-cam principal sobre terminal
  - P2-ficha-mouredev          # face-cam PiP + editor
  - P2-ficha-midudev           # face-cam PiP + navegador
admite-variantes: true
varia-por-eje: [rol-presentador, arco-dominante]
sync: 2026-04-19
version: 2
---

## Principio aplicable

**Imagen del instructor es condicional, no default** [P1-§2.3-#12]: la
presencia visual del instructor puede ayudar (calidez, gaze guidance
al contenido) o estorbar (compite con el código denso). Depende de si
el canal visual alternativo puede sustituir esa función.

**Movimiento estratégico** [P1-§4.1]: cámara fija sobre toma de
screencasting libera al viewer de seguir movimiento mientras procesa
contenido técnico; cámara móvil en explainers documentales mantiene
atención bottom-up.

## Casos

- **Sin cara + animación densa** [P2-ficha-fireship, P2-ficha-3b1b,
  P2-ficha-kurzgesagt]: tres de los canales más grandes del atlas
  nunca muestran creador. Requiere competencia técnica para producir
  el canal visual compensatorio (AE, Manim, 2D custom).
- **Face-cam principal + contenido secundario** [P2-ficha-theprimeagen,
  P2-ficha-veritasium]: creador domina el frame, código/B-roll en
  pantalla secundaria o inserts. Útil cuando la **personalidad del
  creador** es el producto (Primeagen sarcasmo, Veritasium narrativa).
- **Face-cam PiP + editor principal** [P2-ficha-mouredev,
  P2-ficha-midudev, P2-ficha-coding-train]: editor/navegador ocupan
  70-85% del frame, face-cam PiP en esquina 15-30%. Default hispano
  de tutorial técnico. Balance pragmático entre calidez y contenido
  denso [P2-preprod-variantes].
- **Face-cam studio limpio sin PiP** [P2-ficha-quantumfracture,
  P2-ficha-dotcsv]: divulgación hispana — cara del creador llena el
  frame en bloques narrativos, cambios a pantalla completa para
  demos/visuales puntuales.

## Anti-patrón

**Forzar face-cam cuando el contenido visual debe llevar la carga**
[P2-preprod-antipatrones]. Curso de React con 70% creator, 30% código
invierte prioridades. La persona vale en saludo/cierre; el código vale
en el cuerpo. PiP pequeño resuelve.

**Studio formal + teleprompter rígido** [P2-preprod-antipatrones]:
Guo et al. 2014 documentó caída de engagement vs talking-head informal.
El estudio pulido sin calidez humana produce experiencia de e-learning
corporativo de los 90.

## Heurística numérica

- **Face-cam PiP:** 15-30% del frame, esquina inferior (derecha o
  izquierda consistente). No tapar código denso.
- **Encuadre medio para face-cam primary:** cabeza + hombros, ojos en
  tercio superior (regla de los tercios).
- **Screencast dominante:** 70-100% del frame. Si PiP, 15-25%.
- **Resolución de captura:** 1920×1080 mínimo para el canal principal;
  cam dedicada ≥ 1080p 30fps o superior.

## Ajuste por eje

### Por `rol-presentador`

- **`experto-neutral`:** face-cam estudio centrada, o sin cara con canal visual compensatorio denso (Fireship, Kurzgesagt).
- **`demostrador`:** face-cam PiP + pantalla principal (MoureDev, Midudev) o face-cam over terminal (ThePrimeagen).
- **`narrador-1a-persona`:** face-cam cuidada con presencia visual, o voz-over sin cara (Nerdwriter es sin cara).
- **`narrador-omnisciente`:** sin cara (voz fuera de campo). Kurzgesagt largos, Curtis.
- **`investigador`:** face-cam on-location + cutaway a archivo/documentos (Johnny Harris).
- **`conversador` / `anfitrion-de-experto`:** multi-cámara (1 por persona) + 2-shot opcional. Lex Fridman, Huberman.

### Por `arco-dominante`

- **`performativo`:** pantalla dominante + face-cam accesoria (PiP o split). El encuadre de pantalla prima; la cámara complementa.
- **`expositivo`:** face-cam estudio (centrada) o sin cara con canal visual compensatorio (animación, stock-graphics) — Fireship, Kurzgesagt.
- **`narrativo`:** encuadre cinematográfico — establecedoras + medium + close-up; B-roll abundante; cara en cámara opcional. Documental narrativo, Matt D'Avella.
- **`argumentativo`:** face-cam con presencia autoral + B-roll de evidencia citada (clips, documentos). Nerdwriter opera sin cara; Contrapoints con producción teatral.
- **`conversacional`:** multi-cámara (1 por persona) + 2-shot opcional; sin pantalla ni B-roll dominante. Lex Fridman, Huberman con invitado.

## Conflictos conocidos

Ninguno directo. El caso "sin cara" no contradice P1-§2.3-#12 porque
el principio es explícitamente condicional.

## Salida esperada

- Modelo elegido (sin cara / face-cam principal / face-cam PiP /
  studio limpio) con justificación en términos del contenido.
- Encuadre definido por toma: plano + posición del sujeto + posición
  de la pantalla en frame.
- Resolución de captura de cada fuente (cam + screen).
