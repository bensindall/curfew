# Uses get-systime datapack to read real world time
function getsystime:get

# Assume inactive
scoreboard players set $active curfew.cfg 0

# CALCULATE TOTAL MINS SINCE MIDNIGHT
# Constant for multiplication
scoreboard players set $60 curfew.cfg 60

# Current time
scoreboard players operation $curr_total curfew.cfg = $Hour GetSysTime
scoreboard players operation $curr_total curfew.cfg *= $60 curfew.cfg
scoreboard players operation $curr_total curfew.cfg += $Minute GetSysTime

# Start time
scoreboard players operation $start_total curfew.cfg = $start_hour curfew.cfg
scoreboard players operation $start_total curfew.cfg *= $60 curfew.cfg
scoreboard players operation $start_total curfew.cfg += $start_min curfew.cfg

# End time
scoreboard players operation $end_total curfew.cfg = $end_hour curfew.cfg
scoreboard players operation $end_total curfew.cfg *= $60 curfew.cfg
scoreboard players operation $end_total curfew.cfg += $end_min curfew.cfg

# Same-day window (start < end): active if start <= hour < end                          
execute if score $start_total curfew.cfg < $end_total curfew.cfg if score $curr_total curfew.cfg >= $start_total curfew.cfg if score $curr_total curfew.cfg < $end_total curfew.cfg run scoreboard players set $active curfew.cfg 1

# Overnight window (start > end): active if hour >= start OR hour < end
execute if score $start_total curfew.cfg > $end_total curfew.cfg if score $curr_total curfew.cfg >= $start_total curfew.cfg run scoreboard players set $active curfew.cfg 1
execute if score $start_total curfew.cfg > $end_total curfew.cfg if score $curr_total curfew.cfg < $end_total curfew.cfg run scoreboard players set $active curfew.cfg 1
