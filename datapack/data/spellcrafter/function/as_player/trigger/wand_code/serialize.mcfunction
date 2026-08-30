#> as player


# Schema version: must be 1 for now - use this field to support future schema changes
scoreboard players set $value spellcrafter.tmp 1
function spellcrafter:as_player/trigger/wand_code/append_one


# Serialize wand data
execute store result score $value spellcrafter.tmp run data get storage spellcrafter:tmp trigger.code.wand.base_mana
function spellcrafter:as_player/trigger/wand_code/append_two

execute store result score $value spellcrafter.tmp run data get storage spellcrafter:tmp trigger.code.wand.base_cooldown
function spellcrafter:as_player/trigger/wand_code/append_two

execute store result score $value spellcrafter.tmp run data get storage spellcrafter:tmp trigger.code.wand.cap
function spellcrafter:as_player/trigger/wand_code/append_one

execute store result score $value spellcrafter.tmp run data get storage spellcrafter:tmp trigger.code.wand.skin
function spellcrafter:as_player/trigger/wand_code/append_two

execute store result score $value spellcrafter.tmp run data get storage spellcrafter:tmp trigger.code.wand.mod
function spellcrafter:as_player/trigger/wand_code/append_two

scoreboard players set $slot spellcrafter.tmp 0
function spellcrafter:as_player/trigger/wand_code/for_spell


