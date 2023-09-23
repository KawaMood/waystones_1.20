#> pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/marker_update_elements

# Reduce remaining chunk score
scoreboard players remove $update.remaining_chunks pk.value 1

# Specific: Update elements of the chunk
execute positioned ~ -512 ~ as @e[type=marker,tag=pk.waystones.waystone.controller,dx=15,dy=2048,dz=15] at @s run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/marker_update_single_element

# Remove forceload
execute if data entity @s data{WasForceloaded:0b} run forceload remove ~ ~

# Remove the marker
kill @s