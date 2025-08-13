#> as player


# ----------
tellraw @s [{text:"                                    ",color:dark_gray,strikethrough:true}]


# Header
tellraw @s ["\n    ",{text:" ✦  ",color:white},{text:"SpellCrafter",color:"#965ed6",click_event:{action:run_command,command:"trigger SpellCrafter"},hover_event:{action:show_text,value:[{text:"/trigger SpellCrafter",color:gray}]}},{text:"  ✦ ",color:white}]

tellraw @s[] ["\n",{"text":" → ","color":"dark_gray"},{text:"Resource Pack","color":"gray",click_event:{action:"open_url",url:"https://github.com/Ivaynn/SpellCrafter/releases/latest"},hover_event:{action:show_text,value:[{text:"Open link",color:gray}]}}]

tellraw @s[] ["\n",{"text":" → ","color":"dark_gray"},{text:"Project Page","color":"gray",click_event:{action:"open_url",url:"https://github.com/Ivaynn/SpellCrafter"},hover_event:{action:show_text,value:[{text:"Open link",color:gray}]}}]

tellraw @s[] ["\n",{"text":" → ","color":"dark_gray"},{text:"Discord","color":"gray",click_event:{action:"open_url",url:"https://discord.gg/QAtc7ZgPxS"},hover_event:{action:show_text,value:[{text:"Open link",color:gray}]}}]


# ----------
tellraw @s ["\n",{text:"                                    ",color:dark_gray,strikethrough:true}]
