# Fase A — Piloto capa de briefs (etapa guión) Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Construir y validar la capa de briefs precomputados para la etapa de guión: IDs estables en pilares, 8 briefs en `docs/briefs/guion/`, scripts de verificación/regeneración, skill reescrita, y un dry-run obligatorio con tema dummy.

**Architecture:** Los skills dejan de leer pilares completos (~600 líneas) y cargan briefs densos (~350 líneas) indexados por decisión. Cada brief inline-ea principio + casos + anti-patrón + heurística + conflictos, con citas trazables por ID estable al pilar. Single-agent sigue siendo el default; sub-agents entran solo para generar variantes divergentes cuando un test de determinismo upstream detecta ≥2 casos aplicables.

**Tech Stack:** Bash (scripts), markdown (briefs, pilares, skill), git (trazabilidad de sync).

---

## File Structure

### Files a modificar

- `docs/pilares/01-fundamentos-cognitivos.md` — agregar IDs `[P1-§X.Y]` a headers citados por briefs de guión.
- `docs/pilares/02-tendencias-y-casos.md` — agregar IDs a sección `## Idea → Guión` + sub-secciones + fichas referenciadas.
- `docs/pilares/03-herramientas.md` — agregar IDs a sección relevante para guión.
- `skills/guion-entrenamiento/SKILL.md` — reescribir al patrón nuevo (carga briefs, no pilares).
- `docs/vistas-por-etapa/guion.md` — regenerar desde briefs (artefacto derivado).

### Files a crear

- `docs/briefs/guion/01-audiencia.md`
- `docs/briefs/guion/02-hook.md`
- `docs/briefs/guion/03-estructura.md`
- `docs/briefs/guion/04-segmentacion.md`
- `docs/briefs/guion/05-retrieval.md`
- `docs/briefs/guion/06-modalidad-dual.md`
- `docs/briefs/guion/07-voz-registro.md`
- `docs/briefs/guion/08-cta.md`
- `scripts/verificar-briefs.sh`
- `scripts/regenerar-vistas.sh`

### Responsabilidades por archivo

Cada brief es **autocontenido y denso**: 40-80 líneas, frontmatter de trazabilidad + 6 bloques fijos (Principio aplicable · Casos · Anti-patrón · Heurística numérica · Conflictos conocidos · Salida esperada). No se citan entre sí.

`verificar-briefs.sh` detecta drift comparando `sync:` del brief con la fecha del último commit que tocó cada sección del pilar listada en `fuentes:`. Zero-dependency (bash + git).

`regenerar-vistas.sh` lee frontmatters de `briefs/<etapa>/*.md` y emite `vistas-por-etapa/<etapa>.md` como artefacto derivado.

La skill `guion-entrenamiento` cambia su preámbulo para cargar solo `docs/briefs/guion/*.md` y recorre decisiones en orden alfabético = orden de flujo.

---

## Convención de IDs

- **Pilar 1:** `[P1-§X.Y]` para sección X.Y. Sub-item de los 12 principios de Mayer: `[P1-§2.3-#N]` donde N = 1..12.
- **Pilar 2:** sección con nombre → slug kebab-case. `[P2-idea-guion]`, `[P2-idea-guion-patrones]`, `[P2-idea-guion-casos]`, `[P2-idea-guion-antipatrones]`, `[P2-meta-formatos]`. Fichas: `[P2-ficha-<slug>]` (ej. `P2-ficha-fireship`, `P2-ficha-midudev`, `P2-ficha-3b1b`).
- **Pilar 3:** `[P3-idea-guion]` para la sección de asistentes de escritura.

Los IDs son contrato estable. Si una sección se renombra conceptualmente, el ID se preserva.

---

## Task 1: Agregar IDs estables al pilar 1

**Files:**
- Modify: `docs/pilares/01-fundamentos-cognitivos.md`

- [ ] **Step 1: Identificar headers a anotar**

Corre:
```bash
grep -n "^### " /home/antonio/Proyectos_local/training-video-toolkit/docs/pilares/01-fundamentos-cognitivos.md
```
Expected: lista con las secciones §1.1, §1.2, §1.3, §2.1, §2.2, §2.3, §2.4, §5.4, §6.1, §6.2, §6.3, §6.4, §8.1 entre otras.

- [ ] **Step 2: Anotar headers de nivel `###` con ID estable**

Para cada header `### §X.Y ...`, append ` [P1-§X.Y]` al final del texto del header. Ejemplo:

```diff
- ### 1.1 Sistemas y redes atencionales
+ ### 1.1 Sistemas y redes atencionales [P1-§1.1]

- ### 1.3 Anticipación, recompensa y motivación de continuar
+ ### 1.3 Anticipación, recompensa y motivación de continuar [P1-§1.3]

- ### 2.1 Teoría de la Carga Cognitiva (CLT)
+ ### 2.1 Teoría de la Carga Cognitiva (CLT) [P1-§2.1]

- ### 2.3 Los 12 principios de Mayer
+ ### 2.3 Los 12 principios de Mayer [P1-§2.3]

- ### 2.4 Segmentación: cuánto dura una unidad útil
+ ### 2.4 Segmentación: cuánto dura una unidad útil [P1-§2.4]

- ### 5.4 Voz y personalización
+ ### 5.4 Voz y personalización [P1-§5.4]

- ### 6.1 Confusión productiva y cambio conceptual
+ ### 6.1 Confusión productiva y cambio conceptual [P1-§6.1]

- ### 6.2 El efecto Zeigarnik y los bucles abiertos
+ ### 6.2 El efecto Zeigarnik y los bucles abiertos [P1-§6.2]

- ### 6.3 Tres hallazgos para retención y transferencia que la guía original omitía
+ ### 6.3 Tres hallazgos para retención y transferencia que la guía original omitía [P1-§6.3]

- ### 6.4 El problema de la transferencia
+ ### 6.4 El problema de la transferencia [P1-§6.4]

- ### 8.1 Retrieval checkpoints dentro del contenido
+ ### 8.1 Retrieval checkpoints dentro del contenido [P1-§8.1]
```

Anota **todos** los headers `###` con el mismo patrón, aunque no estén listados aquí, para consistencia.

- [ ] **Step 3: Anotar headers de nivel `##` citables**

Para la sección `## 7. Principios de diseño basados en evidencia`, agregar ID:

```diff
- ## 7. Principios de diseño basados en evidencia
+ ## 7. Principios de diseño basados en evidencia [P1-§7]
```

Lo mismo para `## 8` (agregar `[P1-§8]`).

- [ ] **Step 4: Anotar los 12 principios de Mayer dentro de §2.3**

En la lista numerada 1-12 de la sección §2.3, al final de cada línea de la lista, agregar el sub-ID. Ejemplo:

```diff
- 1. **Coherencia** — eliminar palabras, imágenes y sonidos irrelevantes.
+ 1. **Coherencia** — eliminar palabras, imágenes y sonidos irrelevantes. [P1-§2.3-#1]

- 2. **Señalización** — destacar información esencial con flechas, contornos, énfasis tipográfico.
+ 2. **Señalización** — destacar información esencial con flechas, contornos, énfasis tipográfico. [P1-§2.3-#2]

- 3. **Redundancia** — texto en pantalla idéntico a la narración degrada el aprendizaje (compite por el canal verbal).
+ 3. **Redundancia** — texto en pantalla idéntico a la narración degrada el aprendizaje (compite por el canal verbal). [P1-§2.3-#3]
```

Repetir para los 12 principios, del #1 al #12.

- [ ] **Step 5: Verificar que los IDs son únicos**

Run:
```bash
cd /home/antonio/Proyectos_local/training-video-toolkit
grep -oE "\[P1-§[^]]+\]" docs/pilares/01-fundamentos-cognitivos.md | sort | uniq -d
```
Expected: salida vacía (0 duplicados).

- [ ] **Step 6: Commit**

```bash
cd /home/antonio/Proyectos_local/training-video-toolkit
git add docs/pilares/01-fundamentos-cognitivos.md
git commit -m "$(cat <<'EOF'
Pilares: IDs estables en pilar 1 (secciones §1-§8)

Introduce la convención [P1-§X.Y] en headers y [P1-§2.3-#N] en los 12
principios de Mayer. Los IDs son contrato estable para citas desde briefs.

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
EOF
)"
```

---

## Task 2: Agregar IDs estables al pilar 2

