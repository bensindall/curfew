# Half a heart
damage @s 1
# Display curfew warning on damage tick. Change @e to @a for multiplayer
execute as @a at @s unless entity @a[distance=0.1..1.5] run function curfew:warning

# >3 mins gives Wither II
execute if score $mins_past curfew.cfg matches 3.. run effect give @s minecraft:wither 7 1 false

# Reset timer to max value
execute if score $timer curfew.cfg matches ..0 run function curfew:reset_timer
