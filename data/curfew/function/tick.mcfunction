# Every tick while curfew is active, watch health so we can kick in time
execute if score $active curfew.cfg matches 1 run execute as @a[scores={curfew.hp=..1}] run function curfew:kick_player

# Distance effects if curfew active
execute if score $active curfew.cfg matches 1 run function curfew:distance_effects