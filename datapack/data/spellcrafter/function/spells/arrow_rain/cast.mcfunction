#> as projectile, on summon, at @s
# instant cast


# Summon entities
scoreboard players set $spell.arrow_rain spellcrafter.tmp 25
execute align xyz positioned ~0.5 ~20 ~0.5 run function spellcrafter:spells/arrow_rain/for_arrow
function spellcrafter:as_summon/check_limit/init
