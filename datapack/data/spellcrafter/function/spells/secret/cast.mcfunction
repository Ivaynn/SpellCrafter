#> executed by spellcrafter:as_table/close/for_lore
# changes storage "spellcrafter:tmp lore[0]"

execute store result score $random spellcrafter.tmp run random value 6..14

execute if score $random spellcrafter.tmp matches 06 run data modify storage spellcrafter:tmp lore[0] set value {text:"AAAAAA",obfuscated:true,color:"dark_gray",italic:false}
execute if score $random spellcrafter.tmp matches 07 run data modify storage spellcrafter:tmp lore[0] set value {text:"AAAAAAA",obfuscated:true,color:"dark_gray",italic:false}
execute if score $random spellcrafter.tmp matches 08 run data modify storage spellcrafter:tmp lore[0] set value {text:"AAAAAAAA",obfuscated:true,color:"dark_gray",italic:false}
execute if score $random spellcrafter.tmp matches 09 run data modify storage spellcrafter:tmp lore[0] set value {text:"AAAAAAAAA",obfuscated:true,color:"dark_gray",italic:false}
execute if score $random spellcrafter.tmp matches 10 run data modify storage spellcrafter:tmp lore[0] set value {text:"AAAAAAAAAA",obfuscated:true,color:"dark_gray",italic:false}
execute if score $random spellcrafter.tmp matches 11 run data modify storage spellcrafter:tmp lore[0] set value {text:"AAAAAAAAAAA",obfuscated:true,color:"dark_gray",italic:false}
execute if score $random spellcrafter.tmp matches 12 run data modify storage spellcrafter:tmp lore[0] set value {text:"AAAAAAAAAAAA",obfuscated:true,color:"dark_gray",italic:false}
execute if score $random spellcrafter.tmp matches 13 run data modify storage spellcrafter:tmp lore[0] set value {text:"AAAAAAAAAAAAA",obfuscated:true,color:"dark_gray",italic:false}
execute if score $random spellcrafter.tmp matches 14 run data modify storage spellcrafter:tmp lore[0] set value {text:"AAAAAAAAAAAAAA",obfuscated:true,color:"dark_gray",italic:false}
