# video-explainer-guide

Guía estructurada, en forma de plugin de Claude Code, para producir **explainer videos con intención pedagógica** — tutoriales técnicos, divulgación científica, video-ensayo, documental narrativo, periodismo analítico visual, explainer comercial, how-to, onboarding, conferencia grabada, live stream educativo, podcast audiovisual, personal essay con intención de enseñar — basada en evidencia cognitiva, teoría del medio y casos actuales.

## Qué problema resuelve

Hacer un buen explainer video es una cadena larga de decisiones acopladas: a quién le hablas, cuál es la promesa, cómo abres, cómo estructuras, qué muestras encuadre por encuadre, qué grabas, cómo editas, cómo publicas. Cada decisión tiene consecuencias cognitivas, narrativas y técnicas. Esta guía te acompaña decisión por decisión con justificación citable a fuente.

**No** cubre vlogs, reacciones, gameplay, entretenimiento puro, videoclips musicales ni contenido donde no hay un concepto o habilidad para transferir al espectador.

## Filosofía

Arquitectura de 3 capas con trazabilidad dura de toda recomendación a una fuente citable.

### Capa 1 — Pilares (source of truth)

1. **Fundamentos cognitivos y teoría del medio** — *estable*. Ciencia verificada (Mayer, Sweller, Paivio, Bjork, Roediger, Cepeda) + teoría del cine documental, ensayo fílmico, retórica visual y active learning según aplique a cada modalidad. Cambia 1–2 veces por año.
2. **Tendencias y casos de éxito** — *dinámico*. Lo que funciona ahora en plataformas y formatos, con fichas por creador (Fireship, Veritasium, Kurzgesagt, Nerdwriter, Johnny Harris, TED, Lex Fridman, ThePrimeagen, Ali Abdaal, etc.). Cambia en semanas/meses.
3. **Herramientas** — *dinámico*. Software vigente, releases, alternativas — desde edición y motion hasta live streaming, podcast multi-mic y data-journalism. Agnóstico de hardware.

Todo claim tiene un **ID estable** (`[P1-§2.3-#8]`, `[P2-ficha-fireship]`, `[P3-edicion-postproc]`). Los IDs sobreviven renombres. Cuando pilar 2 o 3 contradice pilar 1, el conflicto se **flaggea al usuario**, no se resuelve en silencio — pilar 1 prevalece salvo override explícito.

### Capa 2 — Briefs (síntesis precomputada)

43 briefs en `docs/briefs/<etapa>/NN-slug.md` (6+8+4+7+10+8), uno por decisión crítica. Cada brief es un ensamblaje denso de 40–100 líneas con contrato estricto: principio cognitivo + 2–3 casos concretos + anti-patrón + heurística numérica + conflictos conocidos + salida esperada. ≥5 citas a IDs estables por brief.

Los briefs son la capa que los skills consumen en runtime. **Los skills NO leen pilares completos.**

### Capa 3 — Skills (consumen briefs)

Uno por etapa de producción. Cada skill carga los briefs de su etapa, camina al creador por las decisiones en orden, propone con cita trazable, flaggea conflictos, espera aprobación.

**Contrato con estado (storyboard).** El Production Brief que produce `storyboard-explainer` lleva un header `estado: draft | locked` + `locked-at: YYYY-MM-DD`. Mientras está `draft`, es iterable. Una vez `locked`, es el contrato firme que `record-explainer` y `edit-explainer` consumen sin re-discutir (requisitos de captura, mapa de escenas, transiciones por bloque). Cambios post-lock vuelven explícitamente al storyboard.

## Estructura

