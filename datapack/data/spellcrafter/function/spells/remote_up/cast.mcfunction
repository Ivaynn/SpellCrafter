#> as projectile, on summon, at the summon position (not at @s)
#> recursive function (limited by score "$spell.remote_up spellcrafter.tmp")

execute at @s positioned ~ ~1 ~ if block ~.5 ~ ~ #spellcrafter:anti_magic run return run function spellcrafter:as_projectile/hit_anti_magic
execute at @s positioned ~ ~1 ~ if block ~-.5 ~ ~ #spellcrafter:anti_magic run return run function spellcrafter:as_projectile/hit_anti_magic
execute at @s positioned ~ ~1 ~ if block ~ ~.5 ~ #spellcrafter:anti_magic run return run function spellcrafter:as_projectile/hit_anti_magic
execute at @s positioned ~ ~1 ~ if block ~ ~-.5 ~ #spellcrafter:anti_magic run return run function spellcrafter:as_projectile/hit_anti_magic
execute at @s positioned ~ ~1 ~ if block ~ ~ ~.5 #spellcrafter:anti_magic run return run function spellcrafter:as_projectile/hit_anti_magic
execute at @s positioned ~ ~1 ~ if block ~ ~ ~-.5 #spellcrafter:anti_magic run return run function spellcrafter:as_projectile/hit_anti_magic

execute at @s run tp @s ~ ~1 ~

scoreboard players remove $spell.remote_up spellcrafter.tmp 1
execute if score $spell.remote_up spellcrafter.tmp matches 1.. run function spellcrafter:spells/remote_up/cast
