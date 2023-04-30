#> pk_waystones:packages/dimension_marker/player_joined_custom_dimension
# Check if there is already a dimension mark entity in this custom dimension

advancement revoke @s only pk_waystones:packages/dimension_marker/joined_custom_dimension

# Check upstream is the chunk is already forceloaded to counter issue (MC-143952)
execute store result score $already_forceloaded pk.temp run forceload query -30000000 1611
execute if score $already_forceloaded pk.temp matches 0 run forceload add -30000000 1611
execute positioned -30000000 0 1611 unless entity @e[type=marker,tag=pk.dimension.marker,distance=..0.1] summon marker run function pk_waystones:packages/dimension_marker/marker_initialize

# Debug logs
execute if score $logs.datapack.waystones pk.value matches 1 run tellraw @a[tag=pk.dev] [{"selector":"@s","color": "gray"},{"text": " entered a custom dimension"}]