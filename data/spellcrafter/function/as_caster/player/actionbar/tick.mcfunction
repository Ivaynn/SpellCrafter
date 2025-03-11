#> [tick] as player, at @s


# 1 by default
execute unless score @s spellcrafter.actionbar matches 1..10 run scoreboard players set @s spellcrafter.actionbar 1

# 10 >>  (disabled)
execute if score @s spellcrafter.actionbar matches 10 run return 0

# 1 >>  ◆ 100   ⌚ 3.50
execute if score @s spellcrafter.actionbar matches 1 run return run function spellcrafter:as_caster/player/actionbar/t1

# 2 >>  ◆ 100   ⌚ 4
execute if score @s spellcrafter.actionbar matches 2 run return run function spellcrafter:as_caster/player/actionbar/t2

# 3 >>  ◆ 100   ⌚ 70
execute if score @s spellcrafter.actionbar matches 3 run return run function spellcrafter:as_caster/player/actionbar/t3

# 4 >>  ◆ 100/250   ⌚ 3.50
execute if score @s spellcrafter.actionbar matches 4 run return run function spellcrafter:as_caster/player/actionbar/t4

# 5 >>  ◆ 100/250   ⌚ 4
execute if score @s spellcrafter.actionbar matches 5 run return run function spellcrafter:as_caster/player/actionbar/t5

# 6 >>  ◆ 100/250   ⌚ 70
execute if score @s spellcrafter.actionbar matches 6 run return run function spellcrafter:as_caster/player/actionbar/t6

# 7 >>  100 ▌▌▌▌▌▌▌▌▌▌ 3.50
execute if score @s spellcrafter.actionbar matches 7 run return run function spellcrafter:as_caster/player/actionbar/t7

# 8 >>  100 ▌▌▌▌▌▌▌▌▌▌ 4
execute if score @s spellcrafter.actionbar matches 8 run return run function spellcrafter:as_caster/player/actionbar/t8

# 9 >>  100 ▌▌▌▌▌▌▌▌▌▌ 70
execute if score @s spellcrafter.actionbar matches 9 run return run function spellcrafter:as_caster/player/actionbar/t9
