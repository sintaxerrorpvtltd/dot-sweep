"""Validate the distributable package without reading any user chat data."""
import json
from pathlib import Path

root = Path(__file__).resolve().parents[1]
manifest = json.loads((root / '.codex-plugin/plugin.json').read_text())
catalog = json.loads((root / '.agents/plugins/marketplace.json').read_text())
assert manifest['name'] == 'dot-sweep'
assert manifest['license'] == 'MIT'
assert (root / manifest['skills'] / 'dot-sweep/SKILL.md').is_file()
entry = catalog['plugins'][0]
assert entry['name'] == manifest['name']
assert entry['source']['url'] == 'https://github.com/sintaxerrorpvtltd/dot-sweep.git'
assert entry['source']['ref'] == 'main'
skill = (root / 'skills/dot-sweep/SKILL.md').read_text()
assert skill.startswith('---\nname: dot-sweep\ndescription: ')
assert skill.count('\n---\n') == 1
assert (root / 'LICENSE').is_file()
print('Package checks passed. Live desktop integration requires host acceptance checks.')
