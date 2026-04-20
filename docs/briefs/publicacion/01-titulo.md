---
decision: publicacion/01-titulo
etapa: publicacion
pregunta: ¿Qué título promete la recompensa sin sobreprometerla?
fuentes:
  - P1-§1.3                    # anticipación dopaminérgica
  - P1-§6.2                    # open loops
  - P2-publicacion-patrones
  - P2-idea-guion-patrones
  - P2-ficha-fireship          # títulos "X in 100 seconds"
  - P2-ficha-veritasium        # títulos pregunta contraintuitiva
  - P2-ficha-midudev           # títulos hispanos stake productivo
  - P2-ficha-3b1b              # títulos pregunta matemática
  - P3-publicacion-analitica   # TubeBuddy / VidIQ A/B
admite-variantes: true
varia-por-eje: [arco-dominante, objetivo-cognitivo, plataforma]
sync: 2026-04-20
version: 2
---

## Principio aplicable

**Promesa cumplible genera predicción dopaminérgica positiva** [P1-§1.3].
Sobreprometer (clickbait) produce error de predicción negativo: el
viewer abandona en los primeros 30-60s, la retention curve cae, el
algoritmo reduce distribución. Subprometer deja click-through bajo.
El balance está en **específico + stakes** sin inflar.

**Open loop en el título** [P1-§6.2]: pregunta o afirmación incompleta
que sólo se resuelve viendo el video. Top performer estructural en
formatos 0-3 min [P2-publicacion-patrones].

## Casos

- **"X in 100 seconds" — Fireship** [P2-ficha-fireship]: promesa de
  tiempo + específico del qué. Cumple exacto. Ratio views/subs >1.0.
- **Pregunta contraintuitiva — Veritasium** [P2-ficha-veritasium]:
  "Why are these 3 letters on almost all of my zippers?" Open loop
  puro. 8.1M views.
- **Stake productivo hispano — Midudev** [P2-ficha-midudev]:
  "¿Qué es Vite?" Stake implícito (tu webpack tarda 45s). Simple,
  directo.
- **Pregunta matemática — 3B1B** [P2-ficha-3b1b]: "But what is a
  Laplace Transform?" El "but" marca rupture cognitiva. 1.5M views
  para 34:41 de duración.

## Anti-patrón

**Clickbait sin cumplimiento** ("NO vas a CREER lo que pasa con Bun"):
cae retention en los primeros 30s, el algoritmo castiga.

**Título descriptivo plano** ("Tutorial de cómo instalar Bun"): cero
stake, cero open loop. Compite mal en thumbnails side-by-side con
títulos con promesa.

**"Ultimate guide to X" sin entregar guía definitiva** (>20 min, todo
superficial): sobreprometer la profundidad.

**Título sobrecargado >60 caracteres**: se trunca en previews de
mobile y cards. La promesa se corta antes de entregarse.

## Heurística numérica

- **Longitud:** ≤60 caracteres (legible en thumbnail/preview mobile).
- **Palabras:** 6-12 típicamente. <6 suele ser demasiado vago;
  >12 difícil de escanear.
- **Números específicos aumentan CTR** (ej. "7 minutos", "100 segundos",
  "3 comandos"): dan especificidad + promesa acotada.

## Ajuste por eje

### Por `arco-dominante`

- **`expositivo`:** título = afirmación o pregunta provocativa ("X in 100 Seconds", "Why Y doesn't work").
- **`narrativo`:** título = promesa de historia ("How Z happened", "The real story behind W").
- **`argumentativo`:** título = tesis o giro ("Why everyone is wrong about X", "The case for Y"). Abre open loop argumentativo.
- **`performativo`:** título = promesa procedimental ("Build X in N minutes", "How to do Y").
- **`conversacional`:** título = invitado + tema ("Elon Musk: AI, Twitter, and the Future").

### Por `objetivo-cognitivo`

- **`adquirir-habilidad`:** título utilitario con tiempo/alcance.
- **`corregir-intuicion`:** título contraintuitivo explícito ("You've been doing X wrong").
- **`decidir-informado`:** título comparativo ("X vs Y: which should you use?").
- **`orientarse`:** título de mapeo ("The landscape of X", "Everything about Y").
- **`formar-opinion`:** título-tesis; admite polémica controlada.
- **`apreciar`:** título evocativo/poético; sin utility pitch.

### Por `plataforma`

- **`long-form-horizontal`:** 40-70 chars, título + packaging completos.
- **`shorts-vertical`:** título corto, ≤40 chars, hook implícito.
- **`podcast-audio-primario`:** "Name of guest: topic" formato estándar (Lex Fridman).
- **`corporate-lms`:** título descriptivo formal ("Módulo N: X"), sin packaging marketing.

## Conflictos conocidos

Ninguno directo.

## Salida esperada

- Título final ≤60 caracteres.
- Justificación del ángulo elegido (stake / open loop / número específico).
- Opcional: 2-3 alternativas testeadas con TubeBuddy/VidIQ A/B si
  disponible [P3-publicacion-analitica].
