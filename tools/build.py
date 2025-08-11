import shutil

version = '0.1.0'

shutil.make_archive(f'SpellCrafter-{version}', 'zip', '../datapack')
shutil.make_archive(f'SpellCrafter-{version}-resources', 'zip', '../resources')
