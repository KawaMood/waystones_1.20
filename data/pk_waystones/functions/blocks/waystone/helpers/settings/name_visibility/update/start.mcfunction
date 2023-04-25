#> pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/start
# Update name visibility for all waystones

# Will need to be searched within all dimensions
data remove storage pk.common:data Temp
data modify storage pk.common:data Temp.Array.Search set value []
# - Append Waystones
data modify storage pk.common:data Temp.Array.Search append from storage pk.waystones:data Blocks.Waystones[]
# - Forceload chunks where custom blocks are, then wait 1 second for the chunk to be fully loaded
execute if data storage pk.common:data Temp.Array.Search[{}] run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/forceload_custom_blocks_chunks

# 1 second after
schedule function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/after_1s 1s