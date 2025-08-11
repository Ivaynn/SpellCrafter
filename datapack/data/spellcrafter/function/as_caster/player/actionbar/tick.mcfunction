#> [tick] as player, at @s


# Default
execute unless score @s spellcrafter.actionbar matches 0..6 run scoreboard players set @s spellcrafter.actionbar 1

# 0 >>  (disabled)
execute if score @s spellcrafter.actionbar matches 0 run return 0


# Get data
scoreboard players set $cooldown.this spellcrafter.tmp 0
execute if score shared_cooldowns spellcrafter.options matches 1 run scoreboard players operation $cooldown.this spellcrafter.tmp = @s spellcrafter.cooldown
execute unless score shared_cooldowns spellcrafter.options matches 1 if score $holding_wand spellcrafter.tmp matches 1 run function spellcrafter:as_caster/player/actionbar/get_cooldown
execute if score $cooldown.this spellcrafter.tmp < @s spellcrafter.cooldown run scoreboard players operation $cooldown.this spellcrafter.tmp = @s spellcrafter.cooldown

scoreboard players operation $actionbar.cooldown spellcrafter.tmp = $cooldown.this spellcrafter.tmp
scoreboard players operation $actionbar.mana spellcrafter.tmp = @s spellcrafter.mana
scoreboard players operation $actionbar.mana spellcrafter.tmp /= #10 spellcrafter.math
scoreboard players operation $actionbar.max_mana spellcrafter.tmp = @s spellcrafter.max_mana
scoreboard players operation $actionbar.max_mana spellcrafter.tmp /= #10 spellcrafter.math


# 1 >>  ◆ 100   ⌚ 3.50         (mana value + cooldown decimals)
execute if score @s spellcrafter.actionbar matches 1 run return run function spellcrafter:as_caster/player/actionbar/mv_cd

# 2 >>  ◆ 100   ⌚ 4            (mana value + cooldown seconds)
execute if score @s spellcrafter.actionbar matches 2 run return run function spellcrafter:as_caster/player/actionbar/mv_cs

# 3 >>  ◆ 100/250   ⌚ 3.50     (mana max + cooldown decimals)
execute if score @s spellcrafter.actionbar matches 3 run return run function spellcrafter:as_caster/player/actionbar/mm_cd

# 4 >>  ◆ 100/250   ⌚ 4        (mana max + cooldown seconds)
execute if score @s spellcrafter.actionbar matches 4 run return run function spellcrafter:as_caster/player/actionbar/mm_cs

# 5 >>  100 ▌▌▌▌▌▌▌▌▌▌ 3.50      (mana bar + cooldown decimals)
execute if score @s spellcrafter.actionbar matches 5 run return run function spellcrafter:as_caster/player/actionbar/mb_cd

# 6 >>  100 ▌▌▌▌▌▌▌▌▌▌ 4         (mana bar + cooldown seconds)
execute if score @s spellcrafter.actionbar matches 6 run return run function spellcrafter:as_caster/player/actionbar/mb_cs
