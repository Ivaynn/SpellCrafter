#> as projectile, on summon, at @s
# instant cast

# Summon entity

execute summon minecraft:firework_rocket run function isc:spells/firework_rocket/as_firework

# execute if score $type isc.tmp matches 1 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime:22,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"star",colors:[I;14726438]}]}}}}
# execute if score $type isc.tmp matches 2 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime:15,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",colors:[I;2829099],fade_colors:[I;10658466]}]}}}}
# execute if score $type isc.tmp matches 3 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime:20,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"creeper",has_twinkle:true,colors:[I;65297],fade_colors:[I;28193]}]}}}}
# execute if score $type isc.tmp matches 4 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime:17,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"burst",has_trail:true,colors:[I;16729593,9320703,15058943]}]}}}}
# execute if score $type isc.tmp matches 5 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime:28,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"star",has_twinkle:true,has_trail:true,colors:[I;3437453,3106684],fade_colors:[I;10658466,9342606]}]}}}}
# execute if score $type isc.tmp matches 6 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime:30,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"creeper",has_trail:true,colors:[I;11873510,7234559],fade_colors:[I;16777215]}]}}}}
# execute if score $type isc.tmp matches 7 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime:24,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"burst",has_trail:true,colors:[I;16711680,16750848,16252672,65306,56831,3342591,9437439]}]}}}}
# execute if score $type isc.tmp matches 8 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime:18,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"small_ball",has_twinkle:true,colors:[I;7602063,6094814]}]}}}}
# execute if score $type isc.tmp matches 9 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime:23,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",has_trail:true,colors:[I;2031800,4238591]}]}}}}



# Success check
return 1