**Files:**
- Modify: `docs/pilares/02-tendencias-y-casos.md`

- [ ] **Step 1: Anotar secciones `##` y `###` citadas por briefs de guión**

```diff
- ## Idea → Guión
+ ## Idea → Guión [P2-idea-guion]

- ### Patrones que funcionan ahora
+ ### Patrones que funcionan ahora [P2-idea-guion-patrones]

- ### Variantes de hook por patrón estructural
+ ### Variantes de hook por patrón estructural [P2-idea-guion-hooks]

- ### Casos de éxito
+ ### Casos de éxito [P2-idea-guion-casos]

- ### Anti-patrones
+ ### Anti-patrones [P2-idea-guion-antipatrones]

- ## Meta-formatos
+ ## Meta-formatos [P2-meta-formatos]

- ### Tutorial técnico
+ ### Tutorial técnico [P2-meta-tutorial]

- ### Divulgación
+ ### Divulgación [P2-meta-divulgacion]

- ### Onboarding corporativo
+ ### Onboarding corporativo [P2-meta-onboarding]

- ### Meta-patrones transversales
+ ### Meta-patrones transversales [P2-meta-transversales]
```

Los "### Casos de éxito" duplicados en otras secciones (Pre-producción, Edición, Publicación) reciben IDs paralelos: `[P2-preprod-casos]`, `[P2-edicion-casos]`, `[P2-publicacion-casos]`. Igual para `### Anti-patrones` y `### Patrones que funcionan ahora` en cada etapa.

- [ ] **Step 2: Crear IDs de fichas referenciadas**

Las fichas individuales viven en archivos distintos (`docs/casos-de-exito/tutoriales-tecnicos.md`, `docs/casos-de-exito/divulgacion-corta.md`, etc.). Los briefs de guión referencian principalmente estas fichas:

- Fireship → `[P2-ficha-fireship]`
- Midudev → `[P2-ficha-midudev]`
- ThePrimeagen → `[P2-ficha-theprimeagen]`
- MoureDev → `[P2-ficha-mouredev]`
- The Coding Train → `[P2-ficha-coding-train]`
- 3Blue1Brown → `[P2-ficha-3b1b]`
- Veritasium → `[P2-ficha-veritasium]`
- Kurzgesagt → `[P2-ficha-kurzgesagt]`
- DotCSV → `[P2-ficha-dotcsv]`
- QuantumFracture → `[P2-ficha-quantumfracture]`

Anotar en el header de cada ficha dentro de sus archivos. Ejemplo en `docs/casos-de-exito/tutoriales-tecnicos.md`:

```diff
- ## Fireship
+ ## Fireship [P2-ficha-fireship]

- ## ThePrimeagen
+ ## ThePrimeagen [P2-ficha-theprimeagen]
```

Repetir para las fichas listadas arriba en cada archivo correspondiente (`divulgacion-corta.md`, `onboarding-corporativo.md`).

- [ ] **Step 3: Verificar unicidad**

```bash
cd /home/antonio/Proyectos_local/training-video-toolkit
grep -roE "\[P2-[^]]+\]" docs/pilares/02-tendencias-y-casos.md docs/casos-de-exito/ | sed 's/.*://' | sort | uniq -d
```
Expected: salida vacía.

- [ ] **Step 4: Commit**

```bash
git add docs/pilares/02-tendencias-y-casos.md docs/casos-de-exito/
git commit -m "$(cat <<'EOF'
Pilares: IDs estables en pilar 2 (secciones + fichas)

Introduce [P2-<slug>] en headers de secciones citables y [P2-ficha-<slug>]
en fichas de creators. Los IDs son contrato estable para citas desde briefs.

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
EOF
)"
```

---

## Task 3: Agregar IDs estables al pilar 3

**Files:**
- Modify: `docs/pilares/03-herramientas.md`

- [ ] **Step 1: Identificar sección relevante para guión**

Run:
```bash
grep -n "^## \|^### " /home/antonio/Proyectos_local/training-video-toolkit/docs/pilares/03-herramientas.md
```
Localizar la sección que corresponda a "Idea → Guión" o "Asistentes de escritura" (el nombre exacto depende del contenido actual del pilar 3).

- [ ] **Step 2: Anotar el header**

Ejemplo (ajustar nombre al que exista):

```diff
- ## Idea → Guión
+ ## Idea → Guión [P3-idea-guion]
```

Si el pilar 3 tiene varias sub-secciones bajo esta etapa, anotar cada una: `[P3-idea-guion-asistentes]`, `[P3-idea-guion-outlining]`, etc.

- [ ] **Step 3: Verificar y commit**

```bash
cd /home/antonio/Proyectos_local/training-video-toolkit
grep -oE "\[P3-[^]]+\]" docs/pilares/03-herramientas.md | sort | uniq -d  # esperado vacío
git add docs/pilares/03-herramientas.md
git commit -m "$(cat <<'EOF'
Pilares: IDs estables en pilar 3 (sección Idea→Guión)

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
EOF
)"
```

---

## Task 4: Crear `scripts/verificar-briefs.sh`

**Files:**
- Create: `scripts/verificar-briefs.sh`

- [ ] **Step 1: Crear el script**

Contenido íntegro del archivo:

```bash
#!/usr/bin/env bash
# verificar-briefs.sh — detecta drift entre briefs y pilares.
#
# Para cada brief en docs/briefs/**/*.md, compara su `sync:` con la fecha
# del último commit que tocó cada sección del pilar listada en `fuentes:`.
# Reporta briefs potencialmente stale.
#
# Zero-dependency: bash + git + grep + awk.
# Sale con código 0 siempre (es reporte, no gate). Código 1 solo si error.

set -euo pipefail

REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null) || {
  echo "ERROR: no estás dentro de un repo git" >&2
  exit 1
}
cd "$REPO_ROOT"

# Mapea prefijo de ID a archivo del pilar.
map_fuente_to_file() {
  local fuente="$1"
  case "$fuente" in
    P1-*) echo "docs/pilares/01-fundamentos-cognitivos.md" ;;
    P2-ficha-*)
      # Buscar en los 3 archivos de fichas
      for f in docs/casos-de-exito/tutoriales-tecnicos.md \
               docs/casos-de-exito/divulgacion-corta.md \
               docs/casos-de-exito/onboarding-corporativo.md; do
        if grep -q "\[$fuente\]" "$f" 2>/dev/null; then
          echo "$f"
          return
        fi
      done
      echo ""  # no encontrado
      ;;
    P2-*) echo "docs/pilares/02-tendencias-y-casos.md" ;;
    P3-*) echo "docs/pilares/03-herramientas.md" ;;
    *) echo "" ;;
  esac
}

STALE_COUNT=0

while IFS= read -r brief; do
  sync_date=$(awk '/^sync:/ {print $2; exit}' "$brief" 2>/dev/null || echo "")
  [[ -z "$sync_date" ]] && {
    echo "WARN: $brief sin frontmatter sync:" >&2
    continue
  }

  # Extraer bloque fuentes: del frontmatter
  fuentes=$(awk '
    /^fuentes:/ { in_fuentes=1; next }
    /^[a-z]+:/ && in_fuentes { exit }
    in_fuentes && /^  -/ { gsub(/^  - /,""); gsub(/ +#.*$/,""); print }
  ' "$brief")

  while IFS= read -r fuente; do
    [[ -z "$fuente" ]] && continue
    pilar_file=$(map_fuente_to_file "$fuente")
    [[ -z "$pilar_file" ]] && {
      echo "WARN: $brief cita $fuente — pilar no mapeado" >&2
      continue
    }
    [[ ! -f "$pilar_file" ]] && {
      echo "WARN: $brief cita $fuente en $pilar_file — archivo no existe" >&2
      continue
    }

    # Última fecha de commit que tocó este archivo (proxy: cualquier cambio)
    # Nota: para precisión por sección usar `git log -L`, pero requiere que
    # el ID esté en una línea única. Proxy de archivo es suficiente para v1.
    last_edit=$(git log -1 --format=%cs -- "$pilar_file" 2>/dev/null || echo "")
    [[ -z "$last_edit" ]] && continue

    if [[ "$last_edit" > "$sync_date" ]]; then
      echo "STALE: $brief cita $fuente ($pilar_file editado $last_edit, sync $sync_date)"
      STALE_COUNT=$((STALE_COUNT + 1))
    fi
  done <<< "$fuentes"
done < <(find docs/briefs -type f -name '*.md' 2>/dev/null | sort)

echo ""
echo "Total briefs stale: $STALE_COUNT"
exit 0
```

