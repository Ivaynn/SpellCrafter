#> any

tellraw @a[tag=debug] ["",{text:"> ",color:"gold",bold:true},{text:"Placing lobby structure at ",color:"gray"},{text:"[0, ~, 0]",color:"green",hover_event:{action:"show_text",value:{text:"Click to teleport",color:"gray"}},click_event:{action:"suggest_command",command:"/tp @s 0 ~ 0"}}]

setblock 0 -25 0 minecraft:structure_block[mode=load]{author:"?",components:{},ignoreEntities:1b,integrity:1.0f,metadata:"",mirror:"NONE",mode:"LOAD",name:"scarena:lobby",posX:-22,posY:-20,posZ:-22,powered:0b,rotation:"NONE",seed:0L,showair:0b,showboundingbox:0b,sizeX:45,sizeY:20,sizeZ:45,strict:0b}
setblock 0 -26 0 minecraft:redstone_block
fill 23 -46 23 -23 -25 -23 minecraft:barrier outline
