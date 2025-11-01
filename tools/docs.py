
from utils import *
from spells import Spell, SpellType


def md_spell(spell: Spell) -> list[str]:
    md = [
        f'### ![icon](../resources/assets/spellcrafter/textures/item/spell/{spell.name}.png) {spell.display_name}',
        f'◆ {spell.mana} ⌚ {round_cooldown(spell.cooldown/20)} • {spell.type.name.capitalize()} • {spell.tier.name.capitalize()}',
        '\n*' + ' '.join(spell.description) + '*\n'
    ]

    if spell.stats:
        if spell.stats.damage is not None:
            md.append(f'- **Damage**: {round_stat(spell.stats.damage/2)} ❤')
        if spell.stats.range is not None:
            md.append(f'- **Range**: {round_stat(spell.stats.range)} blocks')
        if spell.stats.speed is not None:
            md.append(f'- **Speed**: {round_stat(spell.stats.speed)} blocks/s')
        if spell.stats.damage_mod is not None:
            md.append(f'- **Damage**: {round_stat_mod(spell.stats.damage_mod/2)} ❤')
        if spell.stats.range_mod is not None:
            md.append(f'- **Range**: {round_stat_mod(spell.stats.range_mod)} blocks')
        if spell.stats.speed_mod is not None:
            md.append(f'- **Speed**: {round_stat_mod(spell.stats.speed_mod)} blocks/s')
        if spell.stats.heal is not None:
            md.append(f'- **Heal**: {round_stat_mod(spell.stats.heal)} ❤')
    return md


def main() -> None:

    data = read_json('spells.json')
    all_spells: list[Spell] = []
    for spell_data in data:
        all_spells.append(Spell(spell_data))
    
    spells_by_type = {
        'projectiles': [s for s in all_spells if s.type == SpellType.PROJECTILE],
        'modifiers': [s for s in all_spells if s.type == SpellType.MODIFIER],
        'instant': [s for s in all_spells if s.type == SpellType.INSTANT],
        'special': [s for s in all_spells if s.type == SpellType.SPECIAL],
    }

    md = [
        '# SpellCrafter Spells',
        'A list of spells, grouped by type:',
        '- [Projectiles](#projectiles)',
        '- [Modifiers](#modifiers)',
        '- [Instant](#instant)',
        '- [Special](#special)',
    ]

    for (spell_type, spells) in spells_by_type.items():
        md.append(f'\n<br>\n\n## {spell_type.capitalize()}\n')

        for spell in spells:
            md.extend(md_spell(spell))
            md.append('---')

    save_text('\n'.join(md), '../docs/README.md')


if __name__ == '__main__':
    main()
