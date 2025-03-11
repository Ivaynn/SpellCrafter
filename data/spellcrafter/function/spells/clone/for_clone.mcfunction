#> recursive function (limited by score "$spell.clone spellcrafter.tmp")
#> as projectile, on summon, at @s


# Summon copy
execute at @s summon minecraft:marker run function spellcrafter:spells/clone/summon_copy


# Next iteration
scoreboard players remove $spell.clone spellcrafter.tmp 1
execute if score $spell.clone spellcrafter.tmp matches 1.. at @s run function spellcrafter:spells/clone/for_clone
