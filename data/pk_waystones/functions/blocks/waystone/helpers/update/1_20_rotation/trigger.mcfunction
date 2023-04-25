#> pk_waystones:blocks/waystone/helpers/update/1_20_rotation/trigger

# Prepare score
data modify storage pk.common:data Temp.Waystone set from entity @s data.Waystone
execute store result score $temp pk.custom_block.component.id run data get storage pk.common:data Temp.Waystone.id

# Change item display rotation (180° on Y axis)
execute as @e[type=item_display,tag=pk.waystones,predicate=pk_waystones:scores/custom_block/component_id_matching,distance=..10] run data modify entity @s transformation merge value {right_rotation:[0f,1f,0f,0f]}

# Unload the targeted chunk
forceload remove ~ ~

# Remove the current entity
kill @s