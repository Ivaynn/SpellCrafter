#> as projectile, on summon, at @s
#> recursive function (limited by the length of score "$iter spellcrafter.tmp")


# Append spell to tmp array and remove it from the original array
data modify storage spellcrafter:tmp tmp append from storage spellcrafter:tmp wand.spells[-1]
data remove storage spellcrafter:tmp wand.spells[-1]


# Next iteration
scoreboard players remove $iter spellcrafter.tmp 1
execute if score $iter spellcrafter.tmp matches 1.. run function spellcrafter:spells/reverse/for_spell
