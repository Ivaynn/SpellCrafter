#> as projectile, on summon, at @s
# Mutually exclusive modifiers -> only the first on this list gets applied, others get ignored if they exist

scoreboard players set $spell.has_initial_rot spellcrafter.tmp 0

execute as @s[tag=spellcrafter.spell.casters_aim] at @s run return run function spellcrafter:spells/casters_aim/cast
execute as @s[tag=spellcrafter.spell.aim_assist] at @s run return run function spellcrafter:spells/aim_assist/cast
execute as @s[tag=spellcrafter.spell.casters_pull] at @s run return run function spellcrafter:spells/casters_pull/cast
execute as @s[tag=spellcrafter.spell.aim_up,tag=!spellcrafter.spell.aim_down] at @s run return run function spellcrafter:spells/aim_up/cast
execute as @s[tag=spellcrafter.spell.aim_down,tag=!spellcrafter.spell.aim_up] at @s run return run function spellcrafter:spells/aim_down/cast
execute as @s[tag=spellcrafter.spell.random_dir] at @s run return run function spellcrafter:spells/random_dir/cast

scoreboard players set $spell.has_initial_rot spellcrafter.tmp 1
