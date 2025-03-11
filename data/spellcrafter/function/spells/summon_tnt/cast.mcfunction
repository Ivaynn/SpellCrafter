#> as projectile, on summon, at @s
# instant cast


# Summon entity
playsound minecraft:entity.tnt.primed player @a ~ ~ ~ 1 1
execute align xyz run summon minecraft:tnt ~.5 ~ ~.5 {fuse:80s,Tags:["spellcrafter.summon"]}
