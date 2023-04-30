#> pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/in_custom_dimension/start

# Add tag
tag @s add pk.in_custom_dimension

# Store the target coordinates
data modify storage pk.common:data Temp.Pos set value [0d,0d,0d]
execute store result storage pk.common:data Temp.Pos[0] double 1 run data get storage pk.common:data Temp.Array.Item.x
execute store result storage pk.common:data Temp.Pos[1] double 1 run data get storage pk.common:data Temp.Array.Item.y
execute store result storage pk.common:data Temp.Pos[2] double 1 run data get storage pk.common:data Temp.Array.Item.z
data modify entity @s data.Pos set from storage pk.common:data Temp.Pos

# Relocate the marker to the dimension marker
tp @s @e[type=marker,tag=pk.dimension.marker,predicate=pk_waystones:scores/dimension_marker/matching_id,limit=1]

# Wait 1 tick before relocating to the right position
schedule function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/in_custom_dimension/after_1t 1t