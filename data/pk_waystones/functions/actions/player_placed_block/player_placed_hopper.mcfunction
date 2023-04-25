#> pk_waystones:actions/player_placed_block/player_placed_hopper

# Revoke advancement
advancement revoke @s only pk_waystones:interactions/placed_hopper

# Check if player placed dropper next to a Waystone (middle)
execute as @e[type=marker,tag=pk.waystones.waystone.controller,distance=..11] at @s run function pk_waystones:blocks/waystone/environment/blocks/verify_hoppers