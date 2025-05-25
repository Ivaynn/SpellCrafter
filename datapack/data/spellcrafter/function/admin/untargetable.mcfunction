
execute as @s[tag=!spellcrafter.untargetable] run return run tag @s add spellcrafter.untargetable

tag @s remove spellcrafter.untargetable
return 0
