#> as projectile, at @s


execute as @s[tag=!spellcrafter.spell.piercing] run scoreboard players set @s spellcrafter.age 0
execute as @s[tag=spellcrafter.spell.piercing] run function spellcrafter:spells/piercing/damage
