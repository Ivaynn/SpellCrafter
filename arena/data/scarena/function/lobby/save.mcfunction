#> any

setblock 0 -25 0 minecraft:structure_block[mode=save]{author:"?",components:{},ignoreEntities:1b,integrity:1.0f,metadata:"",mirror:"NONE",mode:"SAVE",name:"scarena:lobby",posX:-22,posY:-20,posZ:-22,powered:0b,rotation:"NONE",seed:0L,showair:0b,showboundingbox:0b,sizeX:45,sizeY:20,sizeZ:45,strict:0b}
tellraw @a[tag=debug] ["",{text:"> ",color:"gold",bold:true},{text:"Structure block for lobby ready at ",color:"gray"},{text:"[0, -24, 0]",color:"green",hover_event:{action:"show_text",value:{text:"Click to teleport",color:"gray"}},click_event:{action:"suggest_command",command:"/tp @s 0 -24 0 0 90"}}]
