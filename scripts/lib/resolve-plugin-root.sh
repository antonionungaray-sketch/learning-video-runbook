#!/usr/bin/env bash
# resolve-plugin-root.sh — helper sourceable para resolver la raíz del plugin.
#
# Uso: source este archivo desde otro script; deja $PLUGIN_ROOT seteado
# y hace `cd "$PLUGIN_ROOT"` para que los paths relativos funcionen.
#
# Orden de resolución:
#   1) $CLAUDE_PLUGIN_ROOT si está seteado (skill lo exporta en modo instalado).
#   2) Derivar desde la ubicación del script caller — robusto cuando el
#      plugin vive bajo ~/.claude/plugins/... sin git.
#   3) Fallback: git toplevel (modo desarrollo del plugin fuente).
#
# Requiere: el caller debe sourcear este archivo desde dentro de scripts/
# (o scripts/lib/ si es sub-helper). La detección de raíz valida la
# presencia de .claude-plugin/plugin.json como firma del plugin.

# Preferir la env var del plugin.
if [[ -n "${CLAUDE_PLUGIN_ROOT:-}" ]]; then
  PLUGIN_ROOT="$CLAUDE_PLUGIN_ROOT"
else
  # Derivar desde el caller: $0 es el script invocado (e.g. scripts/foo.sh).
  # Subimos un nivel desde scripts/ para llegar a la raíz.
  _caller_dir="$(cd "$(dirname "${BASH_SOURCE[1]:-$0}")" && pwd)"
  # Si el caller está en scripts/lib/, subir dos; si está en scripts/, subir uno.
  case "$_caller_dir" in
    */scripts/lib) PLUGIN_ROOT="$(cd "$_caller_dir/../.." && pwd)" ;;
    */scripts)     PLUGIN_ROOT="$(cd "$_caller_dir/.." && pwd)" ;;
    *)             PLUGIN_ROOT="$_caller_dir" ;;
  esac

  # Si la derivación no aterrizó en un plugin válido, intentar git toplevel.
  if [[ ! -f "$PLUGIN_ROOT/.claude-plugin/plugin.json" ]]; then
    _git_root=$(git rev-parse --show-toplevel 2>/dev/null || true)
    if [[ -n "$_git_root" ]] && [[ -f "$_git_root/.claude-plugin/plugin.json" ]]; then
      PLUGIN_ROOT="$_git_root"
    fi
  fi
fi

if [[ ! -f "$PLUGIN_ROOT/.claude-plugin/plugin.json" ]]; then
  echo "ERROR: no se pudo resolver la raíz del plugin video-explainer-guide." >&2
  echo "  Buscado en: $PLUGIN_ROOT" >&2
  echo "  Seteá \$CLAUDE_PLUGIN_ROOT o ejecutá desde el repo fuente." >&2
  exit 1
fi

export PLUGIN_ROOT
cd "$PLUGIN_ROOT"
