import shutil

version = '0.2.0'

shutil.make_archive(f'SpellCrafter-{version}', 'zip', '../datapack')
shutil.make_archive(f'SpellCrafter-{version}-ResourcePack', 'zip', '../resources')
shutil.make_archive(f'SpellCrafter-{version}-Arena', 'zip', '../arena')
