#> as projectile, on summon, at @s

# Blacklisted spells: allowing these would create unbalanced or inconsistent behaviour
# 6: clone
# 50: echo
# 92: skip
# 93: final_echo
# 96: chaotic_echo
execute unless score $echo.spell isc.tmp matches 6 unless score $echo.spell isc.tmp matches 50 unless score $echo.spell isc.tmp matches 92 unless score $echo.spell isc.tmp matches 93 unless score $echo.spell isc.tmp matches 96 run scoreboard players operation $spell isc.tmp = $echo.spell isc.tmp
