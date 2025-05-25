#> as projectile, on summon, at @s
#> recursive function (limited by score "$spell.resonant_pulse spellcrafter.tmp")

tag @s add spellcrafter.spell.resonant_pulse

scoreboard players add @s spellcrafter.speed 4
scoreboard players add @s spellcrafter.range 10
scoreboard players add @s spellcrafter.damage 3

scoreboard players remove $spell.resonant_pulse spellcrafter.tmp 1
execute if score $spell.resonant_pulse spellcrafter.tmp matches 1.. run function spellcrafter:spells/resonant_pulse/projectile
