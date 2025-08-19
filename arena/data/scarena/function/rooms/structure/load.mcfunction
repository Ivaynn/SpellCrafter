#> Macro function
# $id (int): player's room_id
# $x (int): coordinate of structure center
# $z (int): coordinate of structure center

scoreboard players set $success scarena.tmp 1

# Fill the outline with barriers. If that fails, stop here and force load chunks for next attempt
setblock ~ -31 ~ minecraft:air
execute store success score $success scarena.tmp run fill ~16 ~-32 ~16 ~-17 ~1 ~-17 minecraft:barrier outline
execute unless score $success scarena.tmp matches 1 run return run forceload add ~16 ~16 ~-17 ~-17


# Place and activate the structure blocks
setblock ~ ~ ~ minecraft:structure_block[mode=load]{author:"?",components:{},ignoreEntities:1b,integrity:1.0f,metadata:"",mirror:"NONE",mode:"LOAD",name:"scarena:room",posX:-16,posY:-31,posZ:-16,powered:0b,rotation:"NONE",seed:0L,showair:0b,showboundingbox:1b,sizeX:32,sizeY:32,sizeZ:32,strict:0b}
setblock ~ ~-1 ~ minecraft:redstone_block


# Remove force loaded chunks
forceload remove ~16 ~16 ~-17 ~-17


# Success
scoreboard players set $success scarena.tmp 1


# Extras
execute positioned ~ -48 ~ as @e[type=!minecraft:player,distance=..28] at @s run function scarena:arena/remove_entity

execute positioned ~ -59 ~ run function spellcrafter:as_table/place/init

execute positioned ~-10 -59 ~-10 run function spellcrafter:as_target_dummy/summon/init
execute positioned ~-10 -59 ~-10 as @n[distance=..2,tag=spellcrafter.target_dummy] at @s run tp @s ~ ~ ~ -45 0

execute as @a[scores={scarena.player.state=2}] if score @s scarena.player.room_id = $room.id scarena.tmp run function scarena:rooms/new/tp_player
