#> as player


# ----------
tellraw @s [{text:"                                    ",color:dark_gray,strikethrough:true}]


# Header
tellraw @s ["\n    ",{text:" ✦  ",color:white},{text:"SpellCrafter",color:"#965ed6",click_event:{action:run_command,command:"trigger SpellCrafter"},hover_event:{action:show_text,value:[{text:"/trigger SpellCrafter",color:gray}]}},{text:"  ✦ ",color:white}]


# Spellcasting: enabled/disabled
tellraw @s[tag=!spellcrafter.caster] ["\n",{"text":" Spellcasting","color":"gray"},{"text":" → ","color":"dark_gray"},{text:"disabled","color":"white",click_event:{action:run_command,command:"trigger SpellCrafter set 9"},hover_event:{action:show_text,value:[{text:"Click to enable",color:gray}]}}]
tellraw @s[tag=spellcrafter.caster] ["\n",{"text":" Spellcasting","color":"gray"},{"text":" → ","color":"dark_gray"},{text:"enabled","color":"white",click_event:{action:run_command,command:"trigger SpellCrafter set 9"},hover_event:{action:show_text,value:[{text:"Click to disable",color:gray}]}}]


# Actionar → 0 1 2 3 ...
tellraw @s ["\n",{"text":" Actionbar","color":"gray"},{"text":" → ","color":"dark_gray"},\
    {text:"0","color":"white",click_event:{action:run_command,command:"trigger SpellCrafter set 10"},hover_event:{action:show_text,value:[{text:"disabled",color:"gray"}]}}, \
    {text:" 1","color":"white",click_event:{action:run_command,command:"trigger SpellCrafter set 11"},hover_event:{action:show_text,value:[{text:"◆ 75",color:"aqua"},{text:"   ⌚ 3.65",color:"gray"}]}}, \
    {text:" 2","color":"white",click_event:{action:run_command,command:"trigger SpellCrafter set 12"},hover_event:{action:show_text,value:[{text:"◆ 75",color:"aqua"},{text:"   ⌚ 4",color:"gray"}]}}, \
    {text:" 3","color":"white",click_event:{action:run_command,command:"trigger SpellCrafter set 13"},hover_event:{action:show_text,value:[{text:"◆ 75/100",color:"aqua"},{text:"   ⌚ 3.65",color:"gray"}]}},\
    {text:" 4","color":"white",click_event:{action:run_command,command:"trigger SpellCrafter set 14"},hover_event:{action:show_text,value:[{text:"◆ 75/100",color:"aqua"},{text:"   ⌚ 4",color:"gray"}]}},\
    {text:" 5","color":"white",click_event:{action:run_command,command:"trigger SpellCrafter set 15"},hover_event:{action:show_text,value:[{text:"75 ▌▌▌▌▌▌▌",color:"aqua"},{text:"▌▌▌",color:"gray"},{text:" 3.65",color:"gray"}]}},\
    {text:" 6","color":"white",click_event:{action:run_command,command:"trigger SpellCrafter set 16"},hover_event:{action:show_text,value:[{text:"75 ▌▌▌▌▌▌▌",color:"aqua"},{text:"▌▌▌",color:"gray"},{text:" 4",color:"gray"}]}},\
]


# ----------
tellraw @s ["\n",{text:"                                    ",color:dark_gray,strikethrough:true}]
