# Remove curfew data cleanly before deleting
function getsystime:uninstall
scoreboard objectives remove curfew.cfg
scoreboard objectives remove curfew.hp
scoreboard objectives remove GetSysTime
tellraw @a [{"text":"[Curfew] ","color":"dark_purple"},{"text":"Uninstalled. You can now delete the curfew datapack folder."}]
