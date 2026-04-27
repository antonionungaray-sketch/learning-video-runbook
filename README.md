# video-explainer-guide

Guía estructurada, en forma de plugin de Claude Code, para producir contenido **con intención pedagógica** — basada en evidencia cognitiva, teoría del medio y casos actuales. Cubre dos familias de output:

- **Explainer videos** — tutoriales técnicos, divulgación científica, video-ensayo, documental narrativo, periodismo analítico visual, explainer comercial, how-to, onboarding, conferencia grabada, live stream educativo, podcast audiovisual, personal essay con intención de enseñar.
- **Material didáctico no-video** *(desde v1.4.0)* — láminas didácticas secuenciales (estilo libro de historia ilustrado), slides para presentar en vivo (formato Marp), long-form escrito con visualizaciones embebidas. Útil para explicar conceptos difíciles a audiencias sin experiencia.

## Qué problema resuelve

Producir buen contenido pedagógico —video o estático— es una cadena larga de decisiones acopladas: a quién le hablas, cuál es la promesa, cómo abres, cómo estructuras, qué muestras encuadre por encuadre o panel por panel, cómo lo aterrizas. Cada decisión tiene consecuencias cognitivas, narrativas y técnicas. Esta guía te acompaña decisión por decisión con justificación citable a fuente.

**No** cubre vlogs, reacciones, gameplay, entretenimiento puro, videoclips musicales, memes, anuncios puros sin componente explicativo, ni contenido donde no hay un concepto o habilidad para transferir al espectador o lector.

## Filosofía

Arquitectura de 3 capas con trazabilidad dura de toda recomendación a una fuente citable.

### Capa 1 — Pilares (source of truth)

1. **Fundamentos cognitivos y teoría del medio** — *estable*. Ciencia verificada (Mayer, Sweller, Paivio, Bjork, Roediger, Cepeda) + teoría del cine documental, ensayo fílmico, retórica visual y active learning según aplique a cada modalidad. Cambia 1–2 veces por año.
2. **Tendencias y casos de éxito** — *dinámico*. Lo que funciona ahora en plataformas y formatos, con fichas por creador (Fireship, Veritasium, Kurzgesagt, Nerdwriter, Johnny Harris, TED, Lex Fridman, ThePrimeagen, Ali Abdaal, etc.). Cambia en semanas/meses.
3. **Herramientas** — *dinámico*. Software vigente, releases, alternativas — desde edición y motion hasta live streaming, podcast multi-mic y data-journalism. Agnóstico de hardware.

Todo claim tiene un **ID estable** (`[P1-§2.3-#8]`, `[P2-ficha-fireship]`, `[P3-edicion-postproc]`). Los IDs sobreviven renombres. Cuando pilar 2 o 3 contradice pilar 1, el conflicto se **flaggea al usuario**, no se resuelve en silencio — pilar 1 prevalece salvo override explícito.

### Capa 2 — Briefs (síntesis precomputada)

50 briefs en `docs/briefs/<etapa>/NN-slug.md` (6 concepto + 8 guion + 4 previsualización + 7 grabación + 10 edición + 8 publicación + 7 material), uno por decisión crítica. Cada brief es un ensamblaje denso de 40–120 líneas con contrato estricto: principio cognitivo + 2–3 casos concretos + anti-patrón + heurística numérica + conflictos conocidos + salida esperada. ≥5 citas a IDs estables por brief.

Los briefs son la capa que los skills consumen en runtime. **Los skills NO leen pilares completos.**

### Capa 3 — Skills (consumen briefs)

Uno por etapa de producción. Cada skill carga los briefs de su etapa, camina al creador por las decisiones en orden, propone con cita trazable, flaggea conflictos, espera aprobación.

**Contrato con estado (briefs lockeables).** Tres skills producen briefs con header `estado: draft | locked` + `locked-at: YYYY-MM-DD`:
- `concept-explainer` produce un **Concept Brief** (audiencia, objetivo, promesa, ángulo, formato, plataforma, tono, restricciones) que el resto del flujo de video consume read-only.
- `storyboard-explainer` produce un **Production Brief** (storyboard, pacing, shotlist, requisitos de captura) que `record-explainer` y `edit-explainer` consumen.
- `material-explainer` produce un **Didactic Brief** (concepto, audiencia, objetivo cognitivo, mapa conceptual, secuencia didáctica, estilo visual) que se materializa en uno o varios formatos (láminas / slides / long-form).

