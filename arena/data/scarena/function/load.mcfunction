#> executed by #minecraft:load

tellraw @a ["",{text:"> ",color:"#965ed6",bold:true},{text:"Reloaded!",color:"gray"}]


# SpellCrafter options
scoreboard players set trader_spawn spellcrafter.options 0


# Gamerules
gamerule commandModificationBlockLimit 500000


# Scoreboards




# Test: load structure
data modify storage scarena:tmp structure set value {name:"arena/1", x:0, z:0}
function scarena:structure/place with storage scarena:tmp structure
