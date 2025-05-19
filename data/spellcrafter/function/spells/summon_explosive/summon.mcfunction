#> as projectile, on summon, at @s
# instant cast


tellraw @a {score:{name:"$spell.summon_explosive",objective:"spellcrafter.tmp"}}


execute summon minecraft:item_display run function spellcrafter:spells/summon_explosive/as_display
playsound minecraft:entity.tnt.primed player @a ~ ~ ~ 1 1.0
