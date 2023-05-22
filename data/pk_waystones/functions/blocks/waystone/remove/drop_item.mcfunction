#> pk_waystones:blocks/waystone/remove/drop_item

scoreboard players set $drop_with_current_tag pk.temp 1
scoreboard players set $drop_with_random_motion pk.temp 1
execute positioned ~ ~-0.5 ~ if data storage pk.common:data Temp.Waystone{Type:"regular"} run function pk_waystones:blocks/waystone/helpers/drop/regular
execute positioned ~ ~-0.5 ~ if data storage pk.common:data Temp.Waystone{Type:"sand"} run function pk_waystones:blocks/waystone/helpers/drop/sand
execute positioned ~ ~-0.5 ~ if data storage pk.common:data Temp.Waystone{Type:"nether"} run function pk_waystones:blocks/waystone/helpers/drop/nether
execute positioned ~ ~-0.5 ~ if data storage pk.common:data Temp.Waystone{Type:"deepslate"} run function pk_waystones:blocks/waystone/helpers/drop/deepslate