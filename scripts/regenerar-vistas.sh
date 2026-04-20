#!/usr/bin/env bash
# regenerar-vistas.sh — emite docs/vistas-por-etapa/<etapa>.md como
# artefacto derivado de los frontmatters en docs/briefs/<etapa>/*.md.
#
# La vista queda como índice humanamente legible: lista de decisiones,
# pregunta base de cada una, fuentes citadas. No se edita a mano.

set -euo pipefail

# Resolver raíz del plugin (soporta plugin instalado + dev desde git).
# shellcheck source=lib/resolve-plugin-root.sh
source "$(dirname "${BASH_SOURCE[0]}")/lib/resolve-plugin-root.sh"

ETAPAS=(concepto guion previsualizacion grabacion edicion publicacion)
STAMP=$(date -u +%Y-%m-%dT%H:%M:%SZ)

for etapa in "${ETAPAS[@]}"; do
  brief_dir="docs/briefs/$etapa"
  [[ ! -d "$brief_dir" ]] && continue

  out="docs/vistas-por-etapa/$etapa.md"
  # POSIX-safe capitalization (compatible con BSD/macOS sed, evita \U).
  title_etapa=$(echo "$etapa" | awk '{print toupper(substr($0,1,1)) substr($0,2)}')

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
      pregunta=$(awk -F': ' '/^pregunta:/ {$1=""; sub(/^ /,""); print; exit}' "$brief")
      fuentes=$(awk '
        /^fuentes:/ { in_f=1; next }
        /^[a-z]+:/ && in_f { exit }
        in_f && /^  -/ { gsub(/^  - /,""); gsub(/ +#.*$/,""); printf "%s ", $0 }
      ' "$brief")

      base=$(basename "$brief" .md)
      n=$(echo "$base" | cut -d- -f1)
      slug=$(echo "$base" | cut -d- -f2-)
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
