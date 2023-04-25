#> pk_waystones:blocks/waystone/actions/right_click_on_container/search_block/found
# Block has been found

scoreboard players set $found pk.temp 1

execute as @e[type=marker,tag=pk.custom_block.controller,dx=0,limit=1] at @s run function pk_waystones:blocks/waystone/use/on_start/trigger