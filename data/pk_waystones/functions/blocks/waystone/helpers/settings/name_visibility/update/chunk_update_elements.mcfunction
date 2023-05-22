#> pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/chunk_update_elements

# Reduce remaining chunk score
scoreboard players remove $update.remaining_chunks pk.value 1

# Store data in score
scoreboard players set $was_forceloaded pk.temp 0
execute store result score $was_forceloaded pk.temp run data get entity @s data.WasForceloaded

# Specific: Update elements of the chunk
execute positioned ~ -64 ~ as @e[type=marker,tag=pk.waystones.waystone.controller] at @s run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/chunk_update_single_element

# Remove the marker
kill @s

# Remove forceload
execute if score $was_forceloaded pk.temp matches 0 run forceload remove ~ ~

# Check if it was the last chunk to treat
execute if score $update.remaining_chunks pk.value matches 0 run schedule function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/stop 1t