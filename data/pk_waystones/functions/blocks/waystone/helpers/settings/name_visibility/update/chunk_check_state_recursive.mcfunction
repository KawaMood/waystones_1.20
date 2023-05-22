#> pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/chunk_check_state_recursive

execute as @e[type=marker,tag=pk.update] at @s if loaded ~ ~ ~ run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/chunk_update_elements
execute if score $update.remaining_chunks pk.value matches 1.. run schedule function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/chunk_check_state_recursive 1t replace