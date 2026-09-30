#!/bin/sh
# Rebuild dist/MU-Local.html (single file) and dist/MU-Local-source.zip
set -e
cd "$(dirname "$0")"
mkdir -p dist
python3 - <<'PY'
import re
html = open('game/index.html', encoding='utf-8').read()
inline = lambda m: '<script>\n' + open('game/' + m.group(1), encoding='utf-8').read() + '\n</script>'
open('dist/MU-Local.html', 'w', encoding='utf-8').write(re.sub(r'<script src="([^"]+)"></script>', inline, html))
PY
rm -f dist/MU-Local-source.zip
zip -qr dist/MU-Local-source.zip README.md docs game server tools build.sh -x "server/OpenMU/*"
