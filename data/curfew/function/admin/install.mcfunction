# Setup the command block with systime
function getsystime:set
tellraw @s [{"text":"[Curfew] ","color":"dark_purple"},{"text":"Real-world clock installed at your position. Curfew is now active.","color":"green"}]
