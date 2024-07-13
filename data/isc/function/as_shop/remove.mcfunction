#> as shop interaction entity

execute as @s[tag=!isc.shop.interaction] run return fail

execute on passengers run kill @s[tag=isc.shop]
kill @s[tag=isc.shop]
