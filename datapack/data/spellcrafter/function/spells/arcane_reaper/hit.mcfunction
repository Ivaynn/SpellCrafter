#> as projectile, at @s
# projectile hit


# Damage target
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
scoreboard players operation $damage spellcrafter.tmp = @s spellcrafter.damage
scoreboard players operation $blind spellcrafter.tmp = @s spellcrafter.blind

execute if score $damage spellcrafter.tmp matches 1.. as @e[distance=..10,type=!#spellcrafter:untargetable] if function spellcrafter:util/hitbox run function spellcrafter:damage/from_projectile

# No hit effects
