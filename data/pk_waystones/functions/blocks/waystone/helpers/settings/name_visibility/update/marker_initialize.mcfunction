#> pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/marker_initialize

# Add tag
tag @s add pk.update

# Store previous chunk's state in the marker's data
execute store result entity @s data.WasForceloaded byte 1 run scoreboard players get $forceload pk.temp