- [ ] **Step 2: Hacer ejecutable**

```bash
cd /home/antonio/Proyectos_local/training-video-toolkit
chmod +x scripts/verificar-briefs.sh
```

- [ ] **Step 3: Sanity test con briefs aún inexistentes**

```bash
bash scripts/verificar-briefs.sh
```
Expected output:
```
Total briefs stale: 0
```
(Porque `docs/briefs/` aún no existe, el `find` devuelve vacío sin error.)

- [ ] **Step 4: Commit**

```bash
git add scripts/verificar-briefs.sh
git commit -m "$(cat <<'EOF'
scripts: verificar-briefs.sh para detección de drift pilar↔brief

Compara sync: de cada brief con fecha del último commit que tocó el pilar
citado. Reporta stale sin gatear (exit 0 siempre).

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
EOF
)"
```

---

## Task 5: Crear `scripts/regenerar-vistas.sh`

**Files:**
- Create: `scripts/regenerar-vistas.sh`

- [ ] **Step 1: Crear el script**

Contenido íntegro:

```bash
#!/usr/bin/env bash
# regenerar-vistas.sh — emite docs/vistas-por-etapa/<etapa>.md como
# artefacto derivado de los frontmatters en docs/briefs/<etapa>/*.md.
#
# La vista queda como índice humanamente legible: lista de decisiones,
# pregunta base de cada una, fuentes citadas. No se edita a mano.

set -euo pipefail

REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null) || {
  echo "ERROR: no estás dentro de un repo git" >&2
  exit 1
}
cd "$REPO_ROOT"

ETAPAS=(guion grabacion edicion publicacion)
STAMP=$(date -u +%Y-%m-%dT%H:%M:%SZ)

for etapa in "${ETAPAS[@]}"; do
  brief_dir="docs/briefs/$etapa"
  [[ ! -d "$brief_dir" ]] && continue

  out="docs/vistas-por-etapa/$etapa.md"
  title_etapa=$(echo "$etapa" | sed 's/^./\U&/')

  {
    echo "# Vista por etapa — $title_etapa"
    echo ""
    echo "> Artefacto **auto-generado** por \`scripts/regenerar-vistas.sh\` a partir"
    echo "> de los frontmatters de \`docs/briefs/$etapa/*.md\`. **No editar a mano.**"
    echo "> Última regeneración: $STAMP"
    echo ""
    echo "## Decisiones críticas"
    echo ""

    for brief in "$brief_dir"/*.md; do
      [[ -f "$brief" ]] || continue
      decision=$(awk '/^decision:/ {print $2; exit}' "$brief")
      pregunta=$(awk -F': ' '/^pregunta:/ {$1=""; sub(/^ /,""); print; exit}' "$brief")
      fuentes=$(awk '
        /^fuentes:/ { in_f=1; next }
        /^[a-z]+:/ && in_f { exit }
        in_f && /^  -/ { gsub(/^  - /,""); gsub(/ +#.*$/,""); printf "%s ", $0 }
      ' "$brief")

      n=$(basename "$brief" .md | cut -d- -f1)
      slug=$(basename "$brief" .md | cut -d- -f2-)
      echo "### $n. $slug"
      echo ""
      echo "- **Pregunta:** $pregunta"
      echo "- **Fuentes:** $fuentes"
      echo "- **Brief:** [\`briefs/$etapa/$(basename "$brief")\`](../briefs/$etapa/$(basename "$brief"))"
      echo ""
    done
  } > "$out"

  echo "Regenerado: $out"
done
```

- [ ] **Step 2: Hacer ejecutable**

```bash
cd /home/antonio/Proyectos_local/training-video-toolkit
chmod +x scripts/regenerar-vistas.sh
```

- [ ] **Step 3: Sanity test**

```bash
bash scripts/regenerar-vistas.sh
```
Expected: sin output (ninguna etapa tiene aún `docs/briefs/<etapa>/`). Exit 0.

- [ ] **Step 4: Commit**

```bash
git add scripts/regenerar-vistas.sh
git commit -m "$(cat <<'EOF'
scripts: regenerar-vistas.sh — vistas-por-etapa como artefacto derivado

Lee frontmatters de docs/briefs/<etapa>/*.md y emite
docs/vistas-por-etapa/<etapa>.md. No se edita a mano.

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
EOF
)"
```

---

## Task 6: Crear `docs/briefs/guion/01-audiencia.md`

**Files:**
- Create: `docs/briefs/guion/01-audiencia.md`

- [ ] **Step 1: Crear el directorio**

```bash
cd /home/antonio/Proyectos_local/training-video-toolkit
mkdir -p docs/briefs/guion
```

- [ ] **Step 2: Escribir el brief**

Contenido íntegro de `docs/briefs/guion/01-audiencia.md`:

```markdown
---
decision: guion/01-audiencia
etapa: guion
pregunta: ¿Para quién es este video y qué debe poder hacer al terminar?
fuentes:
  - P1-§2.1                   # carga intrínseca y nivel previo
  - P1-§2.3-#7                # pre-entrenamiento
  - P2-meta-tutorial          # audiencias de tutorial técnico
  - P2-meta-divulgacion       # audiencias de divulgación
  - P2-meta-onboarding        # audiencias de onboarding
admite-variantes: false
sync: 2026-04-18
version: 1
---

## Principio aplicable

**Carga intrínseca ≈ complejidad del material × (1 − nivel previo del aprendiz)**
[P1-§2.1]. El nivel previo gobierna qué puede absorberse sin saturar memoria
de trabajo (~4 elementos simultáneos). Si la audiencia no tiene el
pre-entrenamiento necesario, hay que proveerlo antes del flujo principal
o bajar la complejidad — nunca ignorar el gap [P1-§2.3-#7].

**Objetivo de aprendizaje mensurable.** La audiencia sola no basta; hay que
acoplarla a una acción observable. "Entender X" no sirve — no es medible.
"Instalar X y desplegar un hello-world" sí.

## Casos

- **Fireship** [P2-ficha-fireship]: audiencia = devs que ya programan,
  buscan refrescarse rápido. Pre-entrenamiento alto asumido. Por eso WPM
  ~235 sin explicar términos básicos funciona.
- **Midudev** [P2-ficha-midudev]: audiencia = devs junior-mid hispanos.
  WPM ~188 con pausas explícitas para pre-entrenamiento on-the-fly cuando
  aparece término nuevo (npm, vite, webpack).
- **Kurzgesagt** [P2-ficha-kurzgesagt]: audiencia = público general sin
  background. Pre-entrenamiento vía animación isotype durante 60-90s
  antes del argumento central.

## Anti-patrón

**Audiencia difusa ("para todos los que quieran aprender X").** Garantiza
calibración mal. El video queda demasiado básico para los avanzados y
demasiado rápido para los novatos. Correlaciona con caídas de retention
por ambos extremos.

## Heurística numérica

- **Un objetivo por video ≤ 10 min.** Objetivos múltiples requieren
  segmentación explícita (ver brief 04-segmentacion).
- **Pre-entrenamiento:** si >20% del audio inicial explica términos, es
  señal de que la audiencia definida no coincide con la audiencia real
  del contenido.

## Conflictos conocidos

Ninguno relevante. Decisión prerequisito de todas las demás.

## Salida esperada

Dos frases:

- **Audiencia:** "[perfil con nivel previo explícito, ej. 'devs backend
  con experiencia en Node pero sin haber usado Bun']".
- **Objetivo:** "Al terminar este video, [audiencia] podrá [acción
  observable con verbo medible: instalar, reproducir, identificar,
  explicar con sus palabras]".
```

- [ ] **Step 3: Verificar frontmatter válido**

```bash
awk '/^---$/{c++} c==1{print} c==2{exit}' docs/briefs/guion/01-audiencia.md | grep -qE "^(decision|etapa|pregunta|fuentes|admite-variantes|sync|version):" && echo OK
```
Expected: `OK` (todas las keys presentes).

- [ ] **Step 4: Commit**

