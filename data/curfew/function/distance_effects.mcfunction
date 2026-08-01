# Distance effects monitored every tick, only if curfew active (see tick.mcfunction)

# Change @e to @a for multiplayer
execute as @a at @s if entity @a[distance=1.5..4] as @s run function curfew:effects/safe_zone
execute as @a at @s if entity @a[distance=0.1..1.5] as @s run function curfew:effects/room_for_jesus