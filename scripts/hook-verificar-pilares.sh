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
FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty' 2>/dev/null || echo "")
[[ -z "$FILE" ]] && exit 0

echo "$FILE" | grep -qE 'docs/pilares/' || exit 0

OUTPUT=$(bash scripts/verificar-briefs.sh --strict 2>&1)
STATUS=$?

if [[ "$STATUS" -ne 0 ]]; then
  {
    echo ""
    echo "⚠️  drift detectado tras editar $FILE"
    echo "$OUTPUT" | grep -E "^(STALE|WARN):" || true
    echo "→ invocá el skill 'sincronizar-briefs' para re-sincronizar los briefs afectados."
  } >&2
fi

exit 0
