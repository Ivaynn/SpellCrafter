import shutil

version = '1.0.0'

shutil.make_archive(f'SpellCrafter-{version}', 'zip', '../datapack')
shutil.make_archive(f'SpellCrafter-{version}-resources', 'zip', '../resources')
