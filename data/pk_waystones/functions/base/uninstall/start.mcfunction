#> pk_waystones:base/uninstall/start
# Uninstall the data pack and remove the common feature if there is no PK data pack installed anymore

# Remove all placed custom blocks
# Will need to be searched within all dimensions
data remove storage pk.common:data Temp
data modify storage pk.common:data Temp.Array.Search set value []
# - Append Waystones
data modify storage pk.common:data Temp.Array.Search append from storage pk.waystones:data Blocks.Waystones[]
# - Forceload chunks where custom blocks are, then wait 10 ticks for the chunk to be fully loaded
execute if data storage pk.common:data Temp.Array.Search[{}] run function pk_waystones:base/uninstall/forceload_custom_blocks_chunks

# 10 ticks after
schedule function pk_waystones:base/uninstall/after_10_ticks 10t