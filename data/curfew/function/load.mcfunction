# Variable tables setup
scoreboard objectives add curfew.cfg dummy
scoreboard objectives add curfew.hp health


# Only execute if it doesn't exist already. This is how the changes persist

# Curfew window: hour it STARTS (0-23, real-world, 24h clock)
execute unless score $start_hour curfew.cfg matches -2147483648..2147483647 run function curfew:admin/default
execute unless score $start_min curfew.cfg matches -2147483648..2147483647 run function curfew:admin/default

# Default to curfew INACTIVE. The loop accounts for this
scoreboard players set $active curfew.cfg 0
scoreboard players set $mins_past curfew.cfg 0

# Initialise the max timer value
scoreboard players set $max_timer curfew.cfg 10

# Get the loop going
function curfew:loop