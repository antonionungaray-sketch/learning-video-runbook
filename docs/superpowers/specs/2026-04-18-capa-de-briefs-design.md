# Spec — Capa de briefs precomputados para el training-video-toolkit

**Fecha:** 2026-04-18
**Estado:** Aprobado para planificación (writing-plans)
**Autor:** Antonio + Claude (brainstorming)

## Contexto

El `training-video-toolkit` guía al creador por las 4 etapas de producción (guión, grabación, edición, publicación) mediante skills. Hoy cada skill carga en runtime los pilares completos (~600 líneas) más la vista de su etapa. Esto tiene dos problemas:

1. **Ruido cognitivo.** El agente ve el pilar entero cuando solo necesita 1-2 secciones específicas para cada decisión. La señal está diluida en material inerte.
2. **Síntesis en runtime.** Cada vez que se decide (ej. el hook) el agente tiene que volver a armar "principio cognitivo + caso ejemplar + anti-patrón + heurística numérica" desde las fuentes planas. Es trabajo repetido en cada sesión.

La metáfora del usuario: un creador experimentado no revuelve toda su neurociencia cuando piensa en el hook — activa un *ensamblaje* pertinente (saliencia + dopamina + 2 ejemplos + el anti-patrón que lo mordió). El resto queda dormante. Queremos que el agente consuma información así.

**Decisión tomada en esta sesión de brainstorming:** precomputar esos ensamblajes como archivos markdown densos ("briefs") indexados por decisión crítica. Los skills de etapa cargan briefs en vez de pilares.

## Intended outcome

- Cada skill de etapa carga ~300-400 líneas *densas* (briefs de su etapa) en vez de ~600 líneas mayormente inertes.
- Cada decisión crítica tiene un brief autocontenido con principio + casos + anti-patrón + heurística + conflictos conocidos.
- Todas las afirmaciones de los briefs son trazables a un pilar por ID estable.
- Drift pilar↔brief es detectable por script en segundos.
- El flujo de producción del guión (8 decisiones acopladas) sigue siendo single-agent con contexto continuo; sub-agents entran solo como ideadores divergentes en decisiones que lo ameritan.

## Arquitectura (3 capas)

```
Capa 1 — PILARES (source of truth, unchanged)
  docs/pilares/{01-fundamentos, 02-tendencias, 03-herramientas}.md
  + IDs estables por sección (P1-§1.1, P1-§2.3-#8, P2-ficha-fireship, …)
           ▲
           │ citation + sync-date
           │
Capa 2 — BRIEFS (precomputed synthesis) — NUEVO
  docs/briefs/{guion,grabacion,edicion,publicacion}/NN-slug.md
  ~30 archivos de 40-80 líneas, 6 bloques fijos.
           ▲
           │ glob load
           │
Capa 3 — SKILLS DE ETAPA (modified)
  skills/{guion,grabacion,edicion,publicacion}-entrenamiento
  Preámbulo: "lee briefs/<mi-etapa>/*.md". Single-agent.
  Sub-agents solo para variantes divergentes de artefactos aislados.
```

### Invariantes

1. Ningún agente lee un pilar completo en runtime. Lee briefs.
2. Ningún brief hace claim sin citar al pilar (`[P1-§X.Y]` literal).
3. Briefs tienen fecha de sync; drift detectable por script.
4. Las decisiones se toman siempre en el main agent con contexto acumulado.
5. Sub-agents (cuando se usan) generan variantes, no decisiones.

## Estructura de un brief

**Frontmatter obligatorio:**

```yaml
---
decision: guion/02-hook
etapa: guion
pregunta: ¿Cómo captura atención bottom-up y promete recompensa cumplible?
fuentes:
  - P1-§1.1        # saliencia bottom-up
  - P1-§1.3        # anticipación dopaminérgica
  - P1-§7          # refutación "8s de atención"
  - P2-§Idea→Guión/patrón-stakes
  - P2-ficha-fireship
  - P2-ficha-midudev
admite-variantes: true
sync: 2026-04-18
version: 1
---
```

**6 bloques fijos en el cuerpo, en este orden:**

1. **Principio aplicable** — 3-5 líneas por principio, con cita inline `[P1-§X]`.
2. **Casos** (pilar 2) — 2-3 casos con métrica y ficha referenciada.
3. **Anti-patrón** — qué NO hacer, con evidencia.
4. **Heurística numérica (con caveat)** — número + caveat explicando qué es ciencia y qué convención.
5. **Conflictos conocidos** — tensiones entre pilares (típicamente P2 vs P1). Vacío permitido.
6. **Salida esperada** — qué artefacto produce esta decisión.

**Reglas fijas:**