Mientras está `draft`, el brief es iterable. Una vez `locked`, es contrato firme; cambios post-lock requieren re-invocar la skill correspondiente.

## Estructura

```
video-explainer-guide/
├── .claude-plugin/
│   ├── plugin.json
│   └── marketplace.json
├── skills/
│   ├── create-explainer/                 # Orquestador (entry point) — bifurca video vs material
│   ├── concept-explainer/                # Video etapa 0: idea → Concept Brief
│   ├── script-explainer/                 # Video etapa 1: Concept Brief → guión
│   ├── storyboard-explainer/             # Video etapa 2 opcional: Production Brief
│   ├── record-explainer/                 # Video etapa 3: pre-producción y captura
│   ├── edit-explainer/                   # Video etapa 4: edición y post
│   ├── publish-explainer/                # Video etapa 5: publicación y medición
│   ├── material-explainer/               # Material no-video: Didactic Brief → láminas / slides / long-form
│   ├── setup-environment/                # Perfil de entorno (OS, hardware, herramientas)
│   ├── update-trends/                    # Mantenimiento del pilar 2
│   ├── update-tools/                     # Mantenimiento del pilar 3
│   └── sync-briefs/                      # Re-sincroniza briefs tras cambios en pilares
├── docs/
│   ├── pilares/
│   │   ├── 01-fundamentos-cognitivos.md
│   │   ├── 02-tendencias-y-casos.md
│   │   └── 03-herramientas.md
│   ├── briefs/<etapa>/NN-slug.md         # 50 briefs con contrato estricto (incluye material/)
│   ├── casos-de-exito/                   # Fichas de creators por nicho
│   ├── vistas-por-etapa/                 # Índices auto-generados (incluye material.md)
│   └── arquitectura/                     # 5 ejes + 12 modalidades
├── scripts/
│   ├── verificar-briefs.sh               # Detecta drift brief ↔ pilar (--strict para hooks/CI)
│   ├── regenerar-vistas.sh               # Regenera vistas-por-etapa
│   └── hook-verificar-pilares.sh         # Hook PostToolUse sobre docs/pilares/**
└── .claude/settings.json                 # Hook de drift-detection registrado
```

## Uso

Al iniciar una conversación sobre crear contenido pedagógico, el skill `create-explainer` se auto-invoca. Pregunta primero **video vs material estático** y luego delega al flujo correspondiente.

Ejemplos que detonan el orquestador hacia **video**:
- "Quiero hacer un tutorial sobre X"
- "Voy a grabar un explainer de 3 minutos sobre Y"
- "Estoy preparando un video-ensayo argumentando Z"
- "Voy a producir un documental narrativo sobre..."
- "Quiero grabar un podcast audiovisual con un experto"
- "Estoy editando un video-lección y no sé dónde cortar"
- "Voy a publicar y dudo del thumbnail"

Ejemplos que detonan el orquestador hacia **material no-video**:
- "Quiero explicar [concepto difícil] a alguien sin experiencia"
- "Necesito una presentación de 30 min sobre X para una audiencia técnica"
- "Voy a hacer una serie de láminas didácticas sobre Y"
- "Quiero escribir un long-form que explique Z con visualizaciones"

También puedes invocar skills directamente:

**Flujo de video:**
- `/concept-explainer` — idea → Concept Brief (audiencia, objetivo, promesa, ángulo, formato, plataforma, tono, restricciones)
- `/script-explainer` — Concept Brief → guión
- `/storyboard-explainer` — storyboard + pacing + shotlist (opcional, recomendado cuando hay plano visual)
- `/record-explainer` — grabación
- `/edit-explainer` — edición y post
- `/publish-explainer` — publicación y medición

**Flujo de material no-video:**
- `/material-explainer` — concepto + audiencia + objetivo cognitivo → Didactic Brief → materializar en láminas didácticas (`prompts-laminas.md`), slides para presentar en vivo (`slides.md` formato Marp), o long-form escrito (`articulo.md`). La generación de imágenes se delega a herramientas externas (Claude artifact, GPT image, Midjourney) — la skill produce los prompts.

**Mantenimiento y configuración:**
- `/setup-environment` — configurar o actualizar tu perfil de entorno (OS, preferencias, hardware, herramientas). Los skills de etapa lo leen para adaptar recomendaciones a tu setup.
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
