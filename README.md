# learning-video-runbook

Runbook estructurado, en forma de plugin de Claude Code, que guía la producción de **video con intención pedagógica** —tutoriales técnicos, divulgación, formación corporativa, onboarding, contenido explicativo para público general— basado en evidencia cognitiva y casos actuales.

## Filosofía

Arquitectura de 3 capas con trazabilidad dura de toda recomendación a una fuente citable.

### Capa 1 — Pilares (source of truth)

1. **Fundamentos cognitivos** — *estable*. Ciencia verificada (Mayer, Sweller, Paivio, Bjork, Roediger, Cepeda, etc.). Cambia 1–2 veces por año.
2. **Tendencias y casos de éxito** — *dinámico*. Lo que funciona ahora en plataformas y formatos, con fichas por creador. Cambia en semanas/meses.
3. **Herramientas** — *dinámico*. Software vigente, releases, alternativas. Agnóstico de hardware.

Todo claim tiene un **ID estable** (`[P1-§2.3-#8]`, `[P2-ficha-fireship]`, `[P3-edicion-postproc]`). Los IDs sobreviven renombres. Cuando pilar 2 o 3 contradice pilar 1, el conflicto se **flaggea al usuario**, no se resuelve en silencio — pilar 1 prevalece salvo override explícito.

### Capa 2 — Briefs (síntesis precomputada)

34 briefs en `docs/briefs/<etapa>/NN-slug.md`, uno por decisión crítica. Cada brief es un ensamblaje denso de 40–100 líneas con contrato estricto: principio cognitivo + 2–3 casos concretos + anti-patrón + heurística numérica + conflictos conocidos + salida esperada. ≥5 citas a IDs estables por brief.

Los briefs son la capa que los skills consumen en runtime. **Los skills NO leen pilares completos.**

### Capa 3 — Skills (consumen briefs)

Uno por etapa de producción. Cada skill carga los briefs de su etapa, camina al creador por las decisiones en orden, propone con cita trazable, flaggea conflictos, espera aprobación.

## Estructura

```
learning-video-runbook/
├── .claude-plugin/
│   ├── plugin.json
│   └── marketplace.json
├── skills/
│   ├── crear-entrenamiento/                  # Orquestador (entry point)
│   ├── guion-entrenamiento/                  # Etapa 1: idea → guión
│   ├── previsualizacion-entrenamiento/       # Etapa 2 opcional: Production Brief
│   ├── grabacion-entrenamiento/              # Etapa 3: pre-producción y captura
│   ├── edicion-entrenamiento/                # Etapa 4: edición y post
│   ├── publicacion-entrenamiento/            # Etapa 5: publicación y medición
│   ├── actualizar-tendencias/                # Mantenimiento del pilar 2
│   ├── actualizar-herramientas/              # Mantenimiento del pilar 3
│   └── sincronizar-briefs/                   # Re-sincroniza briefs tras cambios en pilares
├── docs/
│   ├── pilares/
│   │   ├── 01-fundamentos-cognitivos.md
│   │   ├── 02-tendencias-y-casos.md
│   │   └── 03-herramientas.md
│   ├── briefs/<etapa>/NN-slug.md             # 34 briefs con contrato estricto
│   ├── casos-de-exito/                       # Fichas de creators por nicho
│   └── vistas-por-etapa/                     # Índices auto-generados
├── scripts/
│   ├── verificar-briefs.sh                   # Detecta drift brief ↔ pilar (--strict para hooks/CI)
│   ├── regenerar-vistas.sh                   # Regenera vistas-por-etapa
│   └── hook-verificar-pilares.sh             # Hook PostToolUse sobre docs/pilares/**
└── .claude/settings.json                     # Hook de drift-detection registrado
```

## Uso

Al iniciar una conversación sobre crear contenido con intención pedagógica, el skill `crear-entrenamiento` se auto-invoca. Identifica la etapa y delega al skill específico.

Ejemplos que detonan el orquestador:
- "Quiero hacer un tutorial sobre X"
- "Voy a grabar un explainer de 3 minutos"
- "Estoy editando este video y no sé dónde cortar"
- "Voy a publicar y dudo del thumbnail"

También podés invocar skills directamente:
- `/guion-entrenamiento` — guión
- `/previsualizacion-entrenamiento` — storyboard + pacing + shotlist (opcional, recomendado)
- `/grabacion-entrenamiento` — grabación
- `/edicion-entrenamiento` — edición
- `/publicacion-entrenamiento` — publicación
- `/actualizar-tendencias` — refrescar pilar 2
- `/actualizar-herramientas` — refrescar pilar 3
- `/sincronizar-briefs` — re-sincronizar briefs tras cambios en pilares

## Instalación

Como plugin local de Claude Code, cloná el repo y registralo:

```bash
git clone <url> <destino>
```

Configurá Claude Code para descubrir el plugin desde esa ruta (mecanismo según versión).

## Mantenimiento

Las capas dinámicas requieren revisión periódica:
- **Pilar 2** cada 4–8 semanas → `/actualizar-tendencias`.
- **Pilar 3** cada 2–4 semanas (o tras releases mayores) → `/actualizar-herramientas`.
- **Pilar 1** 1–2 veces al año o cuando aparezca evidencia nueva relevante.

Cada item en pilares dinámicos lleva fecha de última verificación. Cuando editás un pilar, el hook `PostToolUse` corre `verificar-briefs.sh --strict` automáticamente y avisa si hay briefs stale. Si aparece el aviso, invocá `/sincronizar-briefs`.

## Diseño y trazabilidad

- Cada recomendación cita el ID estable de su fuente (`[P1-§2.3-#8]`).
- El pilar 1 está depurado de pseudociencia (sin "47 segundos de atención", sin cromoterapia, sin "neuronas espejo").
- `verificar-briefs.sh` detecta drift por rango de sección entre briefs y pilares, typos en IDs, e IDs inline no declarados en frontmatter. Zero-dependency (bash + git + grep + awk).
- El hook de drift-detection avisa sin bloquear: `exit 0` siempre.

## Licencia

MIT.
