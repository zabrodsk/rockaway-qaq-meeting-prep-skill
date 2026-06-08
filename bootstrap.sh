#!/usr/bin/env bash
set -euo pipefail

R=rockaway-qaq-meeting-prep-skill
S=rockaway-q-meeting-prep
npx -y skills@latest add zabrodsk/${R} -g -a codex claude-code --copy -y --full-depth
"$HOME/.agents/skills/${S}/setup.command"
