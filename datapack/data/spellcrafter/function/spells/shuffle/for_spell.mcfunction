#> as projectile, on summon, at @s
#> recursive function (limited by the length of score "$iter spellcrafter.tmp")


# Get a random number between 1 and "$iter spellcrafter.tmp" (max 27 slots)
execute store result score $random spellcrafter.tmp run random value 1..100000
scoreboard players operation $random spellcrafter.tmp %= $iter spellcrafter.tmp
execute unless score $random spellcrafter.tmp matches 0..26 run scoreboard players set $random spellcrafter.tmp 0


# Append spell to tmp array and remove it from the original array
function spellcrafter:spells/shuffle/append


# Next iteration
scoreboard players remove $iter spellcrafter.tmp 1
execute if score $iter spellcrafter.tmp matches 1.. run function spellcrafter:spells/shuffle/for_spell
