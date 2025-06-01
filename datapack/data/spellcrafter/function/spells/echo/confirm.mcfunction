#> as projectile, on summon, at @s

# Blacklisted spells: allowing these would create unbalanced or inconsistent behaviour

# clone
execute if score $echo.spell spellcrafter.tmp matches 6 run return 0

# echo
execute if score $echo.spell spellcrafter.tmp matches 50 run return 0

# skip
execute if score $echo.spell spellcrafter.tmp matches 92 run return 0

# final_echo
execute if score $echo.spell spellcrafter.tmp matches 93 run return 0 

# chaotic_echo
execute if score $echo.spell spellcrafter.tmp matches 96 run return 0

# Confirm
scoreboard players operation $spell spellcrafter.tmp = $echo.spell spellcrafter.tmp
