#> as player


# Header
tellraw @s ["\n",{text:"            ",color:"dark_gray",strikethrough:true},"  ",{text:"SpellCrafter",color:"#965ed6",click_event:{action:run_command,command:"trigger SpellCrafter"},hover_event:{action:show_text,value:[{text:"/trigger SpellCrafter",color:gray}]}},"  ",{text:"            ",color:"dark_gray",strikethrough:true}]


# Links
tellraw @s ["\n  ",{text:"GitHub","color":"gray",click_event:{action:"open_url",url:"https://github.com/Ivaynn/SpellCrafter"},hover_event:{action:show_text,value:[{text:"Open link to Project Page",color:gray}]}},{"text":" • ","color":"#965ed6"},{text:"Resource Pack","color":"gray",click_event:{action:"open_url",url:"https://github.com/Ivaynn/SpellCrafter/releases"},hover_event:{action:show_text,value:[{text:"Open link to Resource Pack Releases",color:gray}]}},{"text":" • ","color":"#965ed6"},{text:"Discord","color":"gray",click_event:{action:"open_url",url:"https://discord.gg/QAtc7ZgPxS"},hover_event:{action:show_text,value:[{text:"Open link to Discord Server",color:gray}]}},"\n"]


# Spellcasting: enabled/disabled
tellraw @s[tag=!spellcrafter.caster] ["",{"text":" Spellcasting","color":"gray"},{"text":" → ","color":"#965ed6"},{text:"disabled","color":"white",click_event:{action:run_command,command:"trigger SpellCrafter set 9"},hover_event:{action:show_text,value:[{text:"Click to enable",color:gray}]}}]
tellraw @s[tag=spellcrafter.caster] ["",{"text":" Spellcasting","color":"gray"},{"text":" → ","color":"#965ed6"},{text:"enabled","color":"white",click_event:{action:run_command,command:"trigger SpellCrafter set 9"},hover_event:{action:show_text,value:[{text:"Click to disable",color:gray}]}}]


# Actionar → 0 1 2 3 ...
tellraw @s ["",{"text":" Actionbar","color":"gray"},{"text":" → ","color":"#965ed6"},\
    {text:"0","color":"white",click_event:{action:run_command,command:"trigger SpellCrafter set 10"},hover_event:{action:show_text,value:[{text:"disabled",color:"gray"}]}}, \
    {text:" 1","color":"white",click_event:{action:run_command,command:"trigger SpellCrafter set 11"},hover_event:{action:show_text,value:[{text:"◆ 75",color:"aqua"},{text:"   ⌚ 3.65",color:"gray"}]}}, \
    {text:" 2","color":"white",click_event:{action:run_command,command:"trigger SpellCrafter set 12"},hover_event:{action:show_text,value:[{text:"◆ 75",color:"aqua"},{text:"   ⌚ 4",color:"gray"}]}}, \
    {text:" 3","color":"white",click_event:{action:run_command,command:"trigger SpellCrafter set 13"},hover_event:{action:show_text,value:[{text:"◆ 75/100",color:"aqua"},{text:"   ⌚ 3.65",color:"gray"}]}},\
    {text:" 4","color":"white",click_event:{action:run_command,command:"trigger SpellCrafter set 14"},hover_event:{action:show_text,value:[{text:"◆ 75/100",color:"aqua"},{text:"   ⌚ 4",color:"gray"}]}},\
    {text:" 5","color":"white",click_event:{action:run_command,command:"trigger SpellCrafter set 15"},hover_event:{action:show_text,value:[{text:"75 ▌▌▌▌▌▌▌",color:"aqua"},{text:"▌▌▌",color:"gray"},{text:" 3.65",color:"gray"}]}},\
    {text:" 6","color":"white",click_event:{action:run_command,command:"trigger SpellCrafter set 16"},hover_event:{action:show_text,value:[{text:"75 ▌▌▌▌▌▌▌",color:"aqua"},{text:"▌▌▌",color:"gray"},{text:" 4",color:"gray"}]}},\
]


# Wand: share / code
tellraw @s ["",{"text":" Wand","color":"gray"},{"text":" → ","color":"#965ed6"},{text:"share","color":"white",click_event:{action:run_command,command:"trigger SpellCrafter set 20"},hover_event:{action:show_text,value:[{text:"Click to share your wand in the chat",color:gray}]}},{"text":" • ","color":"#965ed6"},{text:"code","color":"white",click_event:{action:run_command,command:"trigger SpellCrafter set 21"},hover_event:{action:show_text,value:[{text:"Click to get your wand's code",color:gray}]}}]



# ----------
tellraw @s ["\n",{text:"                                   ",color:"dark_gray",strikethrough:true,bold:true}]
