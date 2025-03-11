#> as projectile, on summon, at @s
# instant cast


# Effects
particle minecraft:firework ~ ~ ~ 0 0 0 0.2 50 force @a
particle minecraft:firework ~ ~ ~ 0 0 0 0.2 50 normal @a
particle minecraft:flash ~ ~ ~ 0 0 0 0 0 force @a
playsound minecraft:entity.firework_rocket.blast player @a ~ ~ ~ 3 0.75

# Check target line of sight
execute as @e[distance=..30,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] facing entity @s eyes run function spellcrafter:spells/flash/as_target
