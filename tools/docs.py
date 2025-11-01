
from pathlib import Path
from utils import read_json, save_text

from spells import Spell


def main() -> None:
    resources_root = Path('../resources')
    data = read_json('spells.json')
    spells: list[Spell] = []
    for spell_data in data:
        spells.append(Spell(spell_data))

    md = ''
    pass


if __name__ == '__main__':
    main()
