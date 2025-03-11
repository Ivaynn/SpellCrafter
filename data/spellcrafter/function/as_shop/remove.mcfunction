#> as shop interaction entity

execute as @s[tag=!spellcrafter.shop.interaction] run return fail

execute on passengers run kill @s[tag=spellcrafter.shop]
kill @s[tag=spellcrafter.shop]
