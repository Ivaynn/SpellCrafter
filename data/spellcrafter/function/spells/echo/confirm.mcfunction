#> as projectile, on summon, at @s

# Blacklisted spells: allowing these would create unbalanced or inconsistent behaviour
# 6: clone
# 50: echo
# 92: skip
# 93: final_echo
# 96: chaotic_echo
execute unless score $echo.spell spellcrafter.tmp matches 6 unless score $echo.spell spellcrafter.tmp matches 50 unless score $echo.spell spellcrafter.tmp matches 92 unless score $echo.spell spellcrafter.tmp matches 93 unless score $echo.spell spellcrafter.tmp matches 96 run scoreboard players operation $spell spellcrafter.tmp = $echo.spell spellcrafter.tmp
