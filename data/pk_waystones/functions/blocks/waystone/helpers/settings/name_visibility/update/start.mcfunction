#> pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/start
# Uninstall the data pack and remove the common feature if there is no PK data pack installed anymore

# Remove all placed custom blocks
# Will need to be searched within all dimensions
data remove storage pk.common:data Temp.Array
data modify storage pk.common:data Temp.Array.Search set value []
# - Append Custom Blocks
data modify storage pk.common:data Temp.Array.Search append from storage pk.waystones:data Blocks.Waystones[]
# - Forceload chunks where custom blocks are, then wait for the chunk to be fully loaded
execute if data storage pk.common:data Temp.Array.Search[{}] run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/marker_summon_recursive

# Delayed process, assuming the chunk is fully loaded after the delay
schedule function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/after_1s_search 1s