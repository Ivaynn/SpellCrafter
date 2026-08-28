#> as projectile, at @s

particle minecraft:dust_color_transition{from_color:[0.9,0.4,0.4],scale:2.5,to_color:[1.0,0.7,0.7]} ~ ~ ~ .1 .1 .1 0 1 force @a[distance=..100]


# Heal non-undead targets
execute positioned ~ ~-0.75 ~ as @e[distance=..2,type=!#minecraft:undead,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] unless score @s spellcrafter.heal matches 1.. run scoreboard players add @s spellcrafter.heal 4


# Hurt undead targets
scoreboard players set $damage spellcrafter.tmp 4
execute positioned ~ ~-0.75 ~ as @e[distance=..2,type=#minecraft:undead,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] unless score @s spellcrafter.damage matches 1.. run function spellcrafter:damage/from_projectile
