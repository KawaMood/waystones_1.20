#> pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/marker_initialize

# Tag the current marker
tag @s add pk.waystones.update.forceload_chunk

# Set data from current item
data modify entity @s data.Waystone set from storage pk.common:data Temp.Array.Item

# Place entity at the right position
data modify storage pk.common:data Temp.Array.Item.Pos set value [0d,0d,0d]
execute store result storage pk.common:data Temp.Array.Item.Pos[0] double 1 run data get storage pk.common:data Temp.Array.Item.x
execute store result storage pk.common:data Temp.Array.Item.Pos[1] double 1 run data get storage pk.common:data Temp.Array.Item.y
execute store result storage pk.common:data Temp.Array.Item.Pos[2] double 1 run data get storage pk.common:data Temp.Array.Item.z
data modify entity @s Pos set from storage pk.common:data Temp.Array.Item.Pos

# Relocate the execution depending on the dimension
execute store result score $temp pk.dimension.id run data get storage pk.common:data Temp.Array.Item.Dimension.id
execute if score $temp pk.dimension.id matches -1 in minecraft:the_nether positioned as @s run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/forceload_custom_block_chunk
execute if score $temp pk.dimension.id matches 0 in minecraft:overworld positioned as @s run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/forceload_custom_block_chunk
execute if score $temp pk.dimension.id matches 1 in minecraft:the_end positioned as @s run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/forceload_custom_block_chunk
execute if score $temp pk.dimension.id matches 100.. at @e[type=marker,tag=pk.dimension.marker,predicate=pk_waystones:scores/dimension_marker/matching_id] positioned as @s run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/forceload_custom_block_chunk