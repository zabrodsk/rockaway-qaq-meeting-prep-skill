# Rockaway Q / QAQ Meeting Prep

This adds a meeting-prep helper to Codex or Claude Code.

It looks at your calendar, checks the Rockaway Q / QAQ brain, and creates a private meeting-prep packet for your upcoming meetings.

You get:

- a polished PDF packet
- an editable markdown version
- a short chat summary with the most important points
- direct read-only access to ask questions against the Rockaway Q / QAQ brain from Claude Code or Codex

## Install

Open Terminal and paste this:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/zabrodsk/rockaway-qaq-meeting-prep-skill/main/bootstrap.sh)"
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

Ask the brain directly:

```text
What does the Rockaway Q brain know about this project?
Search the Q / QAQ brain for recent notes about this customer.
What open blockers do we have around this workflow?
```

Or run the meeting-prep skill:

```text
$rockaway-q-meeting-prep prep me for today
```

You can also ask:

```text
$rockaway-q-meeting-prep prep me for my next meeting
$rockaway-q-meeting-prep prep me for tomorrow
```

## Where The Packet Goes

The files are saved here:

```text
~/Rockaway Meeting Briefs/q/
```

Open the PDF first. The markdown file is there if you want to inspect sources or edit the notes.

## What Gets Connected

The setup connects only the read-only Rockaway Q MCP:

```text
rockaway-q
http://100.102.180.108:8788/rockaway-q/mcp
```

It can search and read the Q / QAQ brain. It cannot edit the brain.

## Setup Guide

Open this PDF:

[Rockaway Q QAQ Meeting Prep Skill.pdf](docs/Rockaway%20Q%20QAQ%20Meeting%20Prep%20Skill.pdf)

## Need A Token?

Ask the Rockaway brain admin for a Rockaway Q / QAQ bearer token.
