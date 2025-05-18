#> as projectile, on summon, at @s
#> recursive function (limited by score "$spell.arrow_rain spellcrafter.tmp")


execute summon minecraft:arrow run function spellcrafter:spells/arrow_rain/as_arrow
scoreboard players remove $spell.arrow_rain spellcrafter.tmp 1
execute if score $spell.arrow_rain spellcrafter.tmp matches 1.. run function spellcrafter:spells/arrow_rain/for_arrow
