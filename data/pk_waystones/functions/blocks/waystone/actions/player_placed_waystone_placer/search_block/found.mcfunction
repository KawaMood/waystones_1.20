#> pk_waystones:blocks/waystone/actions/player_placed_waystone_placer/search_block/found
# Block has been found

scoreboard players set $found pk.temp 1

# Store the block data
data modify storage pk.common:data Temp.Block set from block ~ ~ ~

# Check before starting the placement
function pk_waystones:blocks/waystone/place/before/check