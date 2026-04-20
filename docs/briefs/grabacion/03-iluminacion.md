---
decision: grabacion/03-iluminacion
etapa: grabacion
pregunta: ¿Cómo iluminar al sujeto y separarlo del fondo sin chroma key?
fuentes:
  - P1-§3.2                    # contraste WCAG (legibilidad)
  - P1-§3.1                    # color: efectos modestos y context-dependent
  - P2-preprod-patrones        # iluminación frontal suave
  - P2-ficha-theprimeagen      # face-cam iluminación frontal
  - P2-ficha-mouredev          # face-cam iluminación frontal
  - P2-ficha-quantumfracture   # divulgación hispana studio
  - P2-ficha-dotcsv            # divulgación hispana studio
  - P2-ficha-veritasium        # face-cam on-location
  - P3-preprod-iluminacion     # panel LED bicolor con difusor
admite-variantes: false
varia-por-eje: [rol-presentador]
sync: 2026-04-20
version: 2
---

## Principio aplicable

**Principio (no prescripción de equipo):** luz frontal suave + fondo
más oscuro que el sujeto separa sin chroma key [P2-preprod-patrones].
La marca del panel o la fuente (LED, ventana, softbox) importa menos
que la **geometría de la luz** — frontal a 45° sobre horizontal,
difusa, balance de blancos consistente.

**Contraste suficiente** [P1-§3.2]: si el face-cam aparece con contraste
<3:1 respecto al fondo, el viewer tiene que trabajar más para
distinguir — no es tan crítico como el texto-en-pantalla (WCAG 4.5:1),
pero igual fatiga.

## Casos

- **Panel LED bicolor con difusor** [P3-preprod-iluminacion]: setup
  mínimo suficiente. El principio importa más que la marca. Elgato Key
  Light, Neewer 660, cualquier genérico con CRI ≥90. Rango $40-300.
- **Luz natural de ventana + difusor:** $0 si existe la ventana y el
  horario. Predecible los días nublados; variable con sol directo.
  Aceptable para primer video, insuficiente para producción regular.
- **Three-point lighting** (key + fill + back): setup estándar de
  studio. Exceso para screencasting con face-cam PiP; apropiado para
  face-cam principal (Veritasium, QuantumFracture, DotCSV del atlas).
- **Setup ultra-mínimo 1 luz:** si solo hay 1 key sin pared/superficie
  clara para rebote pasivo como fill, aceptar key:fill natural sin
  forzar. Priorizar **posición frontal + difusor** sobre intentar
  construir fill imposible. Si las sombras bajo ojos/mandíbula quedan
  pesadas, subir un poco el key y acercarlo al eje del mentón para
  rellenar parcialmente.
- **Observación del atlas** [P2-preprod-patrones]: ThePrimeagen
  [P2-ficha-theprimeagen], MoureDev [P2-ficha-mouredev],
  QuantumFracture [P2-ficha-quantumfracture], DotCSV [P2-ficha-dotcsv],
  Veritasium [P2-ficha-veritasium] — todos con iluminación frontal
  suave y fondo más oscuro. Ninguno exhibe chroma key verde mal
  iluminado.

## Anti-patrón

**Luz solo cenital o contraluz fuerte** sin fill: produce sombras
marcadas bajo ojos/mandíbula (iluminación "monstruo"). Pésimo para
contenido educativo donde la calidez del instructor importa.

**Balance de blancos inconsistente entre tomas.** Saltos perceptibles
de tono de piel entre cortes distraen. Fijar WB manual en cámara y
en todas las luces en el mismo valor (5500K típico día; 3200K tungsteno).

**Iluminación mezclada sin corregir** (ventana + tubo fluorescente +
LED) produce tonos magenta/verde en zonas distintas del frame. Una
sola familia de color temperatura.

## Heurística numérica

- **Balance de blancos:** 5500K (neutral día) o 3200K (tungsteno), no
  "auto". Consistente entre todas las luces y cámara.
- **CRI (Color Rendering Index) del LED:** ≥90. CRIs bajos (60-80 de
  LEDs baratos) colorean la piel.
- **Geometría key light:** 45° horizontal, 45° vertical (o cercano),
  a 1-1.5m del sujeto con difusor.
- **Intensidad relativa:** key:fill ≈ 2:1 para sensación natural.
  3:1 para dramático.

## Ajuste por eje

### Por `rol-presentador`

- **`experto-neutral` en estudio:** key + fill + light de separación del fondo; panel LED bicolor con difusor es estándar [P3-preprod-iluminacion].
- **`narrador-1a-persona`:** iluminación consistente con el tono del canal — estudio íntimo suave (Ali Abdaal, Matt D'Avella) o más cinematográfica (Contrapoints).
- **`narrador-omnisciente`:** **no aplica** — voice-over sin cara. La "iluminación" pasa al diseño de animación/archivo.
- **`investigador` on-location:** luz disponible + panel portátil reflector/bounce si se puede; priorizar consistencia entre tomas del mismo día. Johnny Harris típicamente ajusta en color grading post.
- **`demostrador`:** iluminación frontal suave sin brillos en pantalla/teclado. Cuidar reflejos en lentes.
- **`conversador` / `anfitrion-de-experto`:** iluminación equivalente para ambos/todos los hablantes — key lights simétricos para evitar que un hablante se vea "premium" y otro "amateur" (Lex Fridman, Huberman).

## Conflictos conocidos

Ninguno.

## Salida esperada

- Setup verificado en cámara antes de empezar (captura de prueba).
- Balance de blancos manual fijo en el mismo valor cámara/luces.
- Separación sujeto-fondo: sujeto más claro que el fondo por ≥1 stop.
- Sin sombras pesadas bajo ojos/mandíbula.
