#> as summon

scoreboard players set @s[tag=spellcrafter.spell.magic_shield] spellcrafter.age 0
scoreboard players set @s[tag=spellcrafter.spell.magic_barrier] spellcrafter.age 0
scoreboard players set @s[tag=spellcrafter.spell.arcane_shield] spellcrafter.age 0

scoreboard players set @s[tag=spellcrafter.spell.toxic_cloud] spellcrafter.age 0
scoreboard players set @s[tag=spellcrafter.spell.ender_eye] spellcrafter.age 0
scoreboard players set @s[tag=spellcrafter.spell.healing_circle] spellcrafter.age 0

execute as @s[tag=spellcrafter.spell.summon_crystal] at @s run function spellcrafter:spells/summon_crystal/break
execute as @s[tag=spellcrafter.spell.healing_crystal] at @s run function spellcrafter:spells/healing_crystal/break
execute as @s[tag=spellcrafter.spell.chaotic_crystal] at @s run function spellcrafter:spells/chaotic_crystal/break
execute as @s[tag=spellcrafter.spell.anchor_explosion] at @s run function spellcrafter:spells/anchor_explosion/cancel
