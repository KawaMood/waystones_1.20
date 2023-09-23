#> pk_waystones:base/uninstall/marker_initialize

# Add tag
tag @s add pk.uninstall

# Store previous chunk's state in the marker's data
execute store result entity @s data.WasForceloaded byte 1 run scoreboard players get $forceload pk.temp