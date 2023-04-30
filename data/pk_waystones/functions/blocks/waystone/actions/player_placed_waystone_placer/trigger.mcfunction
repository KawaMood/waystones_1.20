#> pk_waystones:blocks/waystone/actions/player_placed_waystone_placer/trigger
# Player placed a {Waystone:1b} player head block
#@within advancement pk_waystones:interactions/placed_waystone

# Revoke advancement
advancement revoke @s only pk_waystones:interactions/placed_waystone_placer

# Store item data the player used to place the Waystone
data remove storage pk.common:data Temp.Item
data modify storage pk.common:data Temp.Item set from entity @s SelectedItem

# Search the placed waystone
tag @s add pk.temp.current
function pk_waystones:blocks/waystone/actions/player_placed_waystone_placer/search_block/start
tag @s remove pk.temp.current