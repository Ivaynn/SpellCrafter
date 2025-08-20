
import shutil
from pathlib import Path

path_target = Path('../../sc-server')
path_datapack = Path('../datapack')
path_arena = Path('../arena')

shutil.rmtree(path_target / 'data/spellcrafter')
shutil.rmtree(path_target / 'data/scarena')

shutil.copytree(path_datapack / 'data/spellcrafter', path_target / 'data/spellcrafter', dirs_exist_ok=True)
shutil.copytree(path_arena / 'data/scarena', path_target / 'data/scarena', dirs_exist_ok=True)
