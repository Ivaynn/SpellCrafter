
import json
from enum import Enum
from pathlib import Path
from dataclasses import dataclass

with open('loot_table.json', 'r', encoding='utf-8') as f:
    LOOT_TABLE: dict = json.load(f)

with open('advancement.json', 'r', encoding='utf-8') as f:
    ADVANCEMENT: dict = json.load(f)

class SpellType(Enum):
    PROJECTILE = 1
    MODIFIER = 2
    INSTANT = 3
    SPECIAL = 4

    @property
    def icon(self) -> str:
        if self == SpellType.PROJECTILE: return '→'
        if self == SpellType.MODIFIER: return '⛶'
        if self == SpellType.INSTANT: return '✦'
        if self == SpellType.SPECIAL: return '⚝'
        raise ValueError
    
    @property
    def color(self) -> str:
        if self == SpellType.PROJECTILE: return 'gold'
        if self == SpellType.MODIFIER: return 'blue'
        if self == SpellType.INSTANT: return 'light_purple'
        if self == SpellType.SPECIAL: return 'dark_aqua'
        raise ValueError

class SpellTier(Enum):
    COMMON = 1
    UNCOMMON = 2
    RARE = 3
    EPIC = 4
    LEGENDARY = 5

    @property
    def color(self) -> str:
        if self == SpellTier.COMMON: return '#ffffff'
        if self == SpellTier.UNCOMMON: return '#ffff55'
        if self == SpellTier.RARE: return '#55ffff'
        if self == SpellTier.EPIC: return '#ff55ff'
        if self == SpellTier.LEGENDARY: return '#ff5555'
        raise ValueError

@dataclass
class SpellStats:
    damage: int|None = None
    range: int|None = None
    speed: int|None = None
    heal: int|None = None
    damage_mod: int|None = None
    range_mod: int|None = None
    speed_mod: int|None = None

class Spell:
    def __init__(self, d: dict):
        self.id = int(d['id'])
        self.name = str(d['name'])
        self.display_name = str(d['displayName'])
        self.parent: str|Spell = str(d['parent'])
        self.tier = SpellTier(d['tier'])
        self.mana = int(d.get('mana', 0))
        self.cooldown = int(d.get('cooldown', 0))
        self.type = SpellType[str(d['type']).upper()]
        self.wand_mod = bool(d.get('wandModifier', False))
        self.description: list[str] = d['description']
        self.stats = None

        if 'stats' in d.keys():
            stats: dict = d['stats']
            self.stats = SpellStats(
                damage=stats.get('damage', None),
                range=stats.get('range', None),
                speed=stats.get('speed', None),
                heal=stats.get('heal', None),
                damage_mod=stats.get('damage_mod', None),
                range_mod=stats.get('range_mod', None),
                speed_mod=stats.get('speed_mod', None),
            )

    def get_loot_table(self) -> dict:
        d = LOOT_TABLE.copy()
        # TODO
        return d

    def get_advancement(self) -> dict:
        d = ADVANCEMENT.copy()
        # TODO
        return d

    def __str__(self) -> str:
        return self.name

    def __repr__(self) -> str:
        return f'Spell({self.display_name})'


def main() -> None:

    datapack_root = Path('../datapack')
    resources_root = Path('../resources')
    with open('spells.json', 'r', encoding='utf-8') as f:
        data: list[dict] = json.load(f)

    spells: list[Spell] = []
    for spell in data:
        spells.append(Spell(spell))

    # Link parents to spell objects
    for spell in spells:
        parent = [s for s in spells if s.name==spell.parent]
        spell.parent = parent[0] if parent else spell.parent

    # TODO
    pass


if __name__ == '__main__':
    main()
