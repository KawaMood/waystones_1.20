#> pk_waystones:base/uninstall/marker_remove_elements

# Reduce remaining chunk score
scoreboard players remove $uninstall.remaining_markers pk.value 1

# Specific: Remove elements of the chunk
scoreboard players set $uninstall pk.temp 1
execute positioned ~ -512 ~ as @e[type=marker,tag=pk.waystones.waystone.controller,dx=15,dy=2048,dz=15] at @s run function pk_waystones:blocks/waystone/remove/trigger
scoreboard players set $uninstall pk.temp 0

# Remove forceload
execute if data entity @s data{WasForceloaded:0b} run forceload remove ~ ~

# Remove the marker
kill @s