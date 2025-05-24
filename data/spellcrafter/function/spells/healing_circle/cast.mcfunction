#> as projectile, on summon, at @s
# instant cast


# Summon entity
execute summon minecraft:item_display run function spellcrafter:spells/healing_circle/as_display
playsound minecraft:block.brewing_stand.brew player @a ~ ~ ~ 1 1.4
