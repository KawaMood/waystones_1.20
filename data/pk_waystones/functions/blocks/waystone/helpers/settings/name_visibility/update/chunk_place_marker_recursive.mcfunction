#> pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/chunk_place_marker_recursive

# Prepare data to place marker
data modify storage pk.common:data Params.dimension set from storage pk.common:data Update.Chunks[-1].Dimension
data modify storage pk.common:data Params.x set from storage pk.common:data Update.Chunks[-1].x
data modify storage pk.common:data Params.z set from storage pk.common:data Update.Chunks[-1].z
function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/chunk_place_marker with storage pk.common:data Params

# Recursive call
data remove storage pk.common:data Update.Chunks[-1]
scoreboard players remove $update.remaining_chunks pk.value 1
execute if score $update.remaining_chunks pk.value matches 1.. run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/chunk_place_marker_recursive