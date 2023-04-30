#> pk_waystones:blocks/waystone/place/blocks_list/set_dimension_id

# Default score
scoreboard players set $temp pk.dimension.id -99

# If placed in a vanilla dimension
execute if predicate pk_waystones:location/dimension/0 run scoreboard players set $temp pk.dimension.id 0
execute if predicate pk_waystones:location/dimension/-1 run scoreboard players set $temp pk.dimension.id -1
execute if predicate pk_waystones:location/dimension/1 run scoreboard players set $temp pk.dimension.id 1

# If placed in a custom dimension
# Check upstream is the chunk is already forceloaded to counter issue (MC-143952)
execute store result score $already_forceloaded pk.temp run forceload query -30000000 1611
execute if score $already_forceloaded pk.temp matches 0 run forceload add -30000000 1611
execute if score $temp pk.dimension.id matches -99 positioned -30000000 0 1611 run scoreboard players operation $temp pk.dimension.id = @e[type=marker,tag=pk.dimension.marker,distance=..0.1,limit=1] pk.dimension.id

# Set the dimension id
execute store result storage pk.common:data Temp.Waystone.Dimension.id int 1 run scoreboard players get $temp pk.dimension.id