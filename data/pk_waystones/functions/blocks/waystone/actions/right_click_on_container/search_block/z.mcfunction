#> pk_waystones:blocks/waystone/actions/right_click_on_container/search_block/z
# Recursively search on the Z axis

execute if block ~ ~ ~ barrel[open=true]{Items:[{tag:{pkWaystone:1b,pkInUse:0b}}]} run function pk_waystones:blocks/waystone/actions/right_click_on_container/search_block/found
scoreboard players remove $z pk.temp 1
execute if score $found pk.temp matches 0 if score $z pk.temp matches 1.. positioned ~ ~ ~1 run function pk_waystones:blocks/waystone/actions/right_click_on_container/search_block/z