#!/usr/bin/env bash
# validar-metadata-pilar3.sh — verifica que cada herramienta en docs/pilares/03-herramientas.md
# tenga un bloque <!-- meta: <slug> --> dentro de las siguientes 15 líneas.
#
# Exit codes:
#   0 — todos los bullets tienen metadata válida
#   1 — al menos un bullet no tiene metadata, o metadata malformada
#   2 — error de invocación (archivo no encontrado)

set -euo pipefail

# Resolver raíz del plugin (soporta plugin instalado + dev desde git).
# shellcheck source=lib/resolve-plugin-root.sh
source "$(dirname "${BASH_SOURCE[0]}")/lib/resolve-plugin-root.sh"

PILAR="$PLUGIN_ROOT/docs/pilares/03-herramientas.md"

if [ ! -f "$PILAR" ]; then
  echo "ERROR: $PILAR no existe" >&2
  exit 2
fi

# Números de línea de todos los bullets de herramienta (líneas que empiezan con "- **")
mapfile -t bullets < <(grep -n '^- \*\*' "$PILAR" | cut -d: -f1)

# Números de línea de todos los bloques meta
mapfile -t metas < <(grep -n '<!-- meta:' "$PILAR" | cut -d: -f1)

total_bullets=${#bullets[@]}
sin_meta=0

for bl in "${bullets[@]}"; do
  encontrado=0
  for ml in "${metas[@]}"; do
    # Meta debe aparecer en las 15 líneas siguientes al bullet
    if [ "$ml" -gt "$bl" ] && [ "$ml" -lt "$((bl + 15))" ]; then
      encontrado=1
      break
    fi
  done
  if [ "$encontrado" -eq 0 ]; then
    # Extrae el nombre del bullet para diagnóstico
    nombre=$(sed -n "${bl}p" "$PILAR" | sed 's/^- \*\*\([^*]*\)\*\*.*/\1/')
    echo "WARN: bullet sin meta en línea $bl — $nombre" >&2
    sin_meta=$((sin_meta + 1))
  fi
done

echo "Total bullets: $total_bullets — con meta: $((total_bullets - sin_meta)) — sin meta: $sin_meta" >&2

if [ "$sin_meta" -gt 0 ]; then
  exit 1
fi

echo "OK: todas las herramientas tienen metadata válida" >&2
exit 0