# Prepare macro for clipboard copy
data modify storage spellcrafter:tmp trigger.code.macro.c0 set from storage spellcrafter:tmp trigger.code.characters[0]
data modify storage spellcrafter:tmp trigger.code.macro.c1 set from storage spellcrafter:tmp trigger.code.characters[1]
data modify storage spellcrafter:tmp trigger.code.macro.c2 set from storage spellcrafter:tmp trigger.code.characters[2]
data modify storage spellcrafter:tmp trigger.code.macro.c3 set from storage spellcrafter:tmp trigger.code.characters[3]
data modify storage spellcrafter:tmp trigger.code.macro.c4 set from storage spellcrafter:tmp trigger.code.characters[4]
data modify storage spellcrafter:tmp trigger.code.macro.c5 set from storage spellcrafter:tmp trigger.code.characters[5]
data modify storage spellcrafter:tmp trigger.code.macro.c6 set from storage spellcrafter:tmp trigger.code.characters[6]
data modify storage spellcrafter:tmp trigger.code.macro.c7 set from storage spellcrafter:tmp trigger.code.characters[7]
data modify storage spellcrafter:tmp trigger.code.macro.c8 set from storage spellcrafter:tmp trigger.code.characters[8]
data modify storage spellcrafter:tmp trigger.code.macro.c9 set from storage spellcrafter:tmp trigger.code.characters[9]
data modify storage spellcrafter:tmp trigger.code.macro.c10 set from storage spellcrafter:tmp trigger.code.characters[10]
data modify storage spellcrafter:tmp trigger.code.macro.c11 set from storage spellcrafter:tmp trigger.code.characters[11]
data modify storage spellcrafter:tmp trigger.code.macro.c12 set from storage spellcrafter:tmp trigger.code.characters[12]
data modify storage spellcrafter:tmp trigger.code.macro.c13 set from storage spellcrafter:tmp trigger.code.characters[13]
data modify storage spellcrafter:tmp trigger.code.macro.c14 set from storage spellcrafter:tmp trigger.code.characters[14]
data modify storage spellcrafter:tmp trigger.code.macro.c15 set from storage spellcrafter:tmp trigger.code.characters[15]
data modify storage spellcrafter:tmp trigger.code.macro.c16 set from storage spellcrafter:tmp trigger.code.characters[16]
data modify storage spellcrafter:tmp trigger.code.macro.c17 set from storage spellcrafter:tmp trigger.code.characters[17]
data modify storage spellcrafter:tmp trigger.code.macro.c18 set from storage spellcrafter:tmp trigger.code.characters[18]
data modify storage spellcrafter:tmp trigger.code.macro.c19 set from storage spellcrafter:tmp trigger.code.characters[19]
data modify storage spellcrafter:tmp trigger.code.macro.c20 set from storage spellcrafter:tmp trigger.code.characters[20]
data modify storage spellcrafter:tmp trigger.code.macro.c21 set from storage spellcrafter:tmp trigger.code.characters[21]
data modify storage spellcrafter:tmp trigger.code.macro.c22 set from storage spellcrafter:tmp trigger.code.characters[22]
data modify storage spellcrafter:tmp trigger.code.macro.c23 set from storage spellcrafter:tmp trigger.code.characters[23]
data modify storage spellcrafter:tmp trigger.code.macro.c24 set from storage spellcrafter:tmp trigger.code.characters[24]
data modify storage spellcrafter:tmp trigger.code.macro.c25 set from storage spellcrafter:tmp trigger.code.characters[25]
data modify storage spellcrafter:tmp trigger.code.macro.c26 set from storage spellcrafter:tmp trigger.code.characters[26]
data modify storage spellcrafter:tmp trigger.code.macro.c27 set from storage spellcrafter:tmp trigger.code.characters[27]
data modify storage spellcrafter:tmp trigger.code.macro.c28 set from storage spellcrafter:tmp trigger.code.characters[28]
data modify storage spellcrafter:tmp trigger.code.macro.c29 set from storage spellcrafter:tmp trigger.code.characters[29]
data modify storage spellcrafter:tmp trigger.code.macro.c30 set from storage spellcrafter:tmp trigger.code.characters[30]
data modify storage spellcrafter:tmp trigger.code.macro.c31 set from storage spellcrafter:tmp trigger.code.characters[31]
data modify storage spellcrafter:tmp trigger.code.macro.c32 set from storage spellcrafter:tmp trigger.code.characters[32]
data modify storage spellcrafter:tmp trigger.code.macro.c33 set from storage spellcrafter:tmp trigger.code.characters[33]
data modify storage spellcrafter:tmp trigger.code.macro.c34 set from storage spellcrafter:tmp trigger.code.characters[34]
data modify storage spellcrafter:tmp trigger.code.macro.c35 set from storage spellcrafter:tmp trigger.code.characters[35]
data modify storage spellcrafter:tmp trigger.code.macro.c36 set from storage spellcrafter:tmp trigger.code.characters[36]
data modify storage spellcrafter:tmp trigger.code.macro.c37 set from storage spellcrafter:tmp trigger.code.characters[37]
data modify storage spellcrafter:tmp trigger.code.macro.c38 set from storage spellcrafter:tmp trigger.code.characters[38]
data modify storage spellcrafter:tmp trigger.code.macro.c39 set from storage spellcrafter:tmp trigger.code.characters[39]
data modify storage spellcrafter:tmp trigger.code.macro.c40 set from storage spellcrafter:tmp trigger.code.characters[40]
data modify storage spellcrafter:tmp trigger.code.macro.c41 set from storage spellcrafter:tmp trigger.code.characters[41]
data modify storage spellcrafter:tmp trigger.code.macro.c42 set from storage spellcrafter:tmp trigger.code.characters[42]
data modify storage spellcrafter:tmp trigger.code.macro.c43 set from storage spellcrafter:tmp trigger.code.characters[43]
data modify storage spellcrafter:tmp trigger.code.macro.c44 set from storage spellcrafter:tmp trigger.code.characters[44]
data modify storage spellcrafter:tmp trigger.code.macro.c45 set from storage spellcrafter:tmp trigger.code.characters[45]
data modify storage spellcrafter:tmp trigger.code.macro.c46 set from storage spellcrafter:tmp trigger.code.characters[46]
data modify storage spellcrafter:tmp trigger.code.macro.c47 set from storage spellcrafter:tmp trigger.code.characters[47]
data modify storage spellcrafter:tmp trigger.code.macro.c48 set from storage spellcrafter:tmp trigger.code.characters[48]
data modify storage spellcrafter:tmp trigger.code.macro.c49 set from storage spellcrafter:tmp trigger.code.characters[49]
data modify storage spellcrafter:tmp trigger.code.macro.c50 set from storage spellcrafter:tmp trigger.code.characters[50]
data modify storage spellcrafter:tmp trigger.code.macro.c51 set from storage spellcrafter:tmp trigger.code.characters[51]
data modify storage spellcrafter:tmp trigger.code.macro.c52 set from storage spellcrafter:tmp trigger.code.characters[52]
data modify storage spellcrafter:tmp trigger.code.macro.c53 set from storage spellcrafter:tmp trigger.code.characters[53]
data modify storage spellcrafter:tmp trigger.code.macro.c54 set from storage spellcrafter:tmp trigger.code.characters[54]
data modify storage spellcrafter:tmp trigger.code.macro.c55 set from storage spellcrafter:tmp trigger.code.characters[55]
data modify storage spellcrafter:tmp trigger.code.macro.c56 set from storage spellcrafter:tmp trigger.code.characters[56]
data modify storage spellcrafter:tmp trigger.code.macro.c57 set from storage spellcrafter:tmp trigger.code.characters[57]
data modify storage spellcrafter:tmp trigger.code.macro.c58 set from storage spellcrafter:tmp trigger.code.characters[58]
data modify storage spellcrafter:tmp trigger.code.macro.c59 set from storage spellcrafter:tmp trigger.code.characters[59]
data modify storage spellcrafter:tmp trigger.code.macro.c60 set from storage spellcrafter:tmp trigger.code.characters[60]
data modify storage spellcrafter:tmp trigger.code.macro.c61 set from storage spellcrafter:tmp trigger.code.characters[61]
data modify storage spellcrafter:tmp trigger.code.macro.c62 set from storage spellcrafter:tmp trigger.code.characters[62]
data modify storage spellcrafter:tmp trigger.code.macro.c63 set from storage spellcrafter:tmp trigger.code.characters[63]
function spellcrafter:as_player/trigger/wand_code/macro with storage spellcrafter:tmp trigger.code.macro
