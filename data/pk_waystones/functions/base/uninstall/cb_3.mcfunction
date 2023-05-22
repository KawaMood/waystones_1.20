#> pk_waystones:base/uninstall/cb_3

# Logs
tellraw @a[tag=pk.uninstaller] [{"text":"Loading chunk in ","color":"gray"},{"nbt":"Uninstall.Chunk.Dimension","storage":"pk.common:data"},{"text": " at ["},{"nbt":"Uninstall.Chunk.x","storage":"pk.common:data"},{"text":","},{"nbt":"Uninstall.Chunk.z","storage":"pk.common:data"},{"text": "]"}]

# check if the chunk was already forceloaded, otherwise, forceload it
execute store result score $forceload pk.temp run forceload query ~ ~
execute if score $forceload pk.temp matches 0 run forceload add ~ ~

# Prepare the uninstall marker
execute summon marker run function pk_waystones:base/uninstall/marker_initialize

# Start process in the current chunk
function pk_waystones:base/uninstall/chunk_check_state_recursive