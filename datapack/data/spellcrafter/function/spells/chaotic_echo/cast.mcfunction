#> as projectile, on summon, at @s


# Get number from 1 to len(spells) - 0 is the current spell
execute store result score $count spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells
scoreboard players remove $count spellcrafter.tmp 1
execute store result score $random spellcrafter.tmp run random value 1..100000
scoreboard players operation $random spellcrafter.tmp %= $count spellcrafter.tmp
scoreboard players add $random spellcrafter.tmp 1
execute unless score $random spellcrafter.tmp matches 1..26 run scoreboard players set $random spellcrafter.tmp 0


# Get spell id
scoreboard players set $echo.spell spellcrafter.tmp 0
execute if score $random spellcrafter.tmp matches 1 store result score $echo.spell spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells[1]
execute if score $random spellcrafter.tmp matches 2 store result score $echo.spell spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells[2]
execute if score $random spellcrafter.tmp matches 3 store result score $echo.spell spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells[3]
execute if score $random spellcrafter.tmp matches 4 store result score $echo.spell spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells[4]
execute if score $random spellcrafter.tmp matches 5 store result score $echo.spell spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells[5]
execute if score $random spellcrafter.tmp matches 6 store result score $echo.spell spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells[6]
execute if score $random spellcrafter.tmp matches 7 store result score $echo.spell spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells[7]
execute if score $random spellcrafter.tmp matches 8 store result score $echo.spell spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells[8]
execute if score $random spellcrafter.tmp matches 9 store result score $echo.spell spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells[9]
execute if score $random spellcrafter.tmp matches 10 store result score $echo.spell spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells[10]
execute if score $random spellcrafter.tmp matches 11 store result score $echo.spell spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells[11]
execute if score $random spellcrafter.tmp matches 12 store result score $echo.spell spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells[12]
execute if score $random spellcrafter.tmp matches 13 store result score $echo.spell spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells[13]
execute if score $random spellcrafter.tmp matches 14 store result score $echo.spell spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells[14]
execute if score $random spellcrafter.tmp matches 15 store result score $echo.spell spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells[15]
execute if score $random spellcrafter.tmp matches 16 store result score $echo.spell spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells[16]
execute if score $random spellcrafter.tmp matches 17 store result score $echo.spell spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells[17]
execute if score $random spellcrafter.tmp matches 18 store result score $echo.spell spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells[18]
execute if score $random spellcrafter.tmp matches 19 store result score $echo.spell spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells[19]
execute if score $random spellcrafter.tmp matches 20 store result score $echo.spell spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells[20]
execute if score $random spellcrafter.tmp matches 21 store result score $echo.spell spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells[21]
execute if score $random spellcrafter.tmp matches 22 store result score $echo.spell spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells[22]
execute if score $random spellcrafter.tmp matches 23 store result score $echo.spell spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells[23]
execute if score $random spellcrafter.tmp matches 24 store result score $echo.spell spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells[24]
execute if score $random spellcrafter.tmp matches 25 store result score $echo.spell spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells[25]
execute if score $random spellcrafter.tmp matches 26 store result score $echo.spell spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells[26]


# Confirm spell
function spellcrafter:spells/echo/confirm
