#> recursive function (limited by score "$spell.multishot spellcrafter.tmp")
#> as projectile, on summon, at @s


# Summon copies
execute at @s summon minecraft:marker run function spellcrafter:spells/multishot/summon_left
execute at @s summon minecraft:marker run function spellcrafter:spells/multishot/summon_right


# Next iteration
scoreboard players remove $spell.multishot spellcrafter.tmp 1
execute if score $spell.multishot spellcrafter.tmp matches 1.. at @s run function spellcrafter:spells/multishot/for_copy
