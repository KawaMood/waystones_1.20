#> pk_waystones:blocks/waystone/actions/player_placed_waystone_placer/search_block/z
# Recursively search on the Z axis

execute if block ~ ~ ~ #pk_waystones:player_heads{SkullOwner:{Id:[I;16,11,3,2],Name:"%pk.custom_block.waystone"}} run function pk_waystones:blocks/waystone/actions/player_placed_waystone_placer/search_block/found
scoreboard players remove $z pk.temp 1
execute if score $found pk.temp matches 0 if score $z pk.temp matches 1.. positioned ~ ~ ~1 run function pk_waystones:blocks/waystone/actions/player_placed_waystone_placer/search_block/z