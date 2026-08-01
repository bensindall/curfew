# Get real world time & set curfew active if in bounds
function curfew:check_curfew

# Set minutes past
scoreboard players operation $mins_past curfew.cfg = $curr_total curfew.cfg
scoreboard players operation $mins_past curfew.cfg -= $start_total curfew.cfg


# CURFEW ACTIVE
# Repeat loop more quickly. This determines the interval decrease rate
execute if score $active curfew.cfg matches 1 run schedule function curfew:loop 10t
# If active and timer reached 0, apply damage
execute if score $active curfew.cfg matches 1 if score $timer curfew.cfg matches ..0 as @a run function curfew:apply_damage
# Reduce interval timer (time left within damage interval)
execute if score $active curfew.cfg matches 1 run scoreboard players remove $timer curfew.cfg 1



# CURFEW INACTIVE
# Repeat in 5s if curfew inactive
execute if score $active curfew.cfg matches 0 run schedule function curfew:loop 5s

