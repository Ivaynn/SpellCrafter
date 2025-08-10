#> as marker, at @s

data remove storage spellcrafter:tmp dummy.name
data modify storage spellcrafter:tmp dummy.name set from entity @s CustomName
function spellcrafter:as_target_dummy/summon/init
