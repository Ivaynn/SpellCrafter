
execute as @s[tag=!isc.untargetable] run return run tag @s add isc.untargetable

tag @s remove isc.untargetable
return 0
