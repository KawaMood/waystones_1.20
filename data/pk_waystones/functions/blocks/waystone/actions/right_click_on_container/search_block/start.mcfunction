#> pk_waystones:blocks/waystone/actions/right_click_on_container/search_block/start
# Start to search the block recursively in a 10x10x10 area around the player

scoreboard players set $x pk.temp 10
scoreboard players set $found pk.temp 0
execute align xyz positioned ~-5 ~-5 ~-5 run function pk_waystones:blocks/waystone/actions/right_click_on_container/search_block/x