# Rockaway Q / QAQ Meeting Prep

This adds a meeting-prep helper to Codex or Claude Code.

It looks at your calendar, checks the Rockaway Q / QAQ brain, and creates a private meeting-prep packet for your upcoming meetings.
QMD search runs as a separate Mac mini QMD MCP; no local QMD install is needed. Existing GBrain MCP remains canonical for page expansion, links, backlinks, and stats.
Agents should use `rockaway-q-qmd` first for broad recall, then `rockaway-q` for canonical page expansion and graph context.

You get:

- a polished PDF packet
- an editable markdown version
- a short chat summary with the most important points

## Install

Open Terminal and paste this:

```bash
npx -y skills@latest add zabrodsk/rockaway-qaq-meeting-prep-skill -g -a codex claude-code --copy -y --full-depth && "$HOME/.codex/skills/rockaway-q-meeting-prep/setup.command"
```

The setup will ask for your bearer token.

## If You Want Codex Or Claude To Do It

Send this message:

```text
please install the meeting prep skill from the GitHub repo and run the setup command. This is my bearer token:
```

Then paste your bearer token after the colon.

## How To Use It

After setup, restart Codex or Claude Code.

Then ask:

```text
$rockaway-q-meeting-prep prep me for today
```

You can also ask:

```text
$rockaway-q-meeting-prep prep me for my next meeting
$rockaway-q-meeting-prep prep me for tomorrow
```

## CSV Or Quick Memory Lookup

For spreadsheet-style lookup, tell Codex or Claude:

```text
Use Rockaway Q / QAQ QMD first for each CSV row, then use the Q brain MCP for canonical page expansion on the strongest matches.
```

Expected output columns: `row_id`, `query`, `qmd_sources`, `gbrain_pages`, `confidence`, `summary`, `recommended_next_step`.

## Where The Packet Goes

The files are saved here:

```text
~/Rockaway Meeting Briefs/q/
```

Open the PDF first. The markdown file is there if you want to inspect sources or edit the notes.

## Setup Guide

Open this PDF:

[Rockaway Q QAQ Meeting Prep Skill.pdf](docs/Rockaway%20Q%20QAQ%20Meeting%20Prep%20Skill.pdf)

## Need A Token?

Ask the Rockaway brain admin for a Rockaway Q / QAQ bearer token.