```bash
git add docs/briefs/guion/01-audiencia.md
git commit -m "briefs(guion): 01-audiencia — carga intrínseca + pre-entrenamiento

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

---

## Task 7: Crear `docs/briefs/guion/02-hook.md`

**Files:**
- Create: `docs/briefs/guion/02-hook.md`

- [ ] **Step 1: Escribir el brief**

Contenido íntegro:

```markdown
---
decision: guion/02-hook
etapa: guion
pregunta: ¿Cómo captura atención bottom-up y promete recompensa cumplible?
fuentes:
  - P1-§1.1                     # saliencia bottom-up
  - P1-§1.3                     # anticipación dopaminérgica
  - P1-§7                       # refutación "8s de atención"
  - P2-idea-guion-patrones
  - P2-idea-guion-hooks
  - P2-ficha-fireship
  - P2-ficha-midudev
  - P2-ficha-veritasium
  - P2-ficha-kurzgesagt
admite-variantes: true
sync: 2026-04-18
version: 1
---

## Principio aplicable

**Captura bottom-up + promesa cumplible.** Los primeros 5-10s el cerebro
procesa saliencia (cambio, contraste, rostro, movimiento) antes de
engagement voluntario [P1-§1.1]. La saliencia compra ~2-3s; retenerla
requiere una **promesa** (stakes: qué gana o pierde el espectador) que
el video cumple progresivamente [P1-§1.3]. Si la promesa se rompe, error
de predicción dopaminérgica negativo erosiona la disposición a continuar.

**Refutar pseudociencia:** no existe "atención de 8s" como capacidad general
[P1-§7]. La ventana de 15s es convención de plataforma, no biología.

## Casos

- **Fireship `Bun in 100s`** [P2-ficha-fireship]: hook 0-3s con pregunta
  provocativa + logo animado. CCN-fit directo con el título. WPM ~235 desde
  el primer segundo.
- **Midudev `¿Qué es Vite?`** [P2-ficha-midudev]: hook con stake de
  productividad ("tu webpack tarda 45s, mira esto"), muestra resultado
  antes de explicar. Hispano, WPM ~188.
- **Veritasium** [P2-ficha-veritasium]: hook con pregunta contraintuitiva
  ("la mayoría de gente contesta mal esto — ¿tú también?"). Stake
  cognitivo antes que económico.
- **Kurzgesagt** [P2-ficha-kurzgesagt]: hook con afirmación dramática +
  animación isotype densa. WPM bajo (~150) compensado por canal visual
  muy cargado.

## Anti-patrón

**"Hola soy X y hoy vamos a hablar de Y."** Presentación del creador en
los primeros 10s sin stake y sin payoff visual — el canal verbal se gasta
describiendo al creador en lugar de prometer valor. Correlaciona con
caídas de retention en los primeros 30s (observación estructural pilar 2,
entries 16-21).

## Heurística numérica

- **Duración del hook:** ≤15s (convención, no ciencia).
- **Confirmación visual del título:** ≥1 frame en 0-5s que muestra el
  resultado prometido por el título (CCN-fit).
- **Densidad de palabras:** 25-45 palabras en tutoriales técnicos (WPM
  alto); 15-25 en divulgación con animación densa.

## Conflictos conocidos

