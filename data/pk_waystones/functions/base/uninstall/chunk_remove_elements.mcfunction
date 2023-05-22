#> pk_waystones:base/uninstall/chunk_remove_elements

# Reduce remaining chunk score
scoreboard players remove $uninstall.remaining_chunks pk.value 1

# Store data in score
scoreboard players set $was_forceloaded pk.temp 0
execute store result score $was_forceloaded pk.temp run data get entity @s data.WasForceloaded

# Specific: Remove elements of the chunk
scoreboard players set $uninstall pk.temp 1
execute as @e[type=marker,tag=pk.waystones.waystone.controller] at @s run function pk_waystones:blocks/waystone/remove/trigger
scoreboard players set $uninstall pk.temp 0

# Remove the marker
kill @s

# Remove forceload
execute if score $was_forceloaded pk.temp matches 0 run forceload remove ~ ~

# Check if it was the last chunk to treat
execute if score $uninstall.remaining_chunks pk.value matches 0 run schedule function pk_waystones:base/uninstall/stop 1t