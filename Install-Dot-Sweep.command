#!/bin/zsh
set -eu

# Use the user's existing Codex installation; never download or execute an installer.
dot_sweep_cli="$(command -v codex || true)"
if [[ -z "$dot_sweep_cli" ]]; then
  dot_sweep_cli='/Applications/ChatGPT.app/Contents/Resources/codex-cli/bin/codex'
fi
if [[ ! -x "$dot_sweep_cli" ]]; then
  print -u2 'Codex CLI was not found. Install/update the official Codex desktop app first.'
  exit 1
fi

print 'Installing Dot Sweep from github.com/sintaxerrorpvtltd/dot-sweep'
"$dot_sweep_cli" plugin marketplace add https://github.com/sintaxerrorpvtltd/dot-sweep.git
"$dot_sweep_cli" plugin add dot-sweep@sintax-error
print '\nDot Sweep installed. Start a new chat and ask:'
print 'Use Dot Sweep to review my unread updates. Do not clear anything.'
print '\nThis plugin cannot recolour native dots or monitor updates unattended.'
if [[ -t 0 ]]; then
  read -r '?Press Return to close. '
fi
