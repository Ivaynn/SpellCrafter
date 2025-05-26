
import json
from enum import Enum
from pathlib import Path
from dataclasses import dataclass

def read_json(file_path: Path|str):
    with open(file_path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    return data

def save_json(data: dict|list, file_path: Path|str, indent=None):
    with open(file_path, 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=indent, ensure_ascii=False)

def read_mcfunction(file_path: Path|str):
    with open(file_path, 'r', encoding='utf-8') as f:
        text = f.read()
    return text

def save_mcfunction(text: str, file_path: Path|str):
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(text)

LOOT_TABLE: dict = read_json('loot_table.json')
ADVANCEMENT: dict = read_json('advancement.json')

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
    
    def __str__(self) -> str:
        return self.name.lower()

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

    def __bool__(self) -> bool:
        return any(stat is not None for stat in self.__dict__.values())

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
        self.stats = SpellStats()

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

        lore: list[dict] = [{'text':f'◆ {self.mana}','color':'aqua','italic':False,'extra':[{'text':f'   ⌚ {round_cooldown(self.cooldown/20)}','color':'gray','italic':False}]}]
        lore.append({'text':''})
        lore.extend([{'text':line,'color':'gray','italic':False} for line in self.description])
        if self.stats:
            lore.append({'text':''})
        if self.stats.damage is not None:
            lore.append({'text':'Damage: ','color':'gray','italic':False,'extra':[{'text':f'{round_stat(self.stats.damage/2)} ❤','color':'red'}]})
        if self.stats.range is not None:
            lore.append({'text':'Range: ','color':'gray','italic':False,'extra':[{'text':f'{round_stat(self.stats.range)}','color':'red'},{'text':' blocks','color':'dark_gray'}]})
        if self.stats.speed is not None:
            lore.append({'text':'Speed: ','color':'gray','italic':False,'extra':[{'text':f'{round_stat(self.stats.speed*5)}','color':'red'},{'text':' blocks/sec','color':'dark_gray'}]})
        if self.stats.damage_mod is not None:
            lore.append({'text':'Damage: ','color':'gray','italic':False,'extra':[{'text':f'{round_stat_mod(self.stats.damage_mod/2)} ❤','color':'red'}]})
        if self.stats.range_mod is not None:
            lore.append({'text':'Range: ','color':'gray','italic':False,'extra':[{'text':f'{round_stat_mod(self.stats.range_mod)}','color':'red'},{'text':' blocks','color':'dark_gray'}]})
        if self.stats.speed_mod is not None:
            lore.append({'text':'Speed: ','color':'gray','italic':False,'extra':[{'text':f'{round_stat_mod(self.stats.speed_mod*5)}','color':'red'},{'text':' blocks/sec','color':'dark_gray'}]})
        if self.stats.heal is not None:
            lore.append({'text':'Heal: ','color':'gray','italic':False,'extra':[{'text':f'{round_stat(self.stats.heal/2)} ❤','color':'red'}]})
        lore.extend([{'text':''},{'text':f'{self.type.icon} {str(self.type).capitalize()}','color':f'{self.type.color}','italic':False}])

        d['functions'][1]['tag'] = f'{{spellcrafter:{{spell:{{valid:1b,id:{self.id},mana:{self.mana},cooldown:{self.cooldown},tier:{self.tier.value},lore:{{"text":"{self.type.icon} {self.display_name.replace('\'','\\\'')}","color":"{self.type.color}","italic":false}}}}}}}}'
        d['functions'][2]['name'] = {'text': self.display_name, 'color': self.tier.color}
        d['functions'][3]['lore'] = lore
        d['functions'][4]['strings']['values'][0] = f'spellcrafter.spell.{self.name}'
        return d

    def get_advancement(self) -> dict:
        d = ADVANCEMENT.copy()

        desc: list[dict] = [{'text':f'\n◆ {self.mana}','color':'aqua'},{'text':f'   ⌚ {round_cooldown(self.cooldown/20)}\n\n','color':'gray'}]
        desc.append({'text':' '.join(self.description)+'\n','color':'gray'})
        if self.stats.damage is not None:
            desc.append({'text':'\nDamage: ','color':'gray','extra':[{'text':f'{round_stat(self.stats.damage/2)} ❤','color':'red'}]})
        if self.stats.range is not None:
            desc.append({'text':'\nRange: ','color':'gray','extra':[{'text':f'{round_stat(self.stats.range)}','color':'red'},{'text':' blocks','color':'dark_gray'}]})
        if self.stats.speed is not None:
            desc.append({'text':'\nSpeed: ','color':'gray','extra':[{'text':f'{round_stat(self.stats.speed*5)}','color':'red'},{'text':' blocks/sec','color':'dark_gray'}]})
        if self.stats.damage_mod is not None:
            desc.append({'text':'\nDamage: ','color':'gray','extra':[{'text':f'{round_stat_mod(self.stats.damage_mod/2)} ❤','color':'red'}]})
        if self.stats.range_mod is not None:
            desc.append({'text':'\nRange: ','color':'gray','extra':[{'text':f'{round_stat_mod(self.stats.range_mod)}','color':'red'},{'text':' blocks','color':'dark_gray'}]})
        if self.stats.speed_mod is not None:
            desc.append({'text':'\nSpeed: ','color':'gray','extra':[{'text':f'{round_stat_mod(self.stats.speed_mod*5)}','color':'red'},{'text':' blocks/sec','color':'dark_gray'}]})
        if self.stats.heal is not None:
            desc.append({'text':'\nHeal: ','color':'gray','extra':[{'text':f'{round_stat(self.stats.heal/2)} ❤','color':'red'}]})
        if self.stats:
            desc.append({'text':'\n'})

        d['display']['icon']['components']['minecraft:custom_model_data']['strings'][0] = f'spellcrafter.spell.{self.name}'
        d['display']['title']['text'] = self.display_name + ' '*(30-len(self.display_name))
        d['display']['title']['color'] = self.tier.color
        d['display']['description'] = desc
        d['parent'] = f'spellcrafter:spells/{self.parent}'
        d['criteria']['requirement']['conditions']['items'][0]['predicates']['minecraft:custom_data'] = f'{{spellcrafter:{{spell:{{id:{self.id}}}}}}}'
        return d

    def __str__(self) -> str:
        return self.name

    def __repr__(self) -> str:
        return f'Spell({self.display_name})'

