#> as projectile, on summon, at @s
# instant cast


# Shield targets
effect give @e[distance=..4,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable] minecraft:resistance 1 255 false


# Effects
particle minecraft:enchanted_hit ~ ~ ~ .5 .5 .5 1 25 force @a[distance=..100]
playsound minecraft:item.armor.equip_chain player @a[distance=..100] ~ ~ ~ 1 0.8
