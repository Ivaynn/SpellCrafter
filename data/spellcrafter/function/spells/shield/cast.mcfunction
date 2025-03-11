#> as projectile, on summon, at @s
# instant cast


# Shield targets
effect give @e[distance=..4,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable] minecraft:resistance 3 255 true


# Effects
particle minecraft:enchanted_hit ~ ~ ~ .5 .5 .5 1 25 force @a
playsound minecraft:item.armor.equip_chain player @a ~ ~ ~ 1 0.8
