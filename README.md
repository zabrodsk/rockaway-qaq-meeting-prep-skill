# Rockaway Q / QAQ Meeting Prep Skill

This package installs a private meeting-prep skill for Rockaway Q / QAQ. It scans the user's connected calendar/account context, retrieves the relevant institutional memory from the read-only Rockaway Q MCP brain, and produces a dense PDF packet for the remaining meetings in scope.

The skill produces three outputs every run:

- PDF packet: the primary meeting-prep artifact.
- Markdown source: editable notes with full source trail.
- Chat summary: compact links and top priorities.

## Install

```bash
git clone https://github.com/zabrodsk/rockaway-qaq-meeting-prep-skill.git
cd rockaway-qaq-meeting-prep-skill
./install.sh
```

Restart Codex or Claude Code after installation if it was already open.

## Configure Rockaway Q / QAQ MCP

Ask the Rockaway brain admin for your Q / QAQ bearer token. Do not commit or paste the token into shared docs.

Claude Code:

```bash
claude mcp add rockaway-q --transport http \
  http://100.102.180.108:8788/rockaway-q/mcp \
  --header "Authorization: Bearer USER_TOKEN"
```

Codex CLI:

```bash
export ROCKAWAY_Q_MCP_TOKEN="USER_TOKEN"
codex mcp add rockaway-q \
  --url http://100.102.180.108:8788/rockaway-q/mcp \
  --bearer-token-env-var ROCKAWAY_Q_MCP_TOKEN
codex mcp get rockaway-q
```

Codex config equivalent in `~/.codex/config.toml`:

```toml
[mcp_servers.rockaway-q]
url = "http://100.102.180.108:8788/rockaway-q/mcp"
bearer_token_env_var = "ROCKAWAY_Q_MCP_TOKEN"
```

The `ROCKAWAY_Q_MCP_TOKEN` environment variable must be available to the Codex process when it starts.

## Use

```text
$rockaway-q-meeting-prep prep me for today
$rockaway-q-meeting-prep prep me for my next meeting
$rockaway-q-meeting-prep prep me for tomorrow
```

By default, `today` means remaining meetings from now onward. Use "whole day" or "include past meetings" if you want the full date.

## Output Location

```text
~/Rockaway Meeting Briefs/q/YYYY-MM-DD/
  rockaway-q-meeting-prep-YYYY-MM-DD.pdf
  rockaway-q-meeting-prep-YYYY-MM-DD.md
  rockaway-q-meeting-prep-YYYY-MM-DD.html
  rockaway-q-meeting-prep-YYYY-MM-DD.json
```

Same-day reruns overwrite the default files.

## Guide

Open the PDF introduction:

```text
docs/Rockaway Q QAQ Meeting Prep Skill.pdf
```