- **Hooks muy cortos (3-5s) por imitación a Shorts** [P2-idea-guion-hooks]
  contradicen el principio de pre-entrenamiento [P1-§2.3-#7] en tutoriales
  técnicos: no alcanzan a establecer el contexto mínimo. **Flaggear al
  usuario** cuando aplica, no resolver en silencio.

## Salida esperada

Hook de ≤15s con:
- Stake verbal explícito (qué gana/pierde el espectador),
- Frame de confirmación visual del título en 0-5s,
- Cero auto-presentación del creador.
```

- [ ] **Step 2: Verificar citations**

```bash
cd /home/antonio/Proyectos_local/training-video-toolkit
grep -oE "\[P[123]-[^]]+\]" docs/briefs/guion/02-hook.md | sort -u
```
Expected: lista con ≥8 IDs únicos (fuentes declaradas + citas inline).

- [ ] **Step 3: Commit**

```bash
git add docs/briefs/guion/02-hook.md
git commit -m "briefs(guion): 02-hook — captura bottom-up + promesa cumplible

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

---

## Task 8: Crear `docs/briefs/guion/03-estructura.md`

**Files:**
- Create: `docs/briefs/guion/03-estructura.md`

- [ ] **Step 1: Escribir el brief**

Contenido íntegro:

```markdown
---
decision: guion/03-estructura
etapa: guion
pregunta: ¿Qué arquitectura narrativa — lineal, confusión productiva, problema-solución?
fuentes:
  - P1-§6.1                    # confusión productiva
  - P1-§6.2                    # efecto Zeigarnik, open loops
  - P2-meta-tutorial
  - P2-meta-divulgacion
  - P2-ficha-3b1b
  - P2-ficha-veritasium
  - P2-ficha-fireship
admite-variantes: true
sync: 2026-04-18
version: 1
---

## Principio aplicable

**Confusión productiva** [P1-§6.1]: cuando el tema tiene misconceptions
comunes, presentar el error ingenuo primero y dejar que el espectador lo
sienta como natural antes de corregirlo produce mejor retención que
exposición directa. No aplicable a temas sin misconceptions (instalar
una librería).

**Open loops (efecto Zeigarnik)** [P1-§6.2]: tareas no completadas ocupan
más memoria de trabajo que completadas. Abrir una pregunta al inicio y
resolverla al final mantiene tensión cognitiva. Cerrar todos los loops
abiertos — un loop sin cerrar frustra.

## Casos

- **3Blue1Brown** [P2-ficha-3b1b]: estructura linear con animación-que-tarda.
  Cada bloque visual se construye ante los ojos; el ritmo visual hace la
  segmentación. Open loops matemáticos explícitos ("volveremos a esto").
- **Veritasium** [P2-ficha-veritasium]: problema-solución con confusión
  productiva prominente. Hook = pregunta; video = construcción de la
  intuición; cierre = resolución + conexión con algo inesperado.
- **Fireship** [P2-ficha-fireship]: lineal puro, sin confusión productiva.
  Objetivo = referencia rápida, no cambio conceptual. Estructura:
  qué-es → cómo-se-instala → cómo-se-usa → comparación → veredicto.

## Anti-patrón

**Múltiples open loops sin cerrar.** Abrir 3 preguntas al inicio y cerrar
solo 1 genera error de predicción dopaminérgica acumulado. Mejor 1 loop
principal bien gestionado que 3 mal.

## Heurística numérica

- **Bloques narrativos:** 3-5 por video de 6-10 min.
- **Open loops:** 1 principal (hook → cierre) + 0-2 secundarios internos,
  todos cerrados.
- **Confusión productiva:** aplicable cuando ≥30% de la audiencia tiene
  el misconception. Si nadie lo tiene, omitir (pierde tiempo).

## Conflictos conocidos

- En tutorial técnico corto (<3 min) la confusión productiva puede no caber
  — la densidad del formato exige ir directo. Flaggear al usuario que elige
  confusión productiva en videos cortos.

## Salida esperada

Outline con:
- Tipo de estructura (lineal / confusión productiva / problema-solución).
- 3-5 bloques narrativos con título breve cada uno.
- 1 open loop principal: pregunta del hook + cómo/cuándo se cierra.
- Si aplica: misconception explícito a abordar y en qué bloque.
```

- [ ] **Step 2: Commit**

```bash
git add docs/briefs/guion/03-estructura.md
git commit -m "briefs(guion): 03-estructura — confusión productiva + open loops

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

---

## Task 9: Crear `docs/briefs/guion/04-segmentacion.md`

**Files:**
- Create: `docs/briefs/guion/04-segmentacion.md`

- [ ] **Step 1: Escribir el brief**

Contenido íntegro:

```markdown
---
decision: guion/04-segmentacion
etapa: guion
pregunta: ¿Cuántos bloques y de qué duración?
fuentes:
  - P1-§2.3-#6                # principio de segmentación
  - P1-§2.4                    # ~6 min decay (Guo et al. 2014)
  - P2-meta-tutorial
  - P2-meta-divulgacion
  - P2-meta-onboarding
admite-variantes: false
sync: 2026-04-18
version: 1
---

## Principio aplicable

**Principio de segmentación** [P1-§2.3-#6]: dividir contenido en unidades
manejables con cierres claros supera a flujo continuo, porque cada unidad
permite consolidar en memoria de trabajo antes de seguir.

**Guo et al. 2014 (MOOCs)** [P1-§2.4]: engagement decae pasado ~6 min en
contenido lectivo continuo. No es "ley de 6 min" — es mediana observada
en MOOCs con aprendices motivados. En nichos distintos (entertainment-ed,
onboarding con tareas) los números se mueven.

## Casos

- **Tutorial técnico anglo** [P2-meta-tutorial]: videos 8-15 min con
  bloques de 2-4 min. Fireship 4 min total sin segmentación explícita
  (el video ENTERO es un bloque denso).
- **Divulgación corta** [P2-meta-divulgacion]: 5-12 min con bloques de
  60-90s marcados por transición visual.
- **Onboarding corporativo** [P2-meta-onboarding]: microlearning ≤5 min
  con 80% completion, vs 20% en formato largo continuo.

## Anti-patrón

**Video de 25 min sin segmentación visible.** Un solo bloque continuo.
Retention típica <30% a los 10 min. Si el tema requiere 25 min, hacer
serie de 4-5 partes.

## Heurística numérica

- **Tutorial técnico:** bloques de 2-4 min, total 5-15 min.
- **Divulgación:** bloques de 60-120s, total 6-12 min.
- **Onboarding:** microlearning ≤5 min por unidad, serie para temas grandes.
- **Regla de pulgar:** si el video pasa de 10 min, la segmentación debe ser
  VISUALMENTE marcada (título de bloque, cambio de fondo, chapter marker).

## Conflictos conocidos

Ninguno.

## Salida esperada

- Duración total estimada.
- Número de bloques y título de cada uno.
- Duración aproximada de cada bloque.
- Método de marcado visual entre bloques (chapter marker, título en
  pantalla, cambio de escena).
```

- [ ] **Step 2: Commit**

```bash
git add docs/briefs/guion/04-segmentacion.md
git commit -m "briefs(guion): 04-segmentacion — principio + Guo 6min

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

---

## Task 10: Crear `docs/briefs/guion/05-retrieval.md`

**Files:**
- Create: `docs/briefs/guion/05-retrieval.md`

- [ ] **Step 1: Escribir el brief**

Contenido íntegro:

```markdown
---
decision: guion/05-retrieval
etapa: guion
pregunta: ¿Dónde insertas momentos de recuperación activa?
fuentes:
  - P1-§6.3                    # retrieval practice / testing effect
  - P1-§8.1                    # retrieval checkpoints dentro del contenido
  - P2-meta-tutorial
  - P2-meta-onboarding
admite-variantes: false
sync: 2026-04-18
version: 1
---

## Principio aplicable

**Testing effect** [P1-§6.3, P1-§8.1]: recuperar información supera a
releer la para retención a largo plazo (Roediger & Karpicke 2006;
Karpicke & Blunt 2011). No es intuitivo — se siente menos efectivo
(porque cuesta más), pero produce mejor consolidación.

**Preguntas generativas > preguntas de reconocimiento.** "¿Qué harías
en esta situación?" supera a "¿cuál de estas respuestas es correcta?".
El costo cognitivo de generar la respuesta es el driver del efecto.

## Casos

- **Tutorial técnico** [P2-meta-tutorial]: retrieval implícito en forma de
  pausas donde el espectador puede probar el comando antes de ver el
  resultado. "Pausa y pruébalo si quieres; te espero."
- **Onboarding corporativo** [P2-meta-onboarding]: retrieval explícito vía
  quiz embebido, 1 cada 2-3 min. Plataformas LMS lo enforzan; YouTube no.
- **Divulgación**: retrieval casi inexistente en el formato estándar. Excepto
  Kurzgesagt que usa "piensa por un momento…" seguido de 2s de animación
  — aproximación a retrieval sin quiz.

## Anti-patrón

**Pregunta retórica sin pausa para respuesta.** "¿Cómo creen que funciona?
Bueno, funciona así." No es retrieval — el cerebro no tiene tiempo de
generar. Si hay pregunta, hay que darle tiempo (2-3s mínimo de animación
vacía o "pausa ahora").

## Heurística numérica

- **Tutorial técnico:** ≥1 retrieval checkpoint cada 5-10 min, típicamente
  como pausa-para-probar.
- **Onboarding:** más denso — 1 cada 2-3 min, quiz con pregunta generativa.
- **Divulgación:** 0-1 por video; la estructura narrativa hace el trabajo.

## Conflictos conocidos

Ninguno.

## Salida esperada

- Lista de retrieval checkpoints con timestamp estimado.
- Formato de cada uno (pausa-para-probar / quiz / pregunta-abierta con
  animación).
- Texto literal de la pregunta generativa (no de reconocimiento).
```

- [ ] **Step 2: Commit**

```bash
git add docs/briefs/guion/05-retrieval.md
git commit -m "briefs(guion): 05-retrieval — testing effect + checkpoints

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

---

## Task 11: Crear `docs/briefs/guion/06-modalidad-dual.md`

**Files:**
- Create: `docs/briefs/guion/06-modalidad-dual.md`

- [ ] **Step 1: Escribir el brief**

Contenido íntegro:

```markdown
---
decision: guion/06-modalidad-dual
etapa: guion
pregunta: ¿Qué se dice con voz y qué se muestra en pantalla?
fuentes:
  - P1-§2.2                    # codificación dual (Paivio)
  - P1-§2.3-#3                 # principio de redundancia
  - P1-§2.3-#8                 # principio de modalidad
  - P1-§2.3-#2                 # principio de señalización
  - P2-idea-guion-patrones
admite-variantes: false
sync: 2026-04-18
version: 1
---

## Principio aplicable

**Codificación dual** [P1-§2.2]: canales verbal y visual son procesados en
paralelo y se integran en memoria. Contenido complementario en ambos canales
supera a contenido en uno solo.

**Principio de modalidad** [P1-§2.3-#8]: cuando hay gráfico, **narración
hablada** supera a **texto en pantalla**. El texto en pantalla compite
con el gráfico por el canal visual.

**Principio de redundancia** [P1-§2.3-#3]: texto en pantalla idéntico a la
narración hablada **degrada** el aprendizaje. El canal verbal es uno solo
— escrito o hablado, no ambos simultáneamente idénticos.

**Principio de señalización** [P1-§2.3-#2]: destacar lo esencial con
callouts, flechas, highlight tipográfico, mejora la atención selectiva.

## Casos

- **Kurzgesagt** [P2-ficha-kurzgesagt]: narración + animación isotype
  densa. Cero texto en pantalla que duplique la narración. Textos solo
  como labels de elementos visuales.
- **3Blue1Brown** [P2-ficha-3b1b]: ecuaciones en pantalla + narración que
  las explica paso a paso. La ecuación NO se lee literal — se señaliza
  con color y movimiento.
- **Fireship** [P2-ficha-fireship]: code snippets en pantalla + narración
  que comenta qué hacen. Texto del snippet ≠ narración — complementarios.

## Anti-patrón

**Subtítulos decorativos que repiten textualmente la narración en el
canal de B-roll** (no confundir con subtítulos de accesibilidad, que son
distintos). Añade carga extraña sin ganancia de aprendizaje [P1-§2.3-#3].

## Heurística numérica

- **Texto en pantalla máximo 5-7 palabras por elemento.** Más es ensayo.
- **Callouts/señalizaciones:** cada 10-15s en contenido técnico denso;
  menos en divulgación con animación continua.

## Conflictos conocidos

- **Accesibilidad vs. redundancia:** subtítulos para sordos SON redundantes
  con narración, pero son obligatorios por accesibilidad. El principio de
  redundancia NO aplica a subtítulos. Flaggear al usuario si intenta
  removerlos por "optimización cognitiva".

## Salida esperada

Marcado explícito en el guión por cada momento relevante de:
- Qué va en narración (literal).
- Qué va en pantalla (visual + texto corto si aplica).
- Dónde hay señalización (flecha, highlight, callout).
```

- [ ] **Step 2: Commit**

```bash
git add docs/briefs/guion/06-modalidad-dual.md
git commit -m "briefs(guion): 06-modalidad-dual — dual coding + Mayer #2/#3/#8

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

---

## Task 12: Crear `docs/briefs/guion/07-voz-registro.md`

**Files:**
- Create: `docs/briefs/guion/07-voz-registro.md`

- [ ] **Step 1: Escribir el brief**

Contenido íntegro:

```markdown
---
decision: guion/07-voz-registro
etapa: guion
pregunta: ¿Tono, pacing y persona narrativa?
fuentes:
  - P1-§2.3-#10                # personalización (tú/nosotros)
  - P1-§2.3-#11                # voz humana cálida
  - P1-§5.4                    # voz y personalización
  - P2-idea-guion-patrones
  - P2-ficha-fireship
  - P2-ficha-midudev
  - P2-ficha-3b1b
  - P2-ficha-kurzgesagt
admite-variantes: false
sync: 2026-04-18
version: 1
---

## Principio aplicable

**Personalización** [P1-§2.3-#10]: lenguaje conversacional ("tú",
"nosotros", "imagina que…") supera a lenguaje formal para aprendizaje.
El cerebro procesa la personalización como diálogo, activando más áreas
de comprensión social.

**Voz humana cálida** [P1-§2.3-#11, P1-§5.4]: voz humana con prosodia
natural supera a voz sintética genérica. La brecha se ha estrechado con
TTS modernos (ElevenLabs, etc.); ya no es absoluta pero el gap persiste
en aprendizaje profundo.

## Casos (WPM observados)

- **Alta densidad anglo:** Fireship ~235 [P2-ficha-fireship],
  ThePrimeagen 189-206.
- **Alta densidad hispana:** Midudev ~188 [P2-ficha-midudev], MoureDev
  ~185.
- **Divulgación media:** 3Blue1Brown ~190 [P2-ficha-3b1b], Veritasium
  ~178, QuantumFracture ~168.
- **Divulgación lenta:** Kurzgesagt ~150 [P2-ficha-kurzgesagt] —
  compensado con animación densa (pilar 1 §2.3 #8 modalidad).

## Anti-patrón

**Registro formal/corporativo en contenido personal.** "En este video
procederemos a examinar…" degrada engagement vs "Observa lo que podemos
hacer con…". El registro formal tiene su lugar (compliance, legal), no
en tutorial ni divulgación.

## Heurística numérica

- **Tutorial técnico denso:** 180-240 WPM, canal verbal alto, canal visual
  acompaña con code snippets.
- **Divulgación estándar:** 150-190 WPM.
- **Divulgación con animación densa:** 140-165 WPM (compensación Mayer).
- **Onboarding corporativo formativo:** 130-160 WPM, más pausas por
  retrieval.

## Conflictos conocidos

- **WPM bajo + animación pobre = aburrido.** El WPM bajo se sostiene solo
  con canal visual compensatorio. Flaggear al usuario que elige <150 WPM
  sin plan de visual denso.

## Salida esperada

- Registro explícito (cercano conversacional / profesional cercano /
  profesional formal).
- WPM objetivo con justificación del canal visual que lo acompaña.
- Nota sobre uso de segunda persona ("tú") o primera plural
  ("nosotros") — consistente a lo largo del video.
```

- [ ] **Step 2: Commit**

```bash
git add docs/briefs/guion/07-voz-registro.md
git commit -m "briefs(guion): 07-voz-registro — personalización + WPM observados

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

---

## Task 13: Crear `docs/briefs/guion/08-cta.md`

**Files:**
- Create: `docs/briefs/guion/08-cta.md`

- [ ] **Step 1: Escribir el brief**

Contenido íntegro:

```markdown
---
decision: guion/08-cta
etapa: guion
pregunta: ¿Qué acción le pides al espectador y cómo cierras el loop narrativo?
fuentes:
  - P1-§6.4                    # transferencia
  - P1-§6.2                    # cierre de open loops
  - P2-idea-guion-antipatrones
  - P2-ficha-fireship
  - P2-ficha-veritasium
  - P2-ficha-midudev
admite-variantes: false
sync: 2026-04-18
version: 1
---

## Principio aplicable

**Transferencia** [P1-§6.4]: el aprendizaje se consolida cuando se aplica
en un contexto distinto al original. Un CTA que invita a aplicar
(construir, probar, enseñar a otro) produce mejor retención que "suscríbete".

**Cierre de open loop** [P1-§6.2]: la pregunta abierta del hook debe
resolverse en el cierre. Dejarla abierta frustra (Zeigarnik inverso).

## Casos

- **Fireship** [P2-ficha-fireship]: CTA = link al repo/docs + "haz el
  tutorial oficial" (invita a transferencia). "Suscríbete" al final,
  después del valor entregado.
- **Veritasium** [P2-ficha-veritasium]: CTA = pregunta generativa
  ("¿cómo aplicarías esto en tu caso?") + invitación a otro video
  relacionado.
- **Midudev** [P2-ficha-midudev]: CTA al curso propio explícito al final,
  bien justificado con lo que se aprendería nuevo.

## Anti-patrón

**"Suscríbete al inicio" sin valor entregado** [P2-idea-guion-antipatrones]:
caída típica de retention. El CTA de suscripción al inicio, antes de
demostrar valor, correlaciona con abandono a los 30s.

**CTA genérico sin acción específica.** "Espero les haya gustado" no
invita a nada. Correlaciona con click-through rate bajo.

## Heurística numérica

- **CTA ≤ 15s.** Más es auto-promoción que rompe el cierre.
- **1 acción específica.** No 3 opciones — reduce la probabilidad de cada
  una por fatiga de decisión.

## Conflictos conocidos

Ninguno.

## Salida esperada

- Cierre del open loop del hook (una frase explícita que conecta hook↔cierre).
- CTA específico: acción concreta ("prueba X con este repo", "lee Y en el
  link", "cuéntame en comentarios qué harías en Z caso").
- Suscripción opcional al final, después del valor — no al inicio.
```

- [ ] **Step 2: Verificar todos los briefs**

```bash
cd /home/antonio/Proyectos_local/training-video-toolkit
ls docs/briefs/guion/ | wc -l
```
Expected: `8`.

```bash
for f in docs/briefs/guion/*.md; do
  lines=$(wc -l < "$f")
  if [[ $lines -lt 40 || $lines -gt 100 ]]; then
    echo "FAIL: $f tiene $lines líneas (esperado 40-100)"
  fi
done
```
Expected: sin output (todos los briefs dentro del rango).

- [ ] **Step 3: Commit**

```bash
git add docs/briefs/guion/08-cta.md
git commit -m "briefs(guion): 08-cta — transferencia + cierre de open loop

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>"
```

---

## Task 14: Regenerar vista de guión

**Files:**
- Modify: `docs/vistas-por-etapa/guion.md` (reemplazo completo, contenido auto-generado)

- [ ] **Step 1: Correr el script**

```bash
cd /home/antonio/Proyectos_local/training-video-toolkit
bash scripts/regenerar-vistas.sh
```
Expected output:
```
Regenerado: docs/vistas-por-etapa/guion.md
```

- [ ] **Step 2: Verificar output**

```bash
head -5 docs/vistas-por-etapa/guion.md
```
Expected: header con "Vista por etapa — Guion" + nota de auto-generado.

```bash
grep -c "^### " docs/vistas-por-etapa/guion.md
```
Expected: `8` (una entrada por brief).

- [ ] **Step 3: Correr verificar-briefs para baseline**

```bash
bash scripts/verificar-briefs.sh
```
Expected: `Total briefs stale: 0` (todos recién creados con `sync: 2026-04-18` que es hoy).

- [ ] **Step 4: Commit**

```bash
git add docs/vistas-por-etapa/guion.md
git commit -m "$(cat <<'EOF'
vistas(guion): regenerar como artefacto derivado de briefs

El contenido anterior de la vista (editado a mano) queda reemplazado por
la vista auto-generada desde frontmatters de docs/briefs/guion/*.md.

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
EOF
)"
```

---

## Task 15: Reescribir `skills/guion-entrenamiento/SKILL.md`

**Files:**
- Modify: `skills/guion-entrenamiento/SKILL.md`

- [ ] **Step 1: Reescribir el archivo completo**

Reemplazar íntegramente con:

```markdown
---
name: guion-entrenamiento
description: "Use when the user is at the script/storyboard stage of a training, instructional, or tutorial video — defining audience, learning objective, hook, narrative structure, segmentation, retrieval checkpoints, or producing the script document. Etapa de guión del toolkit de entrenamiento audiovisual."
---

# Guión de entrenamiento audiovisual

Acompañas al creador a producir un guión ejecutable basado en evidencia
cognitiva, tendencias actuales y herramientas disponibles.

## Carga obligatoria al inicio

Antes de proponer cualquier decisión, **lee todos los briefs de esta etapa**:

```
docs/briefs/guion/*.md
```

(8 archivos de 40-80 líneas cada uno. Orden alfabético = orden de flujo:
01-audiencia → 02-hook → 03-estructura → 04-segmentacion → 05-retrieval →
06-modalidad-dual → 07-voz-registro → 08-cta.)

**NO leer pilares completos en runtime.** Los briefs ya sintetizan la
información pertinente con trazabilidad al pilar vía IDs estables
(`[P1-§X.Y]`, `[P2-ficha-<slug>]`). Si durante el flujo surge una pregunta
del usuario fuera del scope de los briefs, usa `Grep` dirigido por ID
(ej. `grep "P1-§6.4" docs/pilares/01-fundamentos-cognitivos.md`), no
`Read` del archivo completo.

## Flujo

Camina al creador por las 8 decisiones críticas **en el orden de los
briefs cargados**. Cada decisión usa EXCLUSIVAMENTE su brief
correspondiente.

Para cada decisión:

1. **Plantear la `pregunta`** del frontmatter del brief al usuario.
2. **Aplicar el test de determinismo upstream** (solo si el brief tiene
   `admite-variantes: true`):
   - Si al menos 2 de los `Casos` listados en el brief son razonablemente
     aplicables al contexto actual del usuario (audiencia + objetivo +
     meta-formato + duración + decisiones previas): **ofrecer variantes
     con recomendación**. Formato:
     > "Veo N direcciones distintas que funcionan: [A], [B], [C]. Mi
     > inclinación es [A] por [razón del brief]. ¿Las exploramos o voy
     > con [A]?"
   - Si un solo caso domina: proponer una sola propuesta, no ofrecer
     variantes.
3. **Proponer con justificación trazable** usando `Principio aplicable` +
   `Casos` del brief. Si el brief lista `Conflictos conocidos` aplicables
   al contexto, **flaggearlos explícitamente al usuario** — no resolver
   en silencio. El pilar 1 prevalece salvo decisión informada del usuario.
4. **Dispatch de variantes (solo si el usuario aceptó explorar):**
   invocar Task tool con el siguiente contrato:
   ```
   subagent_type: general-purpose
   prompt:
     Eres un ideador divergente. Tarea: generar N variantes del artefacto
     <decision>.

     CONTEXTO ACUMULADO (decisiones previas aprobadas):
     [literal de cada decisión previa]

     BRIEF DE LA DECISIÓN (frozen, inline):
     [contenido íntegro del brief .md]

     TAREA:
     Generar N variantes que respeten Principio + Salida esperada del
     brief. Cada variante debe diferir en ÁNGULO. Para cada variante
     devolver: ángulo, contenido, cómo mapea al brief.

     NO elijas la mejor. La decisión la toma el main.
   ```
5. **Registrar la decisión aprobada** antes de pasar a la siguiente.

## Salida

Al terminar las 8 decisiones, produce el guión final usando la siguiente
plantilla:

```
TÍTULO: [título claro con promesa]
AUDIENCIA: [perfil con nivel previo explícito]
OBJETIVO DE APRENDIZAJE: Al terminar, el aprendiz podrá [acción medible].
DURACIÓN ESTIMADA: [N] min
META-FORMATO: [tutorial / explainer / demo / micro-curso]

═══ HOOK (0:00 - 0:15) ═══
[VISUAL]: [...]
[NARRACIÓN]: [...]

═══ BLOQUE 1 (0:15 - X:XX) ═══
[CONCEPTO]: [...]
[OPEN LOOP]: [...]
[VISUAL]: [...]
[NARRACIÓN]: [...]

═══ RETRIEVAL CHECKPOINT (X:XX) ═══
[PREGUNTA]: [generativa, no de reconocimiento]

═══ BLOQUE N ═══
...

═══ CIERRE Y CTA ═══
[CIERRE]: [resolución del open loop inicial]
[CTA]: [acción específica]
```

Verifica antes de declarar la etapa completa:

- [ ] Audiencia + objetivo medible.
- [ ] Hook ≤15s con stakes + confirmación visual del título.
- [ ] Estructura con 3-5 bloques y open loops cerrados.
- [ ] ≥1 retrieval checkpoint cada 5-10 min.
- [ ] Marcado de modalidad dual en el guión (no solo narración).
- [ ] Registro y WPM objetivo definidos.
- [ ] CTA específico al final.
- [ ] Cero conflictos no resueltos pilar 2 vs pilar 1.

## Reglas firmes

- **Nunca leer pilares completos** en el flujo normal. Solo briefs.
- **Trazabilidad obligatoria:** cada recomendación cita ID del brief
  (`[P1-§X.Y]`) en la justificación al usuario.
- **Conflictos pilar 2 vs pilar 1:** flaggear siempre; pilar 1 gana salvo
  override explícito del usuario con conocimiento.
- **Evitar pseudociencia:** ningún claim sobre "8 segundos de atención",
  cromoterapia, neuronas espejo, etc. Los briefs están depurados.
- **Variantes solo cuando el test de determinismo las habilita.** No ofrecer
  variantes por default en cada decisión — fatiga de decisión.
```

- [ ] **Step 2: Verificar que el skill no lee pilares en runtime**

```bash
cd /home/antonio/Proyectos_local/training-video-toolkit
grep -E "Read.*pilares/|lee.*pilar" skills/guion-entrenamiento/SKILL.md | grep -v "NO leer"
```
Expected: salida vacía (ninguna instrucción activa de leer pilares; solo la advertencia de no hacerlo).

- [ ] **Step 3: Verificar carga total**

```bash
cd /home/antonio/Proyectos_local/training-video-toolkit
skill_lines=$(wc -l < skills/guion-entrenamiento/SKILL.md)
briefs_lines=$(cat docs/briefs/guion/*.md | wc -l)
total=$((skill_lines + briefs_lines))
echo "SKILL: $skill_lines, briefs: $briefs_lines, total: $total"
```
Expected: total ≤ 500 (skill ~100-120, briefs ~40-80 × 8 = 320-640; total ~420-760 pero denso).

Si total > 500 líneas, revisar briefs demasiado largos.

- [ ] **Step 4: Commit**

```bash
git add skills/guion-entrenamiento/SKILL.md
git commit -m "$(cat <<'EOF'
skills(guion): reescribir al patrón de capa de briefs

La skill ya no lee pilares completos en runtime. Carga exclusivamente
docs/briefs/guion/*.md (8 briefs, ~350 líneas densas) y recorre decisiones
en orden alfabético. Incluye contrato de dispatch para sub-agents cuando
el test de determinismo upstream habilita variantes.

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
EOF
)"
```

---

## Task 16: Dry-run con tema dummy

**Files:**
- Ninguno (es ejecución manual del nuevo flujo).

Objetivo: validar que la skill reescrita + briefs producen un guión
coherente y trazable sobre un tema dummy. Este paso es **qualitative gate**
antes de declarar Fase A completa. Si algo no funciona, iterar en briefs
ANTES de Fase B.

- [ ] **Step 1: Elegir tema dummy**

Tema propuesto: **"Tutorial de 5 min: instalar y correr tu primer proyecto
con Bun, para devs que ya usaron Node pero nunca Bun"**.

Registrar el tema en un archivo temporal:

```bash
cd /home/antonio/Proyectos_local/training-video-toolkit
echo "Dry-run Fase A — 2026-04-18
Tema: Tutorial 5min — instalar Bun y correr primer proyecto.
Audiencia asumida: devs Node sin experiencia previa con Bun.
Meta-formato: tutorial técnico denso estilo Fireship.
Duración: 5 min." > /tmp/dry-run-fase-a.md
```

- [ ] **Step 2: Invocar la skill con el tema**

En una sesión fresca de Claude Code en este repo, ejecutar:

```
/guion-entrenamiento

Contexto: quiero un guión de 5 min sobre instalar Bun y correr mi primer
proyecto. Audiencia: devs Node sin experiencia previa con Bun. Estilo
Fireship (denso, rápido).
```

La skill debe:
1. Leer `docs/briefs/guion/*.md` (8 archivos).
2. Recorrer las 8 decisiones en orden.
3. Para decisión 02-hook (admite-variantes: true): evaluar test de
   determinismo. Con contexto "tutorial técnico + Fireship + stake
   productivo claro", debería **no ofrecer variantes** (solo caso
   Fireship aplica). Propone un hook.
4. Para decisión 03-estructura (admite-variantes: true): también
   determinado (tutorial técnico denso → lineal).
5. Producir guión final con plantilla mínima.

- [ ] **Step 3: Verificaciones cualitativas**

Revisar el output del dry-run contra:

- [ ] ¿El skill leyó solo briefs/guion/ y no pilares completos? (verificar
      en el tool-call log de la sesión).
- [ ] ¿Cada decisión cita el ID del brief correspondiente en la
      justificación? (ej. "Recomiendo hook estilo stake-productivo
      porque [P2-ficha-fireship] lo valida").
- [ ] ¿El guión final tiene las 8 partes de la plantilla llenadas sin
      "(Pendiente)"?
- [ ] ¿Hay alguna contradicción entre briefs que el skill no flaggeó?
      Si la hay, es un bug del brief, no del skill.
- [ ] ¿El skill ofreció variantes en alguna decisión con `admite-variantes:
      false`? Si sí, bug en el flujo.

- [ ] **Step 4: Registrar hallazgos**

Escribir en `/tmp/dry-run-fase-a.md` un append con:

```
### Resultados
- Briefs leídos: [lista]
- Pilares leídos en runtime: [debería ser 0]
- Decisiones con variantes ofrecidas: [lista — debería ser 0 en este caso]
- Guión producido: [ok/con issues]
- Issues detectados: [lista]
- Refinamientos sugeridos a briefs: [lista o "ninguno"]
```

- [ ] **Step 5: Si hay refinamientos, iterarlos ANTES de seguir**

Si el dry-run identifica issues en los briefs (muy cortos, muy densos,
bloques redundantes, citas incorrectas), editarlos directamente, re-commit
con mensaje `briefs(guion): refinar NN-slug tras dry-run` y volver al
Step 2 hasta que el dry-run salga limpio.

Si el issue es en el skill (flujo, dispatch de variantes), editar el
SKILL.md.

- [ ] **Step 6: Commit del log del dry-run**

Mover `/tmp/dry-run-fase-a.md` a `docs/superpowers/plans/2026-04-18-fase-a-dry-run.md`:

```bash
mv /tmp/dry-run-fase-a.md docs/superpowers/plans/2026-04-18-fase-a-dry-run.md
git add docs/superpowers/plans/2026-04-18-fase-a-dry-run.md
git commit -m "$(cat <<'EOF'
Fase A dry-run: log y hallazgos

Validación cualitativa del piloto de capa de briefs con tema dummy
(tutorial 5min de Bun). Cierra la Fase A si los criterios de aceptación
pasan.

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
EOF
)"
```

---

## Task 17: Criterios de aceptación Fase A

**Files:**
- Ninguno (checks finales + commit cero o final).

Ejecuta los checks explícitos del spec (sección "Criterios de aceptación
Fase A") y Verification global.

- [ ] **Step 1: Cada brief 40-80 líneas, 6 bloques fijos, frontmatter válido**

```bash
cd /home/antonio/Proyectos_local/training-video-toolkit
for f in docs/briefs/guion/*.md; do
  lines=$(wc -l < "$f")
  blocks=$(grep -cE "^## (Principio aplicable|Casos|Anti-patrón|Heurística|Conflictos conocidos|Salida esperada)" "$f")
  front_keys=$(awk '/^---$/{c++} c==1{print} c==2{exit}' "$f" | grep -cE "^(decision|etapa|pregunta|fuentes|admite-variantes|sync|version):")
  echo "$f: $lines líneas, $blocks bloques, $front_keys keys"
  [[ $lines -lt 40 || $lines -gt 100 ]] && echo "FAIL líneas en $f"
  [[ $blocks -lt 6 ]] && echo "FAIL bloques en $f"
  [[ $front_keys -lt 7 ]] && echo "FAIL frontmatter en $f"
done
```
Expected: cada brief entre 40-100 líneas, ≥6 bloques, ≥7 keys de frontmatter. Ninguna línea `FAIL`.

- [ ] **Step 2: ≥1 cita por claim (verificar densidad de citas)**

```bash
for f in docs/briefs/guion/*.md; do
  citas=$(grep -oE "\[P[123]-[^]]+\]" "$f" | wc -l)
  echo "$f: $citas citas"
  [[ $citas -lt 5 ]] && echo "FAIL pocas citas en $f"
done
```
Expected: cada brief con ≥5 citas. Ninguna `FAIL`.

- [ ] **Step 3: `verificar-briefs.sh` corre en <3s sobre briefs/guion/ y reporta 0 stale**

```bash
time bash scripts/verificar-briefs.sh
```
Expected: `Total briefs stale: 0` y `real` <3s.

- [ ] **Step 4: Carga total ≤ target**

```bash
skill_lines=$(wc -l < skills/guion-entrenamiento/SKILL.md)
briefs_lines=$(cat docs/briefs/guion/*.md | wc -l)
total=$((skill_lines + briefs_lines))
echo "total: $total líneas (target: ≤ 500 ideal, ≤ 800 máximo)"
```
Expected: total ≤ 800. Si > 800, revisar briefs largos. Target ideal ≤ 500 (vs ~720 líneas del estado previo).

- [ ] **Step 5: Skill no lee pilares en runtime**

```bash
grep -cE "Read.*pilares/|Read.*docs/pilares" skills/guion-entrenamiento/SKILL.md
```
Expected: `0`.

- [ ] **Step 6: Dry-run fue exitoso**

```bash
test -f docs/superpowers/plans/2026-04-18-fase-a-dry-run.md && echo "OK" || echo "FAIL"
grep -q "Guión producido: ok" docs/superpowers/plans/2026-04-18-fase-a-dry-run.md && echo "OK dry-run" || echo "FAIL dry-run"
```
Expected: `OK` y `OK dry-run`.

- [ ] **Step 7: Reportar estado al usuario**

Produce un resumen cerrando la Fase A:

```
Fase A completada:
- IDs estables: pilar 1, 2, 3 ✓
- 8 briefs en docs/briefs/guion/ ✓ (total N líneas)
- Scripts verificar-briefs.sh y regenerar-vistas.sh ✓
- Vista guion.md regenerada (artefacto derivado) ✓
- SKILL.md de guion-entrenamiento reescrita ✓ (ya no lee pilares)
- Dry-run con tema dummy: OK (guión coherente, trazable, sin iteraciones)

Ready para Fase B (replicar a edicion → grabacion → publicacion).
Próxima acción: ejecutar writing-plans para Fase B o pausar.
```

---

## Self-Review Checklist

Spec coverage:

- [x] Arquitectura 3 capas: Tasks 1-15 cubren capas 1-3.
- [x] Estructura de brief (frontmatter + 6 bloques + reglas de longitud/citas): Task 6 establece el shape; Tasks 7-13 lo replican; Task 17 verifica.
- [x] Cambios en skills de etapa (solo `guion-entrenamiento` en este plan — Fase A): Task 15.
- [x] Destino de vistas (artefacto derivado): Tasks 5 + 14.
- [x] Protocolo de variantes con test de determinismo: incorporado en Task 15 (contenido del SKILL.md).
- [x] IDs estables en pilares: Tasks 1, 2, 3.
- [x] Script `verificar-briefs.sh`: Task 4.
- [x] Script `regenerar-vistas.sh`: Task 5.
- [x] Dry-run obligatorio antes de Fase B: Task 16.
- [x] Criterios de aceptación Fase A: Task 17.

Fuera de scope correctamente diferido a otros planes:
- Fase B (edicion, grabacion, publicacion) — plan separado.
- Fase C (skill `sincronizar-briefs` + integración a `actualizar-*`) — plan separado.
- Fase D (cleanup, CLAUDE.md update) — plan separado o cierre al terminar todas las fases.

Placeholders scan: sin `TBD` / `TODO` / `implement later` / `add error handling` / `similar to Task N`. Cada task tiene contenido completo.

Type consistency: IDs coherentes en todo el plan (`[P1-§X.Y]`, `[P2-<slug>]`, `[P3-<slug>]`). Los briefs referenciados en Task 15 (SKILL.md) coinciden con los creados en Tasks 6-13. Los scripts en Tasks 4-5 son invocados en Tasks 14, 17. Frontmatter keys consistentes: `decision / etapa / pregunta / fuentes / admite-variantes / sync / version` repetido igual en todos los briefs.
