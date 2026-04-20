#!/usr/bin/env bash
# hook-verificar-pilares.sh — Claude Code PostToolUse hook.
#
# Cuando se edita/escribe un archivo bajo docs/pilares/, corre
# verificar-briefs.sh --strict y, si hay drift, lo reporta por stderr
# con sugerencia de invocar sincronizar-briefs.
#
# Siempre exit 0: el hook avisa, no bloquea.

set -uo pipefail

cd "${CLAUDE_PROJECT_DIR:-$(git rev-parse --show-toplevel 2>/dev/null)}" 2>/dev/null || exit 0

INPUT=$(cat)

# Extraer .tool_input.file_path sin depender de jq. Preferimos python3 (casi
# universal); si no está, caemos a un parser grep/sed suficientemente robusto
# para el formato estable que Claude Code emite por este hook.
if command -v python3 >/dev/null 2>&1; then
  FILE=$(printf '%s' "$INPUT" | python3 -c 'import json,sys
try:
    d=json.load(sys.stdin)
    print(d.get("tool_input",{}).get("file_path",""))
except Exception:
    pass' 2>/dev/null)
elif command -v jq >/dev/null 2>&1; then
  FILE=$(printf '%s' "$INPUT" | jq -r '.tool_input.file_path // empty' 2>/dev/null)
else
  FILE=$(printf '%s' "$INPUT" | grep -oE '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed -E 's/.*"file_path"[[:space:]]*:[[:space:]]*"([^"]*)".*/\1/')
fi

[[ -z "$FILE" ]] && exit 0

echo "$FILE" | grep -qE 'docs/pilares/' || exit 0

OUTPUT=$(bash scripts/verificar-briefs.sh --strict 2>&1)
STATUS=$?

if [[ "$STATUS" -ne 0 ]]; then
  {
    echo ""
    echo "⚠️  drift detectado tras editar $FILE"
    echo "$OUTPUT" | grep -E "^(STALE|WARN):" || true
    echo "→ invoca el skill 'sincronizar-briefs' para re-sincronizar los briefs afectados."
  } >&2
fi

exit 0
