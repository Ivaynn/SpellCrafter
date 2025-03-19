#> as player

scoreboard players set $spell spellcrafter.tmp 0
execute store result score $spell spellcrafter.tmp run data get storage spellcrafter:tmp inf_save.new.wand.mod
execute if score $spell spellcrafter.tmp matches 1.. run function spellcrafter:as_player/inf_spells/custom_wand/loot_insert
