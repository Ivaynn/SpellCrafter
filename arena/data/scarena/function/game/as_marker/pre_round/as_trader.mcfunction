#> execute summon (trader)

data modify entity @s Offers set from storage scarena:tmp trades
data merge entity @s {Invulnerable:1b,Silent:1b}
