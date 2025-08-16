#> Macro function
# $name (str): path to structures folder "arena/1", "lobby"
# $x (int): coordinate of structure center
# $z (int): coordinate of structure center

$execute positioned $(x) -15 $(z) run setblock ~-1 ~ ~-1 minecraft:structure_block[mode=save]{author:"?",components:{},ignoreEntities:1b,integrity:1.0f,metadata:"",mirror:"NONE",mode:"SAVE",name:"scarena:$(name)/nw",posX:-47,posY:-48,posZ:-47,powered:0b,rotation:"NONE",seed:0L,showair:0b,showboundingbox:0b,sizeX:48,sizeY:48,sizeZ:48,strict:0b}
$execute positioned $(x) -15 $(z) run setblock ~-1 ~ ~ minecraft:structure_block[mode=save]{author:"?",components:{},ignoreEntities:1b,integrity:1.0f,metadata:"",mirror:"NONE",mode:"SAVE",name:"scarena:$(name)/sw",posX:-47,posY:-48,posZ:0,powered:0b,rotation:"NONE",seed:0L,showair:0b,showboundingbox:0b,sizeX:48,sizeY:48,sizeZ:48,strict:0b}
$execute positioned $(x) -15 $(z) run setblock ~ ~ ~-1 minecraft:structure_block[mode=save]{author:"?",components:{},ignoreEntities:1b,integrity:1.0f,metadata:"",mirror:"NONE",mode:"SAVE",name:"scarena:$(name)/ne",posX:0,posY:-48,posZ:-47,powered:0b,rotation:"NONE",seed:0L,showair:0b,showboundingbox:0b,sizeX:48,sizeY:48,sizeZ:48,strict:0b}
$execute positioned $(x) -15 $(z) run setblock ~ ~ ~ minecraft:structure_block[mode=save]{author:"?",components:{},ignoreEntities:1b,integrity:1.0f,metadata:"",mirror:"NONE",mode:"SAVE",name:"scarena:$(name)/se",posX:0,posY:-48,posZ:0,powered:0b,rotation:"NONE",seed:0L,showair:0b,showboundingbox:0b,sizeX:48,sizeY:48,sizeZ:48,strict:0b}

$tellraw @a[tag=debug] ["",{text:"> ",color:"gold",bold:true},{text:"Structure blocks for \"$(name)\" ready at ",color:"gray"},{text:"[$(x), -14, $(z)]",color:"green",hover_event:{action:"show_text",value:{text:"Click to teleport",color:"gray"}},click_event:{action:"suggest_command",command:"/tp @s $(x) -14 $(z) 0 90"}}]
