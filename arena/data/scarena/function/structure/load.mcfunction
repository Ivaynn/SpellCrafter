#> Macro function
# $name (str): path to structures folder -> "arena/1"
# $x (int): coordinate of structure center
# $z (int): coordinate of structure center

scoreboard players set $success scarena.tmp 1

# Fill the outline with barriers. If that fails, stop here and force load chunks for next attempt
$setblock $(x) -15 $(z) minecraft:air
$execute store success score $success scarena.tmp positioned $(x) -16 $(z) run fill ~48 ~-48 ~48 ~-49 ~1 ~-49 minecraft:barrier outline
$execute unless score $success scarena.tmp matches 1 positioned $(x) -16 $(z) run return run forceload add ~48 ~48 ~-49 ~-49


# Place and activate the structure blocks
$execute positioned $(x) -16 $(z) run setblock ~-1 ~ ~-1 minecraft:structure_block[mode=load]{author:"?",components:{},ignoreEntities:1b,integrity:1.0f,metadata:"",mirror:"NONE",mode:"LOAD",name:"scarena:$(name)/nw",posX:-47,posY:-47,posZ:-47,powered:0b,rotation:"NONE",seed:0L,showair:0b,showboundingbox:0b,sizeX:48,sizeY:48,sizeZ:48,strict:0b}
$execute positioned $(x) -16 $(z) run setblock ~-1 ~ ~ minecraft:structure_block[mode=load]{author:"?",components:{},ignoreEntities:1b,integrity:1.0f,metadata:"",mirror:"NONE",mode:"LOAD",name:"scarena:$(name)/sw",posX:-47,posY:-47,posZ:0,powered:0b,rotation:"NONE",seed:0L,showair:0b,showboundingbox:0b,sizeX:48,sizeY:48,sizeZ:48,strict:0b}
$execute positioned $(x) -16 $(z) run setblock ~ ~ ~-1 minecraft:structure_block[mode=load]{author:"?",components:{},ignoreEntities:1b,integrity:1.0f,metadata:"",mirror:"NONE",mode:"LOAD",name:"scarena:$(name)/ne",posX:0,posY:-47,posZ:-47,powered:0b,rotation:"NONE",seed:0L,showair:0b,showboundingbox:0b,sizeX:48,sizeY:48,sizeZ:48,strict:0b}
$execute positioned $(x) -16 $(z) run setblock ~ ~ ~ minecraft:structure_block[mode=load]{author:"?",components:{},ignoreEntities:1b,integrity:1.0f,metadata:"",mirror:"NONE",mode:"LOAD",name:"scarena:$(name)/se",posX:0,posY:-47,posZ:0,powered:0b,rotation:"NONE",seed:0L,showair:0b,showboundingbox:0b,sizeX:48,sizeY:48,sizeZ:48,strict:0b}
$execute positioned $(x) -16 $(z) run fill ~ ~-1 ~ ~-1 ~-1 ~-1 minecraft:redstone_block


# Remove force loaded chunks
$execute if score $remove_forceload scarena.tmp matches 1 positioned $(x) -16 $(z) run forceload remove ~48 ~48 ~-49 ~-49


# Success
scoreboard players set $success scarena.tmp 1
