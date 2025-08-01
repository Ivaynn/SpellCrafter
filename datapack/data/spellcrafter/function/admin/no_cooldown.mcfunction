
execute as @s[tag=!spellcrafter.no_cooldown] run return run tag @s add spellcrafter.no_cooldown

tag @s remove spellcrafter.no_cooldown
return 0
