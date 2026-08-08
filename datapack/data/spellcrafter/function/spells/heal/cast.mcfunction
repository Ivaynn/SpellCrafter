#> as projectile, on summon, at @s
# instant cast


# Heal non-undead targets
scoreboard players add @e[distance=..4,type=!#minecraft:undead,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] spellcrafter.heal 4


# Hurt undead targets
scoreboard players set $damage spellcrafter.tmp 4
execute as @e[distance=..4,type=#minecraft:undead,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] run function spellcrafter:damage/add
schedule function spellcrafter:damage/scheduled 1t


# Effects
particle minecraft:heart ^ ^ ^ 0.5 0.5 0.5 0.4 5 force @a[distance=..100]
playsound minecraft:entity.experience_orb.pickup player @a[distance=..100] ~ ~ ~ 1 1.2
