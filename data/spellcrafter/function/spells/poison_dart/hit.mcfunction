#> as projectile, at @s
# projectile hit


# Damage target
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
scoreboard players operation $damage spellcrafter.tmp = @s spellcrafter.damage
scoreboard players operation $blind spellcrafter.tmp = @s spellcrafter.blind

execute if score $damage spellcrafter.tmp matches 1.. positioned ~ ~-1 ~ as @e[distance=..3,limit=1,sort=nearest,type=!#spellcrafter:untargetable] run function spellcrafter:damage/add


# Poison
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
execute unless score damage_caster spellcrafter.options matches 1 run effect give @e[distance=..3,limit=1,sort=nearest,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator,predicate=!spellcrafter:match_id] minecraft:poison 5 0 false
execute if score damage_caster spellcrafter.options matches 1 as @s[tag=!spellcrafter.spell.safe_shot] run effect give @e[distance=..3,limit=1,sort=nearest,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] minecraft:poison 5 0 false
execute if score damage_caster spellcrafter.options matches 1 as @s[tag=spellcrafter.spell.safe_shot] run effect give @e[distance=..3,limit=1,sort=nearest,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator,predicate=!spellcrafter:match_id] minecraft:poison 5 0 false


# Effects
playsound minecraft:entity.slime.squish_small player @a ~ ~ ~ 1 1.2
