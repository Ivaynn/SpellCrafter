#> as projectile, on summon, at @s
# instant cast


# Summon entity
execute align xyz run summon minecraft:tnt ~.5 ~ ~.5 {fuse:80s,Tags:["isc.summon"]}


# Success check
return 1
