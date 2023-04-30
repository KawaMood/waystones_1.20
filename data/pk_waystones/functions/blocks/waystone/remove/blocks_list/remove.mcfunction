#> pk_waystones:blocks/waystone/remove/blocks_list/remove
# Remove the current Waystone from the pk.waystones:data Blocks.Waystones storage

data remove storage pk.common:data Temp.Array
data modify storage pk.common:data Temp.Array.Search set from storage pk.waystones:data Blocks.Waystones
data modify storage pk.common:data Temp.Array.New set value []
function pk_waystones:blocks/waystone/remove/blocks_list/remove_recursive

data remove storage pk.waystones:data Blocks.Waystones
data modify storage pk.waystones:data Blocks.Waystones set from storage pk.common:data Temp.Array.New