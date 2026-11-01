# Dot Sweep

An open-source Codex / ChatGPT Work plugin by Sintax Error Private Limited for the hundred-blue-dots problem.

**Status: experimental, not yet verified in a live desktop session.** Packaging checks pass; the desktop host's task-list tool failed during initial testing. This is a review-and-clear skill, not a native colour-changing extension.

Ask once instead of opening every chat:

> Review my unread agent updates. Show what needs me, finished work, coordination only, and running work.

> Clear reviewed coordination updates. Keep questions, approvals, failures, and uncertain updates unread.

## What this version does

Packages a skill that uses the desktop app's existing thread-list, thread-read, and read-state tools. It produces a grouped digest and performs explicitly requested bulk clearing, with refresh-before-write checks and per-item results. No server, dependency install, API key, or telemetry is included.

It does **not** change native dot colours, install a sidebar widget, detect every agent message automatically, or provide an unattended watcher. A generic MCP server cannot manufacture access to the app's private inbox. If the host does not expose working thread tools, this plugin cannot clear dots.

## Install

Add this repository as a local/plugin marketplace using your client's supported plugin manager and select Dot Sweep. The marketplace catalog is `.agents/plugins/marketplace.json`. Install is client-specific; no universal CLI command is assumed.

For clients with skill loading but no marketplace support, place `skills/dot-sweep` in their supported skills directory. Thread-management tools must still be provided by the desktop host. Reload the client's skills and invoke `$dot-sweep` or ask to review unread agent updates.

## Limits worth knowing

- No reliable provenance means no automatic "coordination only" classification.
- Idle/turn-complete is not proof that the underlying task finished.
- Listing may be bounded; the digest must disclose incomplete coverage.
- New messages can race the read-state write because no atomic version guard is exposed.
- ChatGPT read states are window-local and reset across app restarts.
- Undo restores unread flags only. No chat content is changed.

## Validation and contributions

Run `python3 scripts/check_package.py`. This checks packaging, not host integration. Exercise the scenarios in `tests/acceptance.md` on a compatible desktop client before calling the clearing workflow verified.

Contributions welcome via issues and pull requests. Use synthetic examples; do not upload private chat exports, IDs, or account credentials.

MIT licensed. Unofficial; not affiliated with OpenAI.
