#> as table, at barrel


# If barrel is locked, someone else is using it
execute if data block ~ ~ ~ Lock run return 0


# Success
function spellcrafter:as_table/open/init
return 1
