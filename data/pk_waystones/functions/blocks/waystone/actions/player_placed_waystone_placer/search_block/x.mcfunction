#> pk_waystones:blocks/waystone/actions/player_placed_waystone_placer/search_block/x
# Recursively search on the X axis

scoreboard players set $y pk.temp 10
function pk_waystones:blocks/waystone/actions/player_placed_waystone_placer/search_block/y
scoreboard players remove $x pk.temp 1
execute if score $found pk.temp matches 0 if score $x pk.temp matches 1.. positioned ~1 ~ ~ run function pk_waystones:blocks/waystone/actions/player_placed_waystone_placer/search_block/x