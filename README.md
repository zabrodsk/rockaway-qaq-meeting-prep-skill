# Rockaway Q / QAQ Meeting Prep

This private Agent Plugin prepares upcoming Rockaway Q and QAQ meetings from your calendar and the read-only Q brain.

Each run creates:

- one polished Word document
- one short in-chat summary

## Install

Connect Tailscale first, then paste the one line for your app.

Codex:

```bash
codex plugin marketplace add zabrodsk/rockaway-qaq-meeting-prep-skill && codex plugin add rockaway-q-meeting-prep@rockaway-q-meeting-prep
```

Claude Code:

```bash
claude plugin marketplace add zabrodsk/rockaway-qaq-meeting-prep-skill && claude plugin install rockaway-q-meeting-prep@rockaway-q-meeting-prep
```

The plugin includes meeting prep, fast brain search, and canonical Q brain access. No bearer token or separate QMD installation is needed.

## Use

In Codex:

```text
$rockaway-q-meeting-prep prep me for today
```

In Claude Code:

```text
/rockaway-q-meeting-prep:rockaway-q-meeting-prep prep me for today
```

Natural language also works: `Prep me for my next meeting using the Rockaway Q brain.`

The Word document is saved under `~/Rockaway Meeting Briefs/q/YYYY-MM-DD/`.

## Compatibility Fallback

Older Codex or Claude Code versions can use:

```bash
npx -y skills@latest add zabrodsk/rockaway-qaq-meeting-prep-skill -g -a codex claude-code --copy -y --full-depth && "$HOME/.codex/skills/rockaway-q-meeting-prep/setup.command"
```

## Setup Guide

[Rockaway Q QAQ Meeting Prep Skill.pdf](docs/Rockaway%20Q%20QAQ%20Meeting%20Prep%20Skill.pdf)
