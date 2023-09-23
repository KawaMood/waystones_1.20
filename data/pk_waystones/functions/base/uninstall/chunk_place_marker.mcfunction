#> pk_waystones:base/uninstall/chunk_place_marker

# check if the chunk was already forceloaded, otherwise, forceload it
$execute in $(dimension) store result score $forceload pk.temp run forceload query $(x) $(z)
$execute if score $forceload pk.temp matches 0 in $(dimension) run forceload add $(x) $(z)

# Prepare the uninstall marker
$execute in $(dimension) positioned $(x) ~ $(z) summon marker run function pk_waystones:base/uninstall/marker_initialize

# Increment the amount of uninstall markers
scoreboard players add $uninstall.remaining_markers pk.value 1