#!/usr/bin/env python3
"""Build game/assets/atlas.js from Kenney's CC0 packs (https://kenney.nl).
Usage: make_atlas.py <tiny-dungeon-dir> <tiny-town-dir>
Downloads: kenney.nl/assets/tiny-dungeon and kenney.nl/assets/tiny-town (unzipped)."""
import sys, io, json, base64
from PIL import Image

dun, town = sys.argv[1], sys.argv[2]
sheets = {'d': Image.open(f'{dun}/Tilemap/tilemap_packed.png').convert('RGBA'),
          't': Image.open(f'{town}/Tilemap/tilemap_packed.png').convert('RGBA')}
# name -> (sheet, tile index); both sheets are 12 tiles wide, 16px tiles
SPRITES = {
    'dk': ('d', 97), 'dw': ('d', 84), 'elf': ('d', 112),
    'spider': ('d', 122), 'budge': ('d', 120), 'bull': ('d', 109), 'hound': ('d', 123), 'lich': ('d', 111),
    'npc_shop': ('d', 86), 'npc_quest': ('d', 100),
    'grass': ('t', 0), 'grass2': ('t', 1), 'dirt': ('t', 40), 'stone': ('t', 109),
    'tree_g': ('t', 28), 'tree_o': ('t', 27), 'bush': ('t', 5), 'mush': ('t', 29), 'flower': ('t', 2),
    'coin': ('t', 93), 'hp_pot': ('d', 127), 'mp_pot': ('d', 128), 'shield': ('d', 101),
    'goblin': ('d', 88), 'slime': ('d', 108), 'ghost': ('d', 121), 'crab': ('d', 110), 'wolf': ('d', 124), 'woman': ('d', 99),
    'sword': ('d', 105), 'staff': ('d', 129), 'bow': ('t', 118),
}
names = list(SPRITES); COLS = 8
atlas = Image.new('RGBA', (COLS * 16, ((len(names) + COLS - 1) // COLS) * 16))
for k, n in enumerate(names):
    s, i = SPRITES[n]
    t = sheets[s].crop(((i % 12) * 16, (i // 12) * 16, (i % 12) * 16 + 16, (i // 12) * 16 + 16))
    atlas.paste(t, ((k % COLS) * 16, (k // COLS) * 16))
buf = io.BytesIO(); atlas.save(buf, 'PNG', optimize=True)
js = 'window.ATLAS=' + json.dumps({'cols': COLS, 'names': names,
      'src': 'data:image/png;base64,' + base64.b64encode(buf.getvalue()).decode()}) + ';\n'
open('game/assets/atlas.js', 'w').write('// Sprites: Kenney "Tiny Dungeon" + "Tiny Town" (CC0, https://kenney.nl)\n' + js)
print('wrote game/assets/atlas.js', len(js), 'bytes,', len(names), 'sprites')
