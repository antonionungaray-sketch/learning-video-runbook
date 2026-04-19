#!/usr/bin/env bash
# verificar-briefs.sh — detecta drift entre briefs y pilares.
#
# Para cada brief en docs/briefs/**/*.md, compara su `sync:` con la
# fecha del último commit que tocó el RANGO DE LA SECCIÓN donde vive
# cada ID del pilar listado en `fuentes:`.
#
# La "sección" de un ID es:
#   - Si el ID está en un header `### X.Y ...`: desde esa línea hasta
#     la línea anterior al siguiente `### ` o `## ` en el archivo.
#   - Si el ID está en un header `## X ...`: desde esa línea hasta la
#     línea anterior al siguiente `## ` (no ###).
#   - Si el ID está inline (ej. item numerado de Mayer): solo esa línea.
#
# Esto detecta edits en CONTENIDO dentro de la sección, no solo en el
# header. Un cambio cosmético a una palabra dentro del bloque del ID
# marca el brief como stale.
#
# Adicional: valida que cada ID listado en `fuentes:` exista en el
# pilar citado (detecta typos) y que cada ID citado inline en el
# cuerpo esté declarado en `fuentes:`.
#
# Zero-dependency: bash + git + grep + awk. Exit 0 por defecto.
# Con --strict, exit 1 si hay cualquier problema (stale, IDs missing, inline missing).

set -euo pipefail

STRICT=0
for arg in "$@"; do
  case "$arg" in
    --strict) STRICT=1 ;;
    -h|--help)
      echo "usage: $0 [--strict]"
      echo "  --strict    exit 1 si hay drift o integridad rota (para hooks/CI)"
      exit 0
      ;;
    *)
      echo "ERROR: flag desconocido: $arg" >&2
      echo "usage: $0 [--strict]" >&2
      exit 2
      ;;
  esac
done

REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null) || {
  echo "ERROR: no estás dentro de un repo git" >&2
  exit 1
}
cd "$REPO_ROOT"

map_fuente_to_file() {
  local fuente="$1"
  case "$fuente" in
    P1-*) echo "docs/pilares/01-fundamentos-cognitivos.md" ;;
    P2-ficha-*)
      for f in docs/casos-de-exito/tutoriales-tecnicos.md \
               docs/casos-de-exito/divulgacion-corta.md \
               docs/casos-de-exito/onboarding-corporativo.md; do
        if grep -q "\[$fuente\]" "$f" 2>/dev/null; then
          echo "$f"
          return
        fi
      done
      echo ""
      ;;
    P2-*) echo "docs/pilares/02-tendencias-y-casos.md" ;;
    P3-*) echo "docs/pilares/03-herramientas.md" ;;
    *) echo "" ;;
  esac
}

# Dada (file, start_line), determina la línea de fin de la sección
# según el tipo de header en start_line.
section_end() {
  local file="$1"
  local start="$2"
  local line_content
  line_content=$(sed -n "${start}p" "$file")

  local end
  if [[ "$line_content" =~ ^###\  ]]; then
    end=$(awk -v s="$start" 'NR>s && (/^### /||/^## /) {print NR-1; exit}' "$file")
  elif [[ "$line_content" =~ ^##\  ]]; then
    end=$(awk -v s="$start" 'NR>s && /^## / && !/^### / {print NR-1; exit}' "$file")
  else
    end="$start"
  fi

  if [[ -z "$end" ]]; then
    end=$(wc -l < "$file")
  fi
  echo "$end"
}

STALE_COUNT=0
MISSING_COUNT=0
INLINE_MISSING_COUNT=0

while IFS= read -r brief; do
  sync_date=$(awk '/^sync:/ {print $2; exit}' "$brief" 2>/dev/null || echo "")
  if [[ -z "$sync_date" ]]; then
    echo "WARN: $brief sin frontmatter sync:" >&2
    continue
  fi

  fuentes=$(awk '
    /^fuentes:/ { in_fuentes=1; next }
    /^[a-z]+:/ && in_fuentes { exit }
    in_fuentes && /^  -/ { gsub(/^  - /,""); gsub(/ +#.*$/,""); print }
  ' "$brief")

  body_ids=$(awk 'BEGIN{in_front=0; dashes=0}
    /^---$/ { dashes++; if (dashes==2) in_front=1; next }
    in_front { print }
  ' "$brief" | grep -oE "\[P[123]-[^]]+\]" | tr -d '[]' | sort -u)

  front_ids=$(echo "$fuentes" | sort -u)

  while IFS= read -r bid; do
    [[ -z "$bid" ]] && continue
    if ! echo "$front_ids" | grep -qxF "$bid"; then
      echo "WARN: $brief cita [$bid] inline pero no lo declara en fuentes:"
      INLINE_MISSING_COUNT=$((INLINE_MISSING_COUNT + 1))
    fi
  done <<< "$body_ids"

  while IFS= read -r fuente; do
    [[ -z "$fuente" ]] && continue
    pilar_file=$(map_fuente_to_file "$fuente")
    if [[ -z "$pilar_file" ]]; then
      echo "WARN: $brief cita $fuente — pilar no mapeado" >&2
      continue
    fi
    if [[ ! -f "$pilar_file" ]]; then
      echo "WARN: $brief cita $fuente en $pilar_file — archivo no existe" >&2
      continue
    fi

    start=$(grep -n "\[$fuente\]" "$pilar_file" 2>/dev/null | head -1 | cut -d: -f1)
    if [[ -z "$start" ]]; then
      echo "WARN: $brief cita $fuente — ID no encontrado en $pilar_file"
      MISSING_COUNT=$((MISSING_COUNT + 1))
      continue
    fi

    end=$(section_end "$pilar_file" "$start")

    # Drift por rango de sección (detecta edits en contenido, no solo header)
    last_edit=$(git log -1 --format=%cs -L "$start,$end:$pilar_file" 2>/dev/null | head -1 || echo "")
    [[ -z "$last_edit" ]] && continue

    if [[ "$last_edit" > "$sync_date" ]]; then
      echo "STALE: $brief cita $fuente ($pilar_file:$start-$end editado $last_edit, sync $sync_date)"
      STALE_COUNT=$((STALE_COUNT + 1))
    fi
  done <<< "$fuentes"
done < <(find docs/briefs -type f -name '*.md' 2>/dev/null | sort)

echo ""
echo "Total briefs stale: $STALE_COUNT"
echo "Total IDs no encontrados en pilar: $MISSING_COUNT"
echo "Total IDs inline no declarados en fuentes: $INLINE_MISSING_COUNT"

if [[ "$STRICT" -eq 1 ]] && (( STALE_COUNT + MISSING_COUNT + INLINE_MISSING_COUNT > 0 )); then
  exit 1
fi
exit 0