```
video-explainer-guide/
├── .claude-plugin/
│   ├── plugin.json
│   └── marketplace.json
├── skills/
│   ├── create-explainer/                 # Orquestador (entry point)
│   ├── concept-explainer/                # Etapa 0: idea → Concept Brief
│   ├── script-explainer/                 # Etapa 1: Concept Brief → guión
│   ├── storyboard-explainer/             # Etapa 2 opcional: Production Brief
│   ├── record-explainer/                 # Etapa 3: pre-producción y captura
│   ├── edit-explainer/                   # Etapa 4: edición y post
│   ├── publish-explainer/                # Etapa 5: publicación y medición
│   ├── update-trends/                    # Mantenimiento del pilar 2
│   ├── update-tools/                     # Mantenimiento del pilar 3
│   └── sync-briefs/                      # Re-sincroniza briefs tras cambios en pilares
├── docs/
│   ├── pilares/
│   │   ├── 01-fundamentos-cognitivos.md
│   │   ├── 02-tendencias-y-casos.md
│   │   └── 03-herramientas.md
│   ├── briefs/<etapa>/NN-slug.md         # 43 briefs con contrato estricto
│   ├── casos-de-exito/                   # Fichas de creators por nicho
│   └── vistas-por-etapa/                 # Índices auto-generados
├── scripts/
│   ├── verificar-briefs.sh               # Detecta drift brief ↔ pilar (--strict para hooks/CI)
│   ├── regenerar-vistas.sh               # Regenera vistas-por-etapa
│   └── hook-verificar-pilares.sh         # Hook PostToolUse sobre docs/pilares/**
└── .claude/settings.json                 # Hook de drift-detection registrado
```

## Uso

Al iniciar una conversación sobre crear un explainer video con intención pedagógica, el skill `create-explainer` se auto-invoca. Identifica la etapa y delega al skill específico.

Ejemplos que detonan el orquestador:
- "Quiero hacer un tutorial sobre X"
- "Voy a grabar un explainer de 3 minutos sobre Y"
- "Estoy preparando un video-ensayo argumentando Z"
- "Voy a producir un documental narrativo sobre..."
- "Quiero grabar un podcast audiovisual con un experto"
- "Estoy editando un video-lección y no sé dónde cortar"
- "Voy a publicar y dudo del thumbnail"

También puedes invocar skills directamente:
- `/concept-explainer` — idea → Concept Brief (audiencia, objetivo, promesa, ángulo, formato, plataforma, tono, restricciones)
- `/script-explainer` — Concept Brief → guión
- `/storyboard-explainer` — storyboard + pacing + shotlist (opcional, recomendado cuando hay plano visual)
- `/record-explainer` — grabación
- `/edit-explainer` — edición y post
- `/publish-explainer` — publicación y medición
- `/update-trends` — refrescar pilar 2
- `/update-tools` — refrescar pilar 3
- `/sync-briefs` — re-sincronizar briefs tras cambios en pilares

## Instalación

Como plugin local de Claude Code, clona el repo y regístralo:

```bash
git clone <url> <destino>
```

Configura Claude Code para descubrir el plugin desde esa ruta (mecanismo según versión).

## Mantenimiento

Las capas dinámicas requieren revisión periódica:
- **Pilar 2** cada 4–8 semanas → `/update-trends`.
- **Pilar 3** cada 2–4 semanas (o tras releases mayores) → `/update-tools`.
- **Pilar 1** 1–2 veces al año o cuando aparezca evidencia nueva relevante.

Cada item en pilares dinámicos lleva fecha de última verificación. Cuando editas un pilar, el hook `PostToolUse` corre `verificar-briefs.sh --strict` automáticamente y avisa si hay briefs stale. Si aparece el aviso, invoca `/sync-briefs`.

## Diseño y trazabilidad

- Cada recomendación cita el ID estable de su fuente (`[P1-§2.3-#8]`).
- El pilar 1 está depurado de pseudociencia (sin "8 segundos de atención", sin cromoterapia, sin "neuronas espejo").
- `verificar-briefs.sh` detecta drift por rango de sección entre briefs y pilares, typos en IDs, e IDs inline no declarados en frontmatter. Zero-dependency (bash + git + grep + awk).
- El hook de drift-detection avisa sin bloquear: `exit 0` siempre.

## Contenido

El contenido está en español de México (pilares, briefs, prose de los SKILL.md, vistas, fichas de creators). Los slugs públicos del plugin (nombre del paquete, nombres de skills) están en inglés técnico por convención del ecosistema de Claude Code.

## Licencia

MIT.
