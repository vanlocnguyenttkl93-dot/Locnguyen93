#!/bin/sh
# Rebuild dist/MU-Local.html (single file) and dist/MU-Local-source.zip
set -e
cd "$(dirname "$0")"
mkdir -p dist
python3 - <<'PY'
html = open('game/index.html', encoding='utf-8').read()
js = open('game/game.js', encoding='utf-8').read()
open('dist/MU-Local.html', 'w', encoding='utf-8').write(html.replace('<script src="game.js"></script>', '<script>\n' + js + '\n</script>'))
PY
rm -f dist/MU-Local-source.zip
zip -qr dist/MU-Local-source.zip README.md docs game build.sh
