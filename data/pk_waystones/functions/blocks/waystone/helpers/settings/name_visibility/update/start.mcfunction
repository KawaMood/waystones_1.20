#> pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/start
# Update the data pack and remove the common feature if there is no KawaMood data pack installed anymore

# Tag player
tag @s add pk.updater

# Turn off command blocks output in chat during the process
execute store success score $gamerule.command_block_output.previous_value pk.value run gamerule commandBlockOutput false

# Check if the specific chunk that need to stay loaded is loaded 
execute store result score $forceload pk.temp run forceload query -30000000 1611
execute if score $forceload pk.temp matches 0 run forceload add -30000000 1611

# Prepare the list of elements to update and the list of chunks where these elements are
data remove storage pk.common:data Update
data modify storage pk.common:data Update.Elements set value []
data modify storage pk.common:data Update.Chunks set value []

# Specific: Append Attempt Blocks
data modify storage pk.common:data Update.Elements append from storage pk.waystones:data Blocks.Waystones[]

# Create list of chunks
execute if data storage pk.common:data Update.Elements[{}] run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/chunks_list_create_recursive

# Prepare command blocks chain recursively
execute store result score $update.remaining_chunks pk.value run data get storage pk.common:data Update.Chunks
execute if score $update.remaining_chunks pk.value matches 0 run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/stop
execute if score $update.remaining_chunks pk.value matches 1.. run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/cbs_prepare_recursive