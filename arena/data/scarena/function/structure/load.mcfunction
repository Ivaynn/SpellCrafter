#> Macro function
# $name (str): path to structures folder "arena/1", "lobby"
# $x (int): coordinate of structure center
# $z (int): coordinate of structure center

$tellraw @a[tag=debug] ["",{text:"> ",color:"gold",bold:true},{text:"Placing structures for \"$(name)\" at ",color:"gray"},{text:"[$(x), ~, $(z)]",color:"green",hover_event:{action:"show_text",value:{text:"Click to teleport",color:"gray"}},click_event:{action:"suggest_command",command:"/tp @s $(x) ~ $(z)"}}]

$execute positioned $(x) -16 $(z) run setblock ~-1 ~ ~-1 minecraft:structure_block[mode=load]{author:"?",components:{},ignoreEntities:1b,integrity:1.0f,metadata:"",mirror:"NONE",mode:"LOAD",name:"scarena:$(name)/nw",posX:-47,posY:-47,posZ:-47,powered:0b,rotation:"NONE",seed:0L,showair:0b,showboundingbox:0b,sizeX:48,sizeY:48,sizeZ:48,strict:0b}
$execute positioned $(x) -16 $(z) run setblock ~-1 ~ ~ minecraft:structure_block[mode=load]{author:"?",components:{},ignoreEntities:1b,integrity:1.0f,metadata:"",mirror:"NONE",mode:"LOAD",name:"scarena:$(name)/sw",posX:-47,posY:-47,posZ:0,powered:0b,rotation:"NONE",seed:0L,showair:0b,showboundingbox:0b,sizeX:48,sizeY:48,sizeZ:48,strict:0b}
$execute positioned $(x) -16 $(z) run setblock ~ ~ ~-1 minecraft:structure_block[mode=load]{author:"?",components:{},ignoreEntities:1b,integrity:1.0f,metadata:"",mirror:"NONE",mode:"LOAD",name:"scarena:$(name)/ne",posX:0,posY:-47,posZ:-47,powered:0b,rotation:"NONE",seed:0L,showair:0b,showboundingbox:0b,sizeX:48,sizeY:48,sizeZ:48,strict:0b}
$execute positioned $(x) -16 $(z) run setblock ~ ~ ~ minecraft:structure_block[mode=load]{author:"?",components:{},ignoreEntities:1b,integrity:1.0f,metadata:"",mirror:"NONE",mode:"LOAD",name:"scarena:$(name)/se",posX:0,posY:-47,posZ:0,powered:0b,rotation:"NONE",seed:0L,showair:0b,showboundingbox:0b,sizeX:48,sizeY:48,sizeZ:48,strict:0b}
$execute positioned $(x) -16 $(z) run fill ~ ~-1 ~ ~-1 ~-1 ~-1 minecraft:redstone_block

$execute positioned $(x) -16 $(z) run fill ~48 ~-48 ~48 ~-49 ~1 ~-49 minecraft:barrier outline
