#> pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/start
# Uninstall the data pack and remove the common features if there is no KawaMood data pack installed anymore

# Tag player
tag @s add pk.updater

# Prepare the list of elements to remove and the list of chunks where these elements are
data remove storage pk.common:data Update
data modify storage pk.common:data Update.Elements set value []
data modify storage pk.common:data Update.Chunks set value []

# Specific: Append Attempt Blocks
data modify storage pk.common:data Update.Elements append from storage pk.waystones:data Blocks.Waystones[]

# Create list of chunks
execute if data storage pk.common:data Update.Elements[{}] run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/chunks_list_create_recursive

# Run the uninstalling process if chunks have been found, otherwise, end the process
scoreboard players set $update.remaining_chunks pk.value 0
scoreboard players set $update.remaining_markers pk.value 0
execute store result score $update.remaining_chunks pk.value run data get storage pk.common:data Update.Chunks
execute if score $update.remaining_chunks pk.value matches 0 run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/stop
# - Placing markers in each retained chunks
execute if score $update.remaining_chunks pk.value matches 1.. run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/chunk_place_marker_recursive
# - Processing markers
execute if score $update.remaining_markers pk.value matches 1.. run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/markers_check_chunks_state