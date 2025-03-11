#> as target (caster)
# projectile hit

scoreboard players set $success spellcrafter.tmp 1

scoreboard players operation $mana_stolen spellcrafter.tmp = @s spellcrafter.mana
scoreboard players operation $mana_stolen spellcrafter.tmp /= #4 spellcrafter.math
scoreboard players operation @s spellcrafter.mana -= $mana_stolen spellcrafter.tmp

execute as @e[limit=1,type=#spellcrafter:caster,tag=spellcrafter.caster,predicate=spellcrafter:match_id,tag=!spellcrafter.spectator] run function spellcrafter:spells/drain_bolt/as_caster