def round_cooldown(value: float, precision: int = 2) -> int|float:
    return 0 if value == 0 else round(value, precision)

def round_stat(value: float) -> int|float:
    return int(value) if value % 1 == 0 else value

def round_stat_mod(value: float) -> str:
    value = round_stat(value)
    if value < 0:
        return '-' + str(abs(value))
    elif value > 0:
        return '+' + str(value)
    else:
        return '0'

def main() -> None:

    datapack_root = Path('../datapack')
    resources_root = Path('../resources')
    data = read_json('spells.json')

    spells: list[Spell] = []
    for spell in data:
        spells.append(Spell(spell))

    for spell in spells:
        loot_table = spell.get_loot_table()
        advancement = spell.get_advancement()
        save_json(loot_table, datapack_root / f'data/spellcrafter/loot_table/spells/{spell}.json')
        save_json(advancement, datapack_root / f'data/spellcrafter/advancement/spells/{spell}.json')

    for spell_type in SpellType:
        json_path = datapack_root / f'data/spellcrafter/advancement/spells/root_{spell_type}.json'
        advancement = read_json(json_path)
        advancement["criteria"] = {}
        for spell in [s for s in spells if s.type == spell_type]:
            advancement["criteria"][f"spellcrafter:{spell}"] = \
                {"trigger": "minecraft:tick",
                    "conditions": {
                        "player": [
                            {
                                "condition": "minecraft:entity_properties",
                                "entity": "this",
                                "predicate": {
                                    "type_specific": {
                                        "type": "minecraft:player",
                                        "advancements": {
                                            f"spellcrafter:spells/{spell}": True
                                        }
                                    }
                                }
                            }
                        ]
                    }
                }
        save_json(advancement, json_path)
    pass


if __name__ == '__main__':
    main()
