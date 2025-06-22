#> as projectile, at @s


# Special case: lightning bolt is handled by its own functions
execute as @s[tag=spellcrafter.spell.lightning_bolt] run return 0


# Get stats
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
scoreboard players operation $damage spellcrafter.tmp = @s spellcrafter.damage
scoreboard players operation $blind spellcrafter.tmp = @s spellcrafter.blind

execute unless score $damage spellcrafter.tmp matches 1.. run return 0


# If target is caster, check blind time
# After blind time, hit caster anyway
# Don't add damage if target is already damaged - this fixes a bug where every step would increase the damage to the target
scoreboard players set $tmp.damaged spellcrafter.tmp 0
execute if score @s spellcrafter.blind matches 1.. positioned ~ ~-0.75 ~ as @e[distance=..1.5,type=!#spellcrafter:untargetable,predicate=!spellcrafter:match_id] unless score @s spellcrafter.damage matches 1.. store result score $tmp.damaged spellcrafter.tmp run function spellcrafter:damage/add
execute unless score @s spellcrafter.blind matches 1.. positioned ~ ~-0.75 ~ as @e[distance=..1.5,type=!#spellcrafter:untargetable] unless score @s spellcrafter.damage matches 1.. store result score $tmp.damaged spellcrafter.tmp run function spellcrafter:damage/add


# Special case: bouncy laser re-directs on hit
execute if score $tmp.damaged spellcrafter.tmp matches 1 as @s[tag=spellcrafter.spell.bouncy_laser] run return run function spellcrafter:spells/bouncy_laser/reset
