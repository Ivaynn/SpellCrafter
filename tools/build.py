import shutil
import json
from pathlib import Path

version = '0.2.1'

path = Path('../datapack/pack.mcmeta')
mcmeta = json.loads(path.read_text(encoding='utf-8'))
mcmeta['pack']['description'] = f'Ivaynn\'s SpellCrafter {version}'
path.write_text(json.dumps(mcmeta, indent=4, ensure_ascii=False), encoding='utf-8')

path = Path('../resources/pack.mcmeta')
mcmeta = json.loads(path.read_text(encoding='utf-8'))
mcmeta['pack']['description'] = f'Resource Pack for Ivaynn\'s SpellCrafter {version}'
path.write_text(json.dumps(mcmeta, indent=4, ensure_ascii=False), encoding='utf-8')

shutil.make_archive(f'SpellCrafter-{version}', 'zip', '../datapack')
shutil.make_archive(f'SpellCrafter-{version}-ResourcePack', 'zip', '../resources')
