#> recursive function (limited by score "$iter spellcrafter.tmp")
#> as item_display
# storage "spellcrafter:tmp gen.spells" contains a list of spell ids
# storage "spellcrafter:tmp wand.spells" must start empty


# Projectile or modifier (1, 2)
scoreboard players set $gen.type spellcrafter.tmp 2

execute store result score $gen.random spellcrafter.tmp run random value 1..15
scoreboard players add $gen.last_proj spellcrafter.tmp 1
execute if score $iter spellcrafter.tmp matches 1 run scoreboard players add $gen.last_proj spellcrafter.tmp 4

execute unless score $gen.last_proj spellcrafter.tmp matches 1..5 run scoreboard players set $gen.type spellcrafter.tmp 1

execute if score $gen.last_proj spellcrafter.tmp matches 1 if score $gen.random spellcrafter.tmp matches ..1 run scoreboard players set $gen.type spellcrafter.tmp 1
execute if score $gen.last_proj spellcrafter.tmp matches 2 if score $gen.random spellcrafter.tmp matches ..2 run scoreboard players set $gen.type spellcrafter.tmp 1
execute if score $gen.last_proj spellcrafter.tmp matches 3 if score $gen.random spellcrafter.tmp matches ..3 run scoreboard players set $gen.type spellcrafter.tmp 1
execute if score $gen.last_proj spellcrafter.tmp matches 4 if score $gen.random spellcrafter.tmp matches ..4 run scoreboard players set $gen.type spellcrafter.tmp 1
execute if score $gen.last_proj spellcrafter.tmp matches 5 if score $gen.random spellcrafter.tmp matches ..5 run scoreboard players set $gen.type spellcrafter.tmp 1


# Instant or special (3, 4) - only replace modifiers
execute if score $gen.type spellcrafter.tmp matches 2 store result score $gen.random spellcrafter.tmp run random value 1..20
execute if score $gen.type spellcrafter.tmp matches 2 if score $gen.random spellcrafter.tmp matches 20 run scoreboard players set $gen.type spellcrafter.tmp 4
execute if score $gen.type spellcrafter.tmp matches 2 if score $gen.random spellcrafter.tmp matches 15..19 run scoreboard players set $gen.type spellcrafter.tmp 3


# Update "last_proj" counter
execute if score $gen.type spellcrafter.tmp matches 1 run scoreboard players set $gen.last_proj spellcrafter.tmp 0


# Insert item
execute if score $gen.tier spellcrafter.tmp matches 1 if score $gen.type spellcrafter.tmp matches 1 run loot replace entity @s contents loot spellcrafter:gen/tier_1/projectile
execute if score $gen.tier spellcrafter.tmp matches 1 if score $gen.type spellcrafter.tmp matches 2 run loot replace entity @s contents loot spellcrafter:gen/tier_1/modifier
execute if score $gen.tier spellcrafter.tmp matches 1 if score $gen.type spellcrafter.tmp matches 3 run loot replace entity @s contents loot spellcrafter:gen/tier_1/instant
execute if score $gen.tier spellcrafter.tmp matches 1 if score $gen.type spellcrafter.tmp matches 4 run loot replace entity @s contents loot spellcrafter:gen/tier_1/special

execute if score $gen.tier spellcrafter.tmp matches 2 if score $gen.type spellcrafter.tmp matches 1 run loot replace entity @s contents loot spellcrafter:gen/tier_2/projectile
execute if score $gen.tier spellcrafter.tmp matches 2 if score $gen.type spellcrafter.tmp matches 2 run loot replace entity @s contents loot spellcrafter:gen/tier_2/modifier
execute if score $gen.tier spellcrafter.tmp matches 2 if score $gen.type spellcrafter.tmp matches 3 run loot replace entity @s contents loot spellcrafter:gen/tier_2/instant
execute if score $gen.tier spellcrafter.tmp matches 2 if score $gen.type spellcrafter.tmp matches 4 run loot replace entity @s contents loot spellcrafter:gen/tier_2/special

execute if score $gen.tier spellcrafter.tmp matches 3 if score $gen.type spellcrafter.tmp matches 1 run loot replace entity @s contents loot spellcrafter:gen/tier_3/projectile
execute if score $gen.tier spellcrafter.tmp matches 3 if score $gen.type spellcrafter.tmp matches 2 run loot replace entity @s contents loot spellcrafter:gen/tier_3/modifier
execute if score $gen.tier spellcrafter.tmp matches 3 if score $gen.type spellcrafter.tmp matches 3 run loot replace entity @s contents loot spellcrafter:gen/tier_3/instant
execute if score $gen.tier spellcrafter.tmp matches 3 if score $gen.type spellcrafter.tmp matches 4 run loot replace entity @s contents loot spellcrafter:gen/tier_3/special

