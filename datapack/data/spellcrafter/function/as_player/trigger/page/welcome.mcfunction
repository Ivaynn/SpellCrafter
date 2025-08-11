#> as player

tellraw @s ["\n    ",{text:" ✦  ",color:white},{text:"SpellCrafter",color:"#965ed6",click_event:{action:run_command,command:"trigger SpellCrafter"},hover_event:{action:show_text,value:[{text:"/trigger SpellCrafter",color:gray}]}},{text:"  ✦ ",color:white}]
tellraw @s ["        ",{text:"Click to start...",italic:true,color:gray,click_event:{action:run_command,command:"trigger SpellCrafter"},hover_event:{action:show_text,value:[{text:"/trigger SpellCrafter",color:gray}]}},"\n"]



