#> pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/cb_3

# Logs
tellraw @a[tag=pk.updater] [{"text":"Loading chunk in ","color":"gray"},{"nbt":"Update.Chunk.Dimension","storage":"pk.common:data"},{"text": " at ["},{"nbt":"Update.Chunk.x","storage":"pk.common:data"},{"text":","},{"nbt":"Update.Chunk.z","storage":"pk.common:data"},{"text": "]"}]

# check if the chunk was already forceloaded, otherwise, forceload it
execute store result score $forceload pk.temp run forceload query ~ ~
execute if score $forceload pk.temp matches 0 run forceload add ~ ~

# Prepare the uninstall marker
execute summon marker run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/marker_initialize

# Start process in the current chunk
function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/chunk_check_state_recursive