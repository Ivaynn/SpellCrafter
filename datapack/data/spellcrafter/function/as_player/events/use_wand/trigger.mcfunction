#> advancement reward
advancement revoke @s only spellcrafter:events/use_wand


# If player is not a caster, stop here
execute as @s[tag=!spellcrafter.caster] run return 0


# If player is on cooldown, stop here
execute if score @s[tag=!spellcrafter.no_cooldown] spellcrafter.cooldown matches 1.. run return 0


# Use wand
function spellcrafter:as_caster/use_wand
