#> pk_waystones:base/uninstall/chunk_check_state_recursive

execute as @e[type=marker,tag=pk.uninstall] at @s if loaded ~ ~ ~ run function pk_waystones:base/uninstall/chunk_remove_elements
execute if score $uninstall.remaining_chunks pk.value matches 1.. run schedule function pk_waystones:base/uninstall/chunk_check_state_recursive 1t replace