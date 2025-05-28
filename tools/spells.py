
import json
from enum import Enum
from pathlib import Path
from dataclasses import dataclass
from copy import deepcopy

ADVANCEMENT = {
    "display": {
        "icon": {
            "id": "minecraft:enchanted_book",
            "components": {
                "minecraft:enchantment_glint_override": False,
                "minecraft:custom_model_data": {
                    "strings": [
                        "..."
                    ]
                }
            }
        },
        "title": [
            "..."
        ],
        "description": [
            "..."
        ],
        "frame": "goal",
        "show_toast": False,
        "announce_to_chat": False,
        "hidden": True
    },
    "parent": "...",
    "criteria": {
        "requirement": {
            "trigger": "minecraft:inventory_changed",
            "conditions": {
                "player": [
                    {
                        "condition": "minecraft:inverted",
                        "term": {
                            "condition": "minecraft:entity_scores",
                            "entity": "this",
                            "scores": {
                                "spellcrafter.inf_page": {
                                    "min": 1
                                }
                            }
                        }
                    }
                ],
                "items": [
                    {
                        "items": "minecraft:enchanted_book",
                        "predicates": {
                            "minecraft:custom_data": "..."
                        }
                    }
                ]
            }
        }
    }
}

LOOT_TABLE = {
    "pools": [
        {
            "rolls": 1,
            "entries": [
                {
                    "type": "minecraft:item",
                    "name": "minecraft:enchanted_book"
                }
            ]
        }
    ],
    "functions": [
        {
            "function": "minecraft:set_components",
            "components": {
                "minecraft:max_stack_size": 1,
                "minecraft:rarity": "epic",
                "minecraft:enchantment_glint_override": False
            }
        },
        {
            "function": "minecraft:set_custom_data",
            "tag": "..."
        },
        {
            "function": "minecraft:set_name",
            "entity": "this",
            "target": "item_name",
            "name": "..."
        },
        {
            "function": "minecraft:set_lore",
            "entity": "this",
            "mode": "replace_all",
            "lore": [
                "..."
            ]
        },
        {
            "function": "minecraft:set_custom_model_data",
            "strings": {
                "values": [
                    "..."
                ],
                "mode": "replace_all"
            }
        }
    ]
}

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
        d = deepcopy(LOOT_TABLE)

        lore: list[dict] = [{'text':f'◆ {self.mana}','color':'aqua','italic':False,'extra':[{'text':f'   ⌚ {round_cooldown(self.cooldown/20)}','color':'gray','italic':False}]}]
        lore.append({'text':''})
        lore.extend([{'translate':f'spellcrafter.spell.{self}.description.{i+1}','fallback':line,'color':'gray','italic':False} for i, line in enumerate(self.description)])
        if self.stats:
            lore.append({'text':''})
        if self.stats.damage is not None:
            lore.append({'translate':'spellcrafter.stat.damage.name','fallback':'Damage','color':'gray','italic':False,'extra':[{'text':': '},{'text':f'{round_stat(self.stats.damage/2)} ❤','color':'red'}]})
        if self.stats.range is not None:
            lore.append({'translate':'spellcrafter.stat.range.name','fallback':'Range','color':'gray','italic':False,'extra':[{'text':': '},{'text':f'{round_stat(self.stats.range)}','color':'red'},{'text':' '},{'translate':'spellcrafter.stat.range.unit','fallback':'blocks','color':'dark_gray'}]})
        if self.stats.speed is not None:
            lore.append({'translate':'spellcrafter.stat.speed.name','fallback':'Speed','color':'gray','italic':False,'extra':[{'text':': '},{'text':f'{round_stat(self.stats.speed*5)}','color':'red'},{'text':' '},{'translate':'spellcrafter.stat.speed.unit','fallback':'blocks/s','color':'dark_gray'}]})
        if self.stats.damage_mod is not None:
            lore.append({'translate':'spellcrafter.stat.damage.name','fallback':'Damage','color':'gray','italic':False,'extra':[{'text':': '},{'text':f'{round_stat_mod(self.stats.damage_mod/2)} ❤','color':'red'}]})
        if self.stats.range_mod is not None:
            lore.append({'translate':'spellcrafter.stat.range.name','fallback':'Range','color':'gray','italic':False,'extra':[{'text':': '},{'text':f'{round_stat_mod(self.stats.range_mod)}','color':'red'},{'text':' '},{'translate':'spellcrafter.stat.range.unit','fallback':'blocks','color':'dark_gray'}]})
        if self.stats.speed_mod is not None:
            lore.append({'translate':'spellcrafter.stat.speed.name','fallback':'Speed','color':'gray','italic':False,'extra':[{'text':': '},{'text':f'{round_stat_mod(self.stats.speed_mod*5)}','color':'red'},{'text':' '},{'translate':'spellcrafter.stat.speed.unit','fallback':'blocks/s','color':'dark_gray'}]})
        if self.stats.heal is not None:
            lore.append({'translate':'spellcrafter.stat.heal.name','fallback':'Heal','color':'gray','italic':False,'extra':[{'text':': '},{'text':f'{round_stat(self.stats.heal/2)} ❤','color':'red'}]})
        lore.extend([{'text':''},{'text':f'{self.type.icon} ','color':f'{self.type.color}','italic':False,'extra':[{'translate':f'spellcrafter.type.{self.type}','fallback':str(self.type).capitalize()}]}])

        d['functions'][1]['tag'] = f'{{spellcrafter:{{spell:{{valid:1b,id:{self.id},mana:{self.mana},cooldown:{self.cooldown},tier:{self.tier.value},lore:{{"text":"{self.type.icon} ","color":"{self.type.color}","italic":false,"extra":[{{"translate":"spellcrafter.spell.{self}.name","fallback":"{self.display_name.replace('\'','\\\'')}"}}]}}}}}}}}'
        d['functions'][2]['name'] = {'translate': f'spellcrafter.spell.{self}.name', 'fallback': self.display_name, 'color': self.tier.color}
        d['functions'][3]['lore'] = lore
        d['functions'][4]['strings']['values'][0] = f'spellcrafter.spell.{self.name}'
        return d

    def get_advancement(self) -> dict:
        d = deepcopy(ADVANCEMENT)

        desc: list[dict] = [{'text':f'\n◆ {self.mana}','color':'aqua'},{'text':f'   ⌚ {round_cooldown(self.cooldown/20)}\n\n','color':'gray'}]
        for i, line in enumerate(self.description):
            desc.extend([{'translate':f'spellcrafter.spell.{self}.description.{i+1}','fallback':line,'color':'gray','italic':False},{'text':' '}])
        desc.append({'text':'\n'})
        if self.stats.damage is not None:
            desc.append({'text':'\n','color':'gray','extra':[{'translate':'spellcrafter.stat.damage.name','fallback':'Damage'},{'text':': '},{'text':f'{round_stat(self.stats.damage/2)} ❤','color':'red'}]})
        if self.stats.range is not None:
            desc.append({'text':'\n','color':'gray','extra':[{'translate':'spellcrafter.stat.range.name','fallback':'Range'},{'text':': '},{'text':f'{round_stat(self.stats.range)}','color':'red'},{'text':' '},{'translate':'spellcrafter.stat.range.unit','fallback':'m','color':'dark_gray'}]})
        if self.stats.speed is not None:
            desc.append({'text':'\n','color':'gray','extra':[{'translate':'spellcrafter.stat.speed.name','fallback':'Speed'},{'text':': '},{'text':f'{round_stat(self.stats.speed*5)}','color':'red'},{'text':' '},{'translate':'spellcrafter.stat.speed.unit','fallback':'m/s','color':'dark_gray'}]})
        if self.stats.damage_mod is not None:
            desc.append({'text':'\n','color':'gray','extra':[{'translate':'spellcrafter.stat.damage.name','fallback':'Damage'},{'text':': '},{'text':f'{round_stat_mod(self.stats.damage_mod/2)} ❤','color':'red'}]})
        if self.stats.range_mod is not None:
            desc.append({'text':'\n','color':'gray','extra':[{'translate':'spellcrafter.stat.range.name','fallback':'Range'},{'text':': '},{'text':f'{round_stat_mod(self.stats.range_mod)}','color':'red'},{'text':' '},{'translate':'spellcrafter.stat.range.unit','fallback':'m','color':'dark_gray'}]})
        if self.stats.speed_mod is not None:
            desc.append({'text':'\n','color':'gray','extra':[{'translate':'spellcrafter.stat.speed.name','fallback':'Speed'},{'text':': '},{'text':f'{round_stat_mod(self.stats.speed_mod*5)}','color':'red'},{'text':' '},{'translate':'spellcrafter.stat.speed.unit','fallback':'m/s','color':'dark_gray'}]})
        if self.stats.heal is not None:
            desc.append({'text':'\n','color':'gray','extra':[{'translate':'spellcrafter.stat.heal.name','fallback':'Heal'},{'text':': '},{'text':f'{round_stat(self.stats.heal/2)} ❤','color':'red'}]})
        if self.stats:
            desc.append({'text':'\n'})

        d['display']['icon']['components']['minecraft:custom_model_data']['strings'][0] = f'spellcrafter.spell.{self.name}'
        d['display']['title'] = [{'translate':f'spellcrafter.spell.{self}.name','fallback':self.display_name,'color': self.tier.color},{'text':' '*(30-len(self.display_name))}]
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

    # Initialize: create objects for every spell in 'spells.json'
    datapack_root = Path('../datapack')
    resources_root = Path('../resources')
    data = read_json('spells.json')

    spells: list[Spell] = []
    for spell in data:
        spells.append(Spell(spell))



    # ------------------------------------------------------------
    # Advancements and loot tables for every spell
    # ------------------------------------------------------------
    for spell in spells:
        loot_table = spell.get_loot_table()
        advancement = spell.get_advancement()
        save_json(loot_table, datapack_root / f'data/spellcrafter/loot_table/spells/{spell}.json')
        save_json(advancement, datapack_root / f'data/spellcrafter/advancement/spells/{spell}.json')



    # ------------------------------------------------------------
    # Advancement roots used for tracking of unlocked spells
    # ------------------------------------------------------------
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



    # ------------------------------------------------------------
    # Wand modifiers: mcfunction and item modifier json
    # ------------------------------------------------------------
    wand_mods = []
    function_text = ''
    for spell in spells:
        function_text += f'execute if score $wand_mod spellcrafter.tmp matches {spell.id} run return {int(spell.wand_mod)}\n'
        if not spell.wand_mod:
            continue
        if spell.type == SpellType.PROJECTILE and spell.wand_mod:
            raise ValueError('A projectile cannot be a wand modifier.')
        wand_mods.append(
            {
                "function": "minecraft:set_lore",
                "entity": "this",
                "mode": "replace_section",
                "offset": 2,
                "size": 1,
                "lore": [
                    {
                        "text": f'{spell.type.icon} ',
                        "color": 'gray',
                        "italic": False,
                        "extra": [
                            {
                                "translate": f'spellcrafter.spell.{spell}.name',
                                "fallback": f'{spell.display_name}'
                            }
                        ]
                    }
                ],
                "conditions": [
                    {
                        "condition": "minecraft:value_check",
                        "value": {
                            "type": "minecraft:storage",
                            "storage": "spellcrafter:tmp",
                            "path": "wand.mod"
                        },
                        "range": spell.id
                    }
                ]
            }
        )
    save_json(wand_mods, datapack_root / f'data/spellcrafter/item_modifier/wand/lore/wand_mod_replace.json')
    save_mcfunction(function_text, datapack_root / f'data/spellcrafter/function/as_projectile/wand_mods.mcfunction')



    # ------------------------------------------------------------
    # Random spell generator: conditional loot table
    # ------------------------------------------------------------
    WEIGHTS =  [[ 10, 6, 3, 2, 2 ],
                [  7, 9, 6, 3, 3 ],
                [  3, 4, 8, 6, 4 ],
                [  0, 1, 3, 7, 5 ],
                [  0, 0, 0, 2, 6 ]]
    POOL = {
        "rolls": 1,
        "entries": [],
        "conditions": [
            {
                "condition": "minecraft:value_check",
                "value": {
                    "type": "minecraft:score",
                    "target": {
                        "type": "minecraft:fixed",
                        "name": "$gen.tier"
                    },
                    "score": "spellcrafter.tmp"
                },
                "range": 1
            },
            {
                "condition": "minecraft:value_check",
                "value": {
                    "type": "minecraft:score",
                    "target": {
                        "type": "minecraft:fixed",
                        "name": "$gen.type"
                    },
                    "score": "spellcrafter.tmp"
                },
                "range": 1
            }
        ]
    }

    random_spell = {'pools': []}

    # Go through all possible combinations of $gen.tier and $gen.type
    for gen_tier in SpellTier:
        for gen_type in SpellType:

            # Create a pool for this combination
            pool = deepcopy(POOL)
            pool['conditions'][0]['range'] = gen_tier.value
            pool['conditions'][1]['range'] = gen_type.value

            # Create entries for spells with this $gen.type
            for spell in [s for s in spells if s.type == gen_type]:

                # Get weight for this combination
                weight = WEIGHTS[spell.tier.value-1][gen_tier.value-1]
                if not weight > 0:
                    continue

                # Add to existing entry if this weight is already in use
                new_weight = True
                for entry in pool['entries']:
                    if weight == entry['weight']:
                        entry['value']['pools'][0]['entries'].append(
                            {
                                'type': 'minecraft:loot_table',
                                'value': f'spellcrafter:spells/{spell}'
                            }
                        )
                        new_weight = False

                # Create new entry if this weight is new
                if new_weight:
                    pool['entries'].append(
                        {
                            "type": "minecraft:loot_table",
                            "value": {
                                "pools": [
                                    {
                                        "rolls": 1,
                                        "entries": [
                                            {
                                                'type': 'minecraft:loot_table',
                                                'value': f'spellcrafter:spells/{spell}'
                                            }
                                        ]
                                    }
                                ]
                            },
                            "weight": weight
                        })

            # Save the created pool (unless it has no entries)
            if pool['entries']:
                random_spell['pools'].append(pool)

    save_json(random_spell, datapack_root / f'data/spellcrafter/loot_table/random_spell.json')



    # ------------------------------------------------------------
    # "Table" mcfunctions
    # ------------------------------------------------------------
    mcfunction = ''
    for spell in spells:
        mcfunction += f'execute if score $spell spellcrafter.tmp matches {spell.id} run return run loot replace entity @s inventory.22 loot spellcrafter:spells/{spell}\n'
    save_mcfunction(mcfunction, datapack_root / 'data/spellcrafter/function/as_player/inf_spells/custom_wand/loot_insert.mcfunction')

    mcfunction = ''
    for spell in spells:
        mcfunction += f'execute if score $spell spellcrafter.tmp matches {spell.id} run return run loot insert ~ ~ ~ loot spellcrafter:spells/{spell}\n'
    save_mcfunction(mcfunction, datapack_root / 'data/spellcrafter/function/as_table/open/loot_insert.mcfunction')



    # ------------------------------------------------------------
    # Resource pack - override for minecraft:enchanted_book
    # ------------------------------------------------------------
    enchanted_book = {
        'model': {
            "type": "minecraft:select",
            "property": "minecraft:custom_model_data",
            "fallback": {
                "type": "minecraft:model",
                "model": "minecraft:item/enchanted_book"
            },
            "cases": []
        }
    }
    for spell in spells:
        enchanted_book['model']['cases'].append(
            {
                "when": f"spellcrafter.spell.{spell}",
                "model": {
                    "type": "minecraft:model",
                    "model": f"spellcrafter:item/spell/{spell}"
                }
            }
        )
    save_json(enchanted_book, resources_root / 'assets/minecraft/items/enchanted_book.json')



    # ------------------------------------------------------------
    # Resource pack - create model json for every spell
    # ------------------------------------------------------------
    for spell in spells:
        model = {
            "parent": "minecraft:item/generated",
            "textures": {
                "layer0": f"spellcrafter:item/spell/{spell}"
            }
        }
        save_json(model, resources_root / f'assets/spellcrafter/models/item/spell/{spell}.json')



    # ------------------------------------------------------------
    # Resource pack - lang file - replace entries for spell names and descriptions
    # ------------------------------------------------------------
    lang: dict[str,str] = read_json(resources_root / 'assets/spellcrafter/lang/en_us.json')
    lang = {k: v for k, v in lang.items() if not k.startswith('spellcrafter.spell.')}

    for spell in spells:
        lang[f'spellcrafter.spell.{spell}.name'] = spell.display_name
        for i, line in enumerate(spell.description):
            lang[f'spellcrafter.spell.{spell}.description.{i+1}'] = line

    save_json(lang, resources_root / 'assets/spellcrafter/lang/en_us.json', indent=4)



    # ------------------------------------------------------------
    # Done!
    # ------------------------------------------------------------
    print('Success!')
    print('- Projectile stats must be updated manually in their \'projectile.mcfunction\'')
    print('- PNG files for new spells must be created manually')
    print('- New spells must be added to multiple files manually. Check similar spells')


if __name__ == '__main__':
    main()
