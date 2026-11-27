#> as projectile, at @s
# projectile hit


# Damage target
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
scoreboard players operation $damage spellcrafter.tmp = @s spellcrafter.damage
scoreboard players operation $blind spellcrafter.tmp = @s spellcrafter.blind

execute if score $damage spellcrafter.tmp matches 1.. as @e[distance=..10,type=!#spellcrafter:untargetable] if function spellcrafter:util/hitbox run function spellcrafter:damage/from_projectile


# Wither effect
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
execute unless score damage_caster spellcrafter.options matches 1 as @e[distance=..10,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator,predicate=!spellcrafter:match_id] if function spellcrafter:util/hitbox run effect give @s minecraft:wither 5 1 false
execute if score damage_caster spellcrafter.options matches 1 as @s[tag=!spellcrafter.spell.safe_shot] as @e[distance=..10,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] if function spellcrafter:util/hitbox run effect give @s minecraft:wither 5 1 false
execute if score damage_caster spellcrafter.options matches 1 as @s[tag=spellcrafter.spell.safe_shot] as @e[distance=..10,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator,predicate=!spellcrafter:match_id] if function spellcrafter:util/hitbox run effect give @s minecraft:wither 5 1 false


# Effects
playsound minecraft:entity.generic.explode player @a[distance=..100] ~ ~ ~ 2 1.5
particle minecraft:large_smoke ~ ~ ~ 0 0 0 .2 5 force @a[distance=..100]
