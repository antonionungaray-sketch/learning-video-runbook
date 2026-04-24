---
decision: concepto/06-tono-y-restricciones
etapa: concepto
pregunta: ¿Qué registro de voz y qué restricciones (recursos, branding, accesibilidad, plazos)?
fuentes:
  - P1-§2.3-#10                  # personalización: lenguaje conversacional
  - P1-§2.3-#11                  # voz humana cálida (efecto base)
  - P1-§5.4                      # voz humana vs TTS moderno (brecha cerrada)
  - P1-§3.2                      # contraste — estándares objetivos
  - P1-§5.2                      # subtítulos: 15-20 CPS, 2 líneas, 37-42 chars/línea
  - P2-ficha-mouredev            # tono cercano hispano
  - P2-ficha-midudev             # registro casual técnico
  - P2-ficha-mike-meyers         # registro instructor-certificación
  - P1-§9.2                      # voz documental (narrador-omnisciente)
  - P1-§11.3                     # investigación visible (rol investigador)
admite-variantes: false
varia-por-eje: [rol-presentador, arco-dominante]
sync: 2026-04-19
version: 2
---

## Principio aplicable

**Lenguaje conversacional ("tú", "nosotros") supera al lenguaje formal
en transferencia de aprendizaje, sin sacrificar autoridad percibida**
[P1-§2.3-#10]. El principio de personalización mantiene efecto robusto
en evidencia reciente. La elección de registro NO es estilística — es
cognitiva.

**Voz humana cálida vs TTS moderno: la brecha se cerró** [P1-§5.4]. Lo
que importa es naturalidad prosódica y ausencia de artefactos, más que
origen humano vs sintético per se. El efecto base de Mayer #11
[P1-§2.3-#11] sigue válido como dirección, pero TTS de alta calidad
con prosodia natural ya entrega resultados comparables.

**Las restricciones son contrato del proyecto, no detalles operativos.**
Branding, recursos disponibles, accesibilidad obligatoria y plazos
definen qué decisiones downstream son viables. Postergarlas a
grabación o edición produce re-trabajo.

## Casos

- **Tono cercano hispano técnico** [P2-ficha-mouredev]: live-coding
  Twitch → YouTube, "vosotros" peninsular, modela errores honestos
  ("se me cayó esto, vamos a ver"). Personalización máxima.
- **Casual técnico hispano** [P2-ficha-midudev]: tech-news reactivo,
  "vamos a ver", anglicismos aceptados (`deploy`, `commit`), WPM ~188
  con pausas explícitas.
- **Instructor-certificación formal** [P2-ficha-mike-meyers]: registro
  profesoral, vocabulario técnico explícito y consistente con syllabus
  oficial (CompTIA, etc.). El registro formal aquí tiene función:
  preparación de examen.

## Anti-patrón

**Registro neutro corporativo sin personalización** [P1-§2.3-#10]. "El
usuario deberá presionar el botón" en lugar de "presionás el botón"
degrada transferencia sin ganar autoridad.

**Subtítulos como afterthought** [P1-§5.2]. Velocidades >20 CPS o
líneas >42 caracteres degradan comprensión. Si son obligatorios,
entran en el contrato del concepto, no se negocian en edición.

**Branding ignorado hasta edición** [P1-§3.2]. Si el cliente exige
paleta con contraste insuficiente (<4.5:1 body, <3:1 large text WCAG
AA), descubrirlo en edición fuerza re-design o degrada accesibilidad.

## Heurística numérica

- **Contraste mínimo no negociable:** 4.5:1 cuerpo, 3:1 texto grande
  (WCAG 2.2 AA) [P1-§3.2]. Cualquier branding que no cumpla queda
  flaggeado aquí.
- **Subtítulos:** 15-20 CPS, ≤2 líneas, 37-42 chars/línea
  [P1-§5.2]. Si la audiencia incluye no-nativos, bajar al límite
  inferior.
- **Registro:** segunda persona singular ("tú") o plural ("vosotros" /
  "ustedes") según mercado destino — definir aquí, no en guión.

## Ajuste por eje

### Por `rol-presentador`

- **`experto-neutral`:** registro profesoral o corporativo, 2a/3a persona indistinta, autoridad vía competencia. Tono estable, sin inflexiones personales.
- **`narrador-1a-persona`:** registro íntimo-autoral, "yo pienso / descubrí / propongo". Admite pausas, dudas, digresiones funcionales. Nerdwriter, Contrapoints, Matt D'Avella.
- **`narrador-omnisciente`:** registro impersonal formal, 3a persona, voice-of-god documental. Sin inflexiones personales; control prosódico alto [P1-§9.2].
- **`investigador`:** registro semi-autoral — aparece "yo descubrí X" pero dominante es exposición. Dudas mostradas como parte del método [P1-§11.3].
- **`demostrador`:** registro cercano, 2a persona, imperfecto ("vamos a ver", "me equivoqué aquí"). Modela metacognición y errores honestos [P2-ficha-mouredev].
- **`conversador`:** tono emergente del diálogo; no se prescribe. Pilar 1 §9.2 sobre voice of encounter.
- **`anfitrion-de-experto`:** registro de introducción formal + humildad curiosa. Lex Fridman, Huberman con invitado.

### Por `arco-dominante`

- **`expositivo`:** registro claro, 2a persona inclusiva, lenguaje conversacional [P1-§2.3-#10].
- **`narrativo`:** registro evocador, tiempo narrativo, ritmo pausado para construir escena.
- **`argumentativo`:** registro retórico, 1a persona autoral, admite inflexiones emocionales controladas.
- **`performativo`:** registro operativo, imperativo conversacional ("ahora abrimos", "vemos que"), pausa-para-probar integrada al fraseo.
- **`conversacional`:** registro natural de diálogo; no prescribible.

## Conflictos conocidos

**Branding corporativo con contraste insuficiente** [P1-§3.2]. El
cliente exige paleta institucional que no llega a WCAG AA. El toolkit
NO resuelve en silencio: o se ajusta la paleta para cumplir, o se
documenta el incumplimiento como decisión informada del cliente.

**Voz humana exigida vs presupuesto/timeline para TTS** [P1-§5.4]
[P1-§2.3-#11]. La evidencia reciente reduce la brecha; si el proyecto
no tiene voz disponible y el plazo no permite contratar locutor,
TTS de alta calidad con prosodia natural es opción legítima
flaggeada como decisión consciente.

## Salida esperada

Cinco datos:

- **Registro:** "[formal | cercano | casual técnico | instructor-cert]".
- **Persona gramatical:** "[tú | usted | vosotros | ustedes | nosotros]".
- **Branding:** "[paleta + tipografía + contraste verificado vs WCAG AA]".
- **Accesibilidad obligatoria:** "[subs sí/no + idioma; AD si aplica;
  excepción al principio de redundancia justificada]".
- **Recursos y plazos:** "[equipo, software, fecha de entrega target]".
