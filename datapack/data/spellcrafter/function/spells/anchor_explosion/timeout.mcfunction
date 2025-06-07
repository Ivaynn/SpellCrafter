#> as summon, at @s


# Effects
particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 0 force @a[distance=..100]
particle minecraft:flame ~ ~ ~ 1 1 1 0.2 30 normal @a[distance=..100]
playsound minecraft:entity.generic.explode player @a[distance=..100] ~ ~ ~ 2.5 0.8


# Damage nearby entities
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
execute positioned ~ ~-1 ~ as @e[distance=..8,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] run function spellcrafter:spells/anchor_explosion/as_target


# Remove summon
kill @s[type=!minecraft:player]
