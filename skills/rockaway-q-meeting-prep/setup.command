#!/usr/bin/env bash
set -euo pipefail

TEAM_LABEL="Rockaway Q / QAQ"
SKILL_NAME="rockaway-q-meeting-prep"
MCP_NAME="rockaway-q"
MCP_URL="https://clawdbot--mac-mini.taild9e247.ts.net:8446/mcp"
QMD_MCP_NAME="rockaway-q-qmd"
QMD_MCP_URL="https://clawdbot--mac-mini.taild9e247.ts.net:8444/mcp"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

copy_skill_to() {
  local target_root="$1"
  mkdir -p "$target_root"
  rm -rf "$target_root/$SKILL_NAME"
  cp -R "$ROOT" "$target_root/$SKILL_NAME"
  chmod 0755 "$target_root/$SKILL_NAME/setup.command" 2>/dev/null || true
  chmod 0755 "$target_root/$SKILL_NAME/.rockaway-meeting-prep-common/scripts/render_packet.js" 2>/dev/null || true
}

write_codex_mcp() {
  local name="$1" url="$2"
  python3 - "$name" "$url" <<'PY'
import re
import sys
from pathlib import Path

name, url = sys.argv[1:]
path = Path.home() / ".codex" / "config.toml"
path.parent.mkdir(parents=True, exist_ok=True)
block = f'[mcp_servers.{name}]\nurl = "{url}"\n'
text = path.read_text(encoding="utf-8") if path.exists() else ""
pattern = re.compile(rf"(?ms)^\[mcp_servers\.{re.escape(name)}\]\s.*?(?=^\[|\Z)")
text = pattern.sub(block, text) if pattern.search(text) else text.rstrip() + "\n\n" + block
path.write_text(text.lstrip(), encoding="utf-8")
PY
}

write_claude_mcp() {
  local name="$1" url="$2"
  python3 - "$name" "$url" <<'PY'
import json
import sys
from pathlib import Path

name, url = sys.argv[1:]
path = Path.home() / ".claude.json"
try:
    data = json.loads(path.read_text(encoding="utf-8")) if path.exists() else {}
except Exception:
    data = {}
servers = data.setdefault("mcpServers", {})
servers[name] = {"type": "http", "url": url}
path.write_text(json.dumps(data, indent=2) + "\n", encoding="utf-8")
PY
}

configure_mcp() {
  local name="$1" url="$2"
  if command -v codex >/dev/null 2>&1; then
    codex mcp remove "$name" >/dev/null 2>&1 || true
    codex mcp add "$name" --url "$url" >/dev/null
  fi
  if command -v claude >/dev/null 2>&1; then
    claude mcp remove "$name" --scope user >/dev/null 2>&1 || true
    claude mcp add "$name" --scope user --transport http "$url" >/dev/null
  fi
  write_codex_mcp "$name" "$url"
  write_claude_mcp "$name" "$url"
}

echo "$TEAM_LABEL Meeting Prep compatibility setup"
echo "The Agent Plugin is preferred. This fallback installs the same skill and private MCP connections."
copy_skill_to "${CODEX_HOME:-$HOME/.codex}/skills"
copy_skill_to "$HOME/.claude/skills"
configure_mcp "$MCP_NAME" "$MCP_URL"
configure_mcp "$QMD_MCP_NAME" "$QMD_MCP_URL"
echo "Done. Restart Codex or Claude Code, then ask: $SKILL_NAME prep me for today"
