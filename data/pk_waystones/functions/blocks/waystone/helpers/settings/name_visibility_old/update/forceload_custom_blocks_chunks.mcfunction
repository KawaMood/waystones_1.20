#> pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/forceload_custom_blocks_chunks

# If the component id of the current item matches the component id of the block to remove, don't prepend it to the new array
data modify storage pk.common:data Temp.Array.Item set from storage pk.common:data Temp.Array.Search[-1]

execute summon marker run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/marker_initialize

# Recursive call
data remove storage pk.common:data Temp.Array.Search[-1]
execute if data storage pk.common:data Temp.Array.Search[{}] run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/forceload_custom_blocks_chunks