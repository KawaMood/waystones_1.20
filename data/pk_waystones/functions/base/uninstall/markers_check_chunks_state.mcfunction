#> pk_waystones:base/uninstall/markers_check_chunks_state

# Check if the chunk is loaded
execute as @e[type=marker,tag=pk.uninstall] at @s if loaded ~ ~ ~ run function pk_waystones:base/uninstall/marker_remove_elements

# If at least one chunk isn't loaded yet, wait 20 tick and run the function again
execute if score $uninstall.remaining_markers pk.value matches 1.. run schedule function pk_waystones:base/uninstall/markers_check_chunks_state 20t

# Check if it was the last chunk to treat
execute if score $uninstall.remaining_markers pk.value matches 0 run function pk_waystones:base/uninstall/stop