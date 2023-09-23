#> pk_waystones:base/uninstall/chunk_place_marker_recursive

# Prepare data to place marker
data modify storage pk.common:data Params.dimension set from storage pk.common:data Uninstall.Chunks[-1].Dimension
data modify storage pk.common:data Params.x set from storage pk.common:data Uninstall.Chunks[-1].x
data modify storage pk.common:data Params.z set from storage pk.common:data Uninstall.Chunks[-1].z
function pk_waystones:base/uninstall/chunk_place_marker with storage pk.common:data Params

# Recursive call
data remove storage pk.common:data Uninstall.Chunks[-1]
scoreboard players remove $uninstall.remaining_chunks pk.value 1
execute if score $uninstall.remaining_chunks pk.value matches 1.. run function pk_waystones:base/uninstall/chunk_place_marker_recursive