- Longitud 40-80 líneas. Si pasa 100, la decisión se divide.
- Citaciones inline obligatorias en cada claim.
- Naming: `briefs/<etapa>/NN-slug.md` (NN = orden de flujo, 2 dígitos).
- Briefs NO se citan entre sí. Solo al pilar (mantiene el grafo como árbol).
- Ningún brief agrega conocimiento que no esté en el pilar. Descubrimientos nuevos van al pilar primero (vía `actualizar-tendencias`), al brief después.

**Lo que NO va en un brief:** prosa expositiva larga, decisiones operativas del usuario, referencias a otros briefs o vistas.

## Cambios en skills

### Skills de etapa (`guion-/grabacion-/edicion-/publicacion-entrenamiento`)

**Preámbulo de carga** cambia de "lee pilar 1 completo + pilar 2 sección X + …" a:

```
Lee todos los briefs de esta etapa:
  docs/briefs/<mi-etapa>/*.md

~6-8 archivos, 40-80 líneas cada uno, orden alfabético = orden de flujo.

NO leer pilares completos en runtime. Si durante el flujo necesitás
consultar un pilar directamente por una pregunta del usuario fuera del
scope de los briefs, usá Grep dirigido por ID (P1-§X.Y), no Read del
archivo completo.
```

**Flujo por decisión** cambia de "6 pasos con consultas múltiples al pilar" a:

```
Para cada decisión, en orden de briefs:
1. Plantear la `pregunta` del frontmatter del brief al usuario.
2. Evaluar test de determinismo upstream (ver sección Protocolo de variantes).
3. Proponer con justificación trazable usando Principio + Casos del brief.
   Si el brief lista Conflictos conocidos, flaggearlos explícitamente.
4. Tras aprobación, registrar la decisión.
```

**Plantilla de salida del guión** (hoy vive en `vistas-por-etapa/guion.md`) se mueve al preámbulo de la skill como contrato de formato, no como contenido cognitivo.

### Skill `crear-entrenamiento`

Sin cambios. Sigue identificando etapa y delegando.

### Skills `actualizar-tendencias` y `actualizar-herramientas`

Cambio mínimo — al final del flujo, tras aplicar cambios al pilar, correr `scripts/verificar-briefs.sh` y reportar al usuario los briefs marcados stale. No editan briefs automáticamente.

### Nuevo skill `sincronizar-briefs`

Skill chica (~40 líneas SKILL.md) que:

1. Corre `verificar-briefs.sh`.
2. Si 0 stale: reporta OK y termina.
3. Si N stale: para cada uno, muestra diff del pilar + brief actual. Pregunta por-brief: "¿el cambio afecta el brief? a) sí, edito / b) no, solo bumpeo sync / c) diferir".
4. Para las que elige "editar": propone edits line-by-line, usuario aprueba. Actualiza `sync:`.
5. Commit agregado: "Re-sync briefs tras cambios en pilares [fecha]".

## Destino de `vistas-por-etapa/`

**Las vistas sobreviven como artefactos derivados, no como fuente.**

Razones:
- Funcionalmente reemplazadas por briefs (más densos, mejor trazados).
- El skill ya no las necesita para cargar contexto.
- Mantienen valor para el humano que quiere auditar "qué decide la etapa de guión de un vistazo".

Un script `scripts/regenerar-vistas.sh` lee todos los `briefs/<etapa>/*.md`, extrae `decision` + `pregunta` + `fuentes` de cada frontmatter, emite `vistas-por-etapa/<etapa>.md`. Las vistas ya no se editan a mano.

## Protocolo de variantes (patrón híbrido)

Default: single-agent produce una propuesta por decisión. Sub-agents entran solo bajo este protocolo.

### Qué decisiones califican (lista explícita)

| Decisión | `admite-variantes` | Razón |
|---|---|---|
| `guion/02-hook` | `true` | Espacio creativo amplio; ángulos genuinamente distintos. |
| `guion/03-estructura` | `true` | Lineal / confusión productiva / problema-solución son alternativas reales. |
| `publicacion/01-thumbnail` | `true` | CCN-fit admite N soluciones visuales. |
| `publicacion/02-titulo` | `true` | Distintos ganchos verbales legítimos. |
| Resto (default) | `false` | Una respuesta correcta o derivada de decisiones previas. |

El flag vive en frontmatter del brief. La skill lo lee.

### Test de determinismo upstream (regla operativa)

En cada decisión con `admite-variantes: true`, tras la respuesta base del usuario, el skill evalúa:

> **Ofrecer variantes si al menos 2 de los `Casos` listados en el brief son razonablemente aplicables al contexto actual del usuario** (audiencia + objetivo + meta-formato + duración + tema + decisiones previas acumuladas). Si un solo caso domina → proponer uno.

**Ejemplos:**

- *Contexto: "devs senior, tutorial de Vite, 3min, stake productivo claro".* Solo el caso-Fireship aplica → propone un hook, no ofrece variantes.
- *Contexto: "público general, explainer sobre relatividad, 8min, sin visión clara".* Aplican casos-3B1B, -Veritasium, -Kurzgesagt → ofrece: "Veo 3 direcciones distintas que funcionan: [A], [B], [C]. Mi inclinación es [A] por [razón]. ¿Las exploramos o voy con [A]?".

### Contrato del dispatch a sub-agent

Cuando se dispatcha para generar variantes:

```
Task(
  subagent_type="general-purpose",
  description="Generar N variantes de <decision>",
  prompt="""
Sos un ideador divergente. Tarea: generar N variantes del artefacto <X>.

CONTEXTO ACUMULADO (decisiones previas tomadas):
- [literal de cada decisión aprobada previamente]

BRIEF DE LA DECISIÓN (frozen, inline):
[contenido íntegro del brief .md correspondiente]

TAREA:
Generar N variantes que respeten Principio + Salida esperada del brief.
Cada variante debe diferir en ÁNGULO (ej: variante A = <ángulo 1>,
variante B = <ángulo 2>, variante C = <ángulo 3>).

Para cada variante devolver: ángulo, contenido, cómo mapea al brief.

NO elijas la mejor. Solo generá las N. La decisión la toma el main.
"""
)
```

**Invariantes del dispatch:**

1. Brief congelado inline, no filepath.
2. Todas las decisiones previas acumuladas como contexto.
3. El sub-agent NO elige — el main, con el usuario, elige.
4. No hay sub-agent de sub-agent.

## IDs estables en pilares

Los pilares adoptan IDs explícitos en los headers de cada sección citable:

```markdown
### §1.1 [P1-§1.1] Captura bottom-up de atención
### §2.3 #8 [P1-§2.3-#8] Principio de modalidad
### Idea→Guión / patrón-stakes [P2-§Idea→Guión/patrón-stakes]
```

**Reglas:**

1. Los IDs son **contrato estable**, no etiquetas cosméticas. Si una sección se renombra conceptualmente, el ID se mantiene.
2. Si una sección se divide, el ID viejo pasa a ser alias (se cita en los IDs nuevos con un comentario).
3. Los IDs se introducen una vez, al inicio de la fase de construcción.

## Mantenimiento

### Detección de drift (`scripts/verificar-briefs.sh`)

Script bash zero-dependency (bash + git):

```bash
# Para cada brief, compara su `sync:` con la fecha del último commit
# que tocó cada sección del pilar listada en `fuentes:`.

for brief in docs/briefs/**/*.md; do
  sync_date=$(awk '/^sync:/ {print $2}' "$brief")
  fuentes=$(awk '/^fuentes:/,/^[^ -]/' "$brief" | grep -oE "P[123]-§[^ ]+")
  for fuente in $fuentes; do
    pilar_file=$(map_fuente_to_file "$fuente")  # P1-* -> 01-...md
    line=$(grep -n "\[$fuente\]" "$pilar_file" | cut -d: -f1)
    last_edit=$(git log -1 --format=%cs -L "$line,+1:$pilar_file")
    if [[ "$last_edit" > "$sync_date" ]]; then
      echo "STALE: $brief cita $fuente editado $last_edit (sync $sync_date)"
    fi
  done
done
```

Salida esperada: `STALE: <path> cita <fuente> editado <fecha> (sync <fecha>)`.

### Re-sync

- **Detección es automática.** Corre por script, en segundos.
- **Sync es manual.** Humano (guiado por skill `sincronizar-briefs`) evalúa si el cambio del pilar altera el contenido del brief o es cosmético.
- Si altera: edita los bloques afectados, bumpea `sync:`, commit.
- Si cosmético: solo bumpea `sync:`, commit.

No se automatiza la edición del brief. Solo la detección.

### Regeneración de vistas

`scripts/regenerar-vistas.sh` lee frontmatters de briefs y emite `vistas-por-etapa/*.md`. Corre manualmente o como pre-commit hook en cambios de briefs.

## Fases de construcción

### Fase A — Piloto `guion` (validación del formato)

1. Introducir IDs estables en pilar 1 (secciones citadas por briefs de guión) + pilar 2 (sección Idea→Guión + fichas referenciadas) + pilar 3 (sección relevante).
2. Crear `docs/briefs/guion/`.
3. Escribir los 8 briefs de guión: 01-audiencia, 02-hook, 03-estructura, 04-segmentacion, 05-retrieval, 06-modalidad-dual, 07-voz-registro, 08-cta.
4. Editar `skills/guion-entrenamiento/SKILL.md` al patrón nuevo.
5. Crear `scripts/verificar-briefs.sh` + `scripts/regenerar-vistas.sh`.
6. Regenerar `vistas-por-etapa/guion.md` desde briefs.
7. **Dry-run obligatorio:** producir un guión de prueba con un tema dummy usando el nuevo flow. Medir tokens cargados y calidad vs flow viejo. Si el formato del brief no funciona (briefs cortos, densos de más, bloques repetitivos), iterar ANTES de Fase B.

**Criterios de aceptación Fase A:**

- Cada brief: 40-80 líneas, 6 bloques fijos, frontmatter válido, ≥1 cita por claim.
- `verificar-briefs.sh` corre en <3s sobre `briefs/guion/` y reporta 0 stale.
- Carga total de la skill ≤400 líneas (briefs + SKILL.md), vs ~720 líneas hoy.
- Dry-run produce un guión coherente, trazable, sin contradecir pilar 1.

### Fase B — Replicar a otras etapas (en serie, no paralelo)

Orden sugerido: `edicion` → `grabacion` → `publicacion`. Una etapa por sesión.

Edición primero porque tiene más números duros (loudness, contraste, CPS de subs) → buen test del formato de brief en régimen distinto del guión.

Cada etapa repite el proceso de Fase A en su scope.

### Fase C — Skill `sincronizar-briefs` + integración

1. Crear `skills/sincronizar-briefs/SKILL.md` (~40 líneas).
2. Agregar cierre de 3-4 líneas a `actualizar-tendencias` y `actualizar-herramientas` para disparar `verificar-briefs.sh` al final de su flujo.

### Fase D — Cleanup

1. Migrar cualquier contenido humano en `vistas-por-etapa/*.md` que no esté en briefs → al brief correspondiente.
2. Marcar las vistas como derivadas (comentario en header).
3. Actualizar `CLAUDE.md` para reflejar arquitectura de 3 capas.

## Out of scope

- Agregar etapas nuevas (pre-producción separada de grabación, etc.).
- Cambiar contenido de pilares más allá de agregar IDs estables.
- Producir el video demo (bloqueado hasta al menos Fase A).
- Rediseñar `crear-entrenamiento`.
- Nodos-de-concepto compartidos entre briefs (rechazado por overhead de indirección).

## Riesgos y mitigaciones

| Riesgo | Probabilidad | Impacto | Mitigación |
|---|---|---|---|
| Drift pilar↔brief no detectado | Media sin script | Alto (claims desactualizados) | Script + skill `sincronizar-briefs`. Detección automática obligatoria. |
| Duplicación de principios (ej. modalidad en 3 briefs) | Alta (inherente al diseño) | Bajo (~5 líneas × 3) | Citación `[P1-§2.3-#8]` en cada aparición + re-sync guiado cuando pilar cambia. |
| Formato del brief no funciona en la práctica | Media | Alto (cambios retroactivos) | Dry-run obligatorio en Fase A antes de replicar. |
| Sub-agent de variantes genera incoherencias con decisiones previas | Media si no se pasa contexto | Medio | Contrato duro: brief inline + decisiones previas acumuladas. |
| IDs del pilar se vuelven frágiles por renames | Baja | Alto (todos los briefs rompen) | Regla: IDs son contrato estable. Renames conceptuales no rompen IDs. |

## Verification (criterios de éxito globales)

Al completar todas las fases:

- `grep -rc "Read.*pilares/" skills/*/SKILL.md` → 0 (ningún skill de etapa lee pilares directamente).
- `scripts/verificar-briefs.sh` → 0 stale.
- Carga de contexto por skill de etapa: ≤400 líneas (vs ~720 hoy).
- Dry-run de guión + grabación + edición + publicación completos: outputs coherentes, trazables, sin contradecir pilar 1.
- Las `vistas-por-etapa/*.md` se regeneran desde briefs; diff manual vs estado actual muestra equivalencia funcional.
- `CLAUDE.md` refleja la nueva arquitectura.

## Open questions

Ninguna para este spec. Los puntos siguientes se resuelven en el plan de implementación (siguiente fase, skill `writing-plans`):

- Orden exacto de commits dentro de Fase A.
- Si el dry-run de Fase A se hace con tema real (un video que Antonio quiera producir pronto) o con tema dummy.
- Si `sincronizar-briefs` se integra como sub-flujo de `actualizar-tendencias` o se mantiene como skill separada invocada desde la otra. (Recomendación por ahora: separada, para mantener cada skill chica y enfocada.)
