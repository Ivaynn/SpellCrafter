
import shutil
from pathlib import Path
from spells import read_json, save_json, read_mcfunction, save_mcfunction
import re

# Setup - path to datapacks
path_target = Path('../../sc-server')
path_datapack = Path('../datapack')
path_arena = Path('../arena')


# Remove old files
shutil.rmtree(path_target / 'data/spellcrafter')
shutil.rmtree(path_target / 'data/scarena')

shutil.copytree(path_datapack / 'data/spellcrafter', path_target / 'data/spellcrafter', dirs_exist_ok=True)
shutil.copytree(path_arena / 'data/scarena', path_target / 'data/scarena', dirs_exist_ok=True)


# Custom wand version number - increment this if players should asked to update their wands

version = 4

mcfunction = read_mcfunction(path_target / 'data/spellcrafter/function/load.mcfunction')
mcfunction = re.sub(r'(scoreboard players set #version spellcrafter\.options) \d+', rf'\1 {version}', mcfunction)
save_mcfunction(mcfunction, path_target / 'data/spellcrafter/function/load.mcfunction')

loot_table = read_json(path_target / 'data/scarena/loot_table/initial_wand.json')
loot_table['functions'][-1]['tag'] = re.sub(r'(version:)\d', rf'\1 {version}', loot_table['functions'][-1]['tag'])
save_json(loot_table, path_target / 'data/scarena/loot_table/initial_wand.json')
