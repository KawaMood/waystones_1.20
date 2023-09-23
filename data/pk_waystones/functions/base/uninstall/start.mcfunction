#> pk_waystones:base/uninstall/start
# Uninstall the data pack and remove the common features if there is no KawaMood data pack installed anymore

# Tag player
tag @s add pk.uninstaller

# Prepare the list of elements to remove and the list of chunks where these elements are
data remove storage pk.common:data Uninstall
data modify storage pk.common:data Uninstall.Elements set value []
data modify storage pk.common:data Uninstall.Chunks set value []

# Specific: Append Attempt Blocks
data modify storage pk.common:data Uninstall.Elements append from storage pk.waystones:data Blocks.Waystones[]

# Create list of chunks
execute if data storage pk.common:data Uninstall.Elements[{}] run function pk_waystones:base/uninstall/chunks_list_create_recursive

# Run the uninstalling process if chunks have been found, otherwise, end the process
scoreboard players set $uninstall.remaining_chunks pk.value 0
scoreboard players set $uninstall.remaining_markers pk.value 0
execute store result score $uninstall.remaining_chunks pk.value run data get storage pk.common:data Uninstall.Chunks
execute if score $uninstall.remaining_chunks pk.value matches 0 run function pk_waystones:base/uninstall/stop
# - Placing markers in each retained chunks
execute if score $uninstall.remaining_chunks pk.value matches 1.. run function pk_waystones:base/uninstall/chunk_place_marker_recursive
# - Processing markers
execute if score $uninstall.remaining_markers pk.value matches 1.. run function pk_waystones:base/uninstall/markers_check_chunks_state