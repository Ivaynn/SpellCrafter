#> [tick] as player, at @s


# Use the cached value if available (fast)
execute if score @s spellcrafter.cache.cooldown matches 0.. run return run scoreboard players operation $cooldown.this spellcrafter.tmp = @s spellcrafter.cache.cooldown


# Get the real value (slow) and save it on cache for next tick
function spellcrafter:as_caster/player/get_cooldown
scoreboard players operation @s spellcrafter.cache.cooldown = $cooldown.this spellcrafter.tmp
