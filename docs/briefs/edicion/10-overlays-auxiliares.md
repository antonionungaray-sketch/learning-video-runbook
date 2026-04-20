---
decision: edicion/10-overlays-auxiliares
etapa: edicion
pregunta: ¿Qué overlays auxiliares generas en post (del catálogo de 10 tipos universales u `otro` libre) y con qué herramienta los produces?
fuentes:
  - P1-§2.3-#1                 # coherencia
  - P1-§2.3-#2                 # señalización
  - P1-§2.3-#5                 # contigüidad temporal
  - P1-§2.3-#6                 # segmentación
  - P1-§2.3-#7                 # pre-entrenamiento
  - P1-§5.1                    # tipografía para pantalla
  - P1-§5.3                    # posición de lower thirds
  - P1-§6.2                    # bucles abiertos
  - P1-§8                      # retrieval practice
  - P2-edicion-patrones
  - P2-edicion-antipatrones
  - P2-ficha-fireship
  - P2-ficha-kurzgesagt
  - P2-ficha-3b1b
  - P3-edicion-composicion
  - P3-modalidades-live        # overlays en vivo via OBS
admite-variantes: true
varia-por-eje: [grado-edicion]
sync: 2026-04-20
version: 3
---

## Principio aplicable

**Señalización** [P1-§2.3-#2]: guían la mirada. **Coherencia**
[P1-§2.3-#1]: si no cumple función, agrega carga extraña.
**Contigüidad temporal** [P1-§2.3-#5]: aparece cuando se lo nombra.
Agregan elementos gráficos inexistentes en el crudo (vs señalización
02 sobre cuadro, b-roll 06 pre-grabado, transiciones 09 entre bloques).

**Catálogo canónico** (cada uno con respaldo en pilar):

- `intro-animada` / `outro-animada` · branding, CTA [P2-edicion-patrones].
- `lower-third` · identificación de persona [P1-§5.3].
- `callout` · señala elemento ya en cuadro [P1-§2.3-#2].
- `chapter-marker` · sección, unidad cognitiva [P1-§2.3-#6] [P1-§2.3-#7].
- `stat-callout` · cifra dominante; `pull-quote` · cita jerárquica [P1-§5.1].
- `progress-indicator` · formato largo [P1-§6.2].
- `question-prompt` / `answer-reveal` · recuperación activa [P1-§8].
- `otro` · escape hatch libre con descripción + prompt IA.

## Casos

- **Fireship** [P2-ficha-fireship]: densidad alta de `callout`,
  `stat-callout` y `lower-third` alineados al WPM alto
  [P2-edicion-patrones].
- **Kurzgesagt** [P2-ficha-kurzgesagt]: icon-language base,
  `chapter-marker` para segmentar, `pull-quote` dominante.
- **3Blue1Brown** [P2-ficha-3b1b]: `callout` de término en ecuación
  con color + movimiento sincronizado a la voz.
- **Explainer económico** (cross-género): `stat-callout` de inflación
  + `pull-quote` del banco central + `chapter-marker` entre fases.

## Anti-patrón

**Overlay decorativo sin función** (partículas, logos flotantes,
swoosh): violan coherencia [P1-§2.3-#1] [P2-edicion-antipatrones].
**Overlay permanente** (lower-third a 20s, callout que no desaparece):
atención se habitúa [P1-§2.3-#2]. **`otro` sin descripción:** sin
prompt IA deja al editor sin input. **Lower-third mal posicionado:**
fuera del tercio inferior o tapando el rostro viola [P1-§5.3].

## Heurística numérica

- **Duración:** intro/outro 2-5s · lower-third y chapter-marker 3-5s
  · callout, stat-callout, pull-quote 1-3s · progress-indicator
  continuo o al cambiar de sección · question-prompt pausa 2-4s
  antes del answer-reveal [P1-§8].
- **Densidad:** 2-4/min en tutorial técnico denso; ≤1/min en
  divulgación narrada con b-roll denso [P2-edicion-patrones].
- **Paleta:** 2-3 colores consistentes con señalización [P1-§2.3-#1].

## Ajuste por eje

### Por `grado-edicion`

- **`heavy`:** catálogo completo de overlays — lower-third, callout, chapter-marker, stat-callout, pull-quote, progress-indicator, question-prompt/answer-reveal, idea-bulb, separador. Uso denso pero funcional; cada overlay pasa el test de coherencia [P1-§2.3-#1]. Kurzgesagt y Nerdwriter operan aquí.
- **`medium`:** subset principal — lower-third (identificación de persona), chapter-marker (segmentación), callout ocasional. Evitar overlays decorativos (stickers, emojis animados sin función). Ali Abdaal, Matt D'Avella operan aquí.
- **`light`:** overlays mínimos — lower-third al presentar speaker o invitado + chapter-marker por tema. Sin callouts. TED, conferencia grabada, podcast audiovisual.
- **`zero`:** overlays en vivo vía OBS — browser sources (chat overlay, alerts), overlays de streaming (Streamlabs, StreamElements). No hay post-producción; los overlays son decisión de ejecución en vivo. Ver [P3-modalidades-live].

## Conflictos conocidos

- **Canal visual saturado** (Kurzgesagt-style): desactivar en bloques
  con motion graphics intensos.
- **Densidad vs audiencia principiante:** bajar densidad si no es técnica.

## Salida esperada

Lista por bloque, ordenada por timestamp:

```
OVERLAYS AUXILIARES
  B1  intro-animada    00:00-00:04  branding + título
  B2  lower-third      00:34-00:39  "Economista senior · Banxico"
  B3  stat-callout     01:12-01:15  "8.3% inflación anual"
  B4  pull-quote       02:11-02:16  "...cambia la función de reacción"
  B5  chapter-marker   03:00-03:03  "Fase 2 — Post-crisis"
  B6  question-prompt  04:20-04:24  "¿Mecanismo de transmisión?"
  B6  answer-reveal    04:26-04:29  "Tasa → crédito → consumo"
  B7  otro             05:10-05:12  "mapa animado de la región"
HERRAMIENTA: Remotion (intros + lower-thirds) [P3-edicion-composicion];
HyperFrames para callouts y stat-callouts generados por agente IA.
```

Cada entry: bloque, tipo, timestamps, descripción o prompt IA, herramienta.