execute if score $gen.tier spellcrafter.tmp matches 4 if score $gen.type spellcrafter.tmp matches 1 run loot replace entity @s contents loot spellcrafter:gen/tier_4/projectile
execute if score $gen.tier spellcrafter.tmp matches 4 if score $gen.type spellcrafter.tmp matches 2 run loot replace entity @s contents loot spellcrafter:gen/tier_4/modifier
execute if score $gen.tier spellcrafter.tmp matches 4 if score $gen.type spellcrafter.tmp matches 3 run loot replace entity @s contents loot spellcrafter:gen/tier_4/instant
execute if score $gen.tier spellcrafter.tmp matches 4 if score $gen.type spellcrafter.tmp matches 4 run loot replace entity @s contents loot spellcrafter:gen/tier_4/special

execute if score $gen.tier spellcrafter.tmp matches 5 if score $gen.type spellcrafter.tmp matches 1 run loot replace entity @s contents loot spellcrafter:gen/tier_5/projectile
execute if score $gen.tier spellcrafter.tmp matches 5 if score $gen.type spellcrafter.tmp matches 2 run loot replace entity @s contents loot spellcrafter:gen/tier_5/modifier
execute if score $gen.tier spellcrafter.tmp matches 5 if score $gen.type spellcrafter.tmp matches 3 run loot replace entity @s contents loot spellcrafter:gen/tier_5/instant
execute if score $gen.tier spellcrafter.tmp matches 5 if score $gen.type spellcrafter.tmp matches 4 run loot replace entity @s contents loot spellcrafter:gen/tier_5/special


# Get spell data
data remove storage spellcrafter:tmp spell
data modify storage spellcrafter:tmp spell set from entity @s item.components."minecraft:custom_data".spellcrafter.spell


# Get spell id & lore
data modify storage spellcrafter:tmp wand.spells append from storage spellcrafter:tmp spell.id
data modify storage spellcrafter:tmp lore append from storage spellcrafter:tmp spell.lore
scoreboard players set $spell spellcrafter.tmp 0
execute store result score $spell spellcrafter.tmp run data get storage spellcrafter:tmp spell.id


# Special cases
execute if score $spell spellcrafter.tmp matches 64 run scoreboard players add $spell.sharp spellcrafter.tmp 1
execute if score $spell spellcrafter.tmp matches 69 run scoreboard players set $spell.secret spellcrafter.tmp 1
execute if score $spell spellcrafter.tmp matches 70 run scoreboard players set $spell.locked spellcrafter.tmp 1
execute if score $spell spellcrafter.tmp matches 83 run scoreboard players add $spell.extended spellcrafter.tmp 1
execute if score $spell spellcrafter.tmp matches 84 run scoreboard players add $spell.quickstep spellcrafter.tmp 1


# Spell cooldown
scoreboard players set $add spellcrafter.tmp 0
execute store result score $add spellcrafter.tmp run data get storage spellcrafter:tmp spell.cooldown
scoreboard players operation $cooldown spellcrafter.tmp += $add spellcrafter.tmp


# Special case: "skip" ignores the mana cost of the next spell
execute if score $spell.skip spellcrafter.tmp matches 1 run return run scoreboard players set $spell.skip spellcrafter.tmp 0
execute if score $spell spellcrafter.tmp matches 92 run scoreboard players set $spell.skip spellcrafter.tmp 1


# Mana: prevent overflow - if clone multiplier is too high, just set mana cost to the integer limit
execute if score $clone_multiplier spellcrafter.tmp matches 1024.. run return run scoreboard players set $mana spellcrafter.tmp 2147483647

# Mana: get spell cost (can be positive or negative)
scoreboard players set $add spellcrafter.tmp 0
execute store result score $add spellcrafter.tmp run data get storage spellcrafter:tmp spell.mana
execute if score $add spellcrafter.tmp matches ..-1 run scoreboard players set $is_negative spellcrafter.tmp 1

# Mana: apply clone multiplier (exponential)
execute if score $spell spellcrafter.tmp matches 6 run scoreboard players operation $add spellcrafter.tmp *= $clone_multiplier spellcrafter.tmp
execute if score $spell spellcrafter.tmp matches 6 run scoreboard players operation $clone_multiplier spellcrafter.tmp *= #2 spellcrafter.math 

# Mana: apply cost reductions
execute if score $spell spellcrafter.tmp matches 52 run function spellcrafter:spells/shuffle/mana_cost

# Mana: update
scoreboard players operation $mana spellcrafter.tmp += $add spellcrafter.tmp


# Next iteration...
scoreboard players remove $iter spellcrafter.tmp 1
execute if score $iter spellcrafter.tmp matches 1.. run function spellcrafter:wand_generator/for_spell
