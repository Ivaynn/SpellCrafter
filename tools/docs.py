
from utils import *
from spells import Spell, SpellType


def md_spell(spell: Spell) -> list[str]:
    md = [
        f'### {spell.display_name}',
        f'<img src="../resources/assets/spellcrafter/textures/item/spell/{spell.name}.png" align="right" width="50"/>'
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

    md = [
        '# SpellCrafter Spells',
        'A list of spells, grouped by type',
        '- [Projectile](#projectile)',
        '- [Modifier](#modifier)',
        '- [Instant](#instant)',
        '- [Special](#special)',
    ]

    md.append('\n<br>\n\n## Projectile\n\nSpells that shoot a projectile. They usually travel in a straight line and deal damage when they hit something, but this can be modified by other spells. The spell list continues where the projectile ends.\n')
    for spell in [s for s in all_spells if s.type == SpellType.PROJECTILE]:
        md.append('---')
        md.extend(md_spell(spell))
    md.append('---')

    md.append('\n<br>\n\n## Modifier\n\nSpells that modify a projectile. These can be stacked and completely change how the projectile behaves. They can change its damage, range, speed, trajectory, appearance, ...\n')
    for spell in [s for s in all_spells if s.type == SpellType.MODIFIER]:
        md.append('---')
        md.extend(md_spell(spell))
    md.append('---')

    md.append('\n<br>\n\n## Instant\n\nSpells that get cast instantly and cannot be modified. These can summon entities, protect you, create explosions, teleport entities, create shields, affect nearby projectiles, ...\n')
    for spell in [s for s in all_spells if s.type == SpellType.INSTANT]:
        md.append('---')
        md.extend(md_spell(spell))
    md.append('---')

    md.append('\n<br>\n\n## Special\n\nSpells that affect the wand in unique ways and don\'t fit any of the other categories. These can modify the wand properties, change spell order, copy other spells, ...\n')
    for spell in [s for s in all_spells if s.type == SpellType.SPECIAL]:
        md.append('---')
        md.extend(md_spell(spell))
    md.append('---')

    save_text('\n'.join(md), '../docs/README.md')


if __name__ == '__main__':
    main()
