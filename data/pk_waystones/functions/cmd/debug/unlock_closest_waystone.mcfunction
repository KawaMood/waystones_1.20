#> pk_waystones:cmd/debug/unlock_closest_waystone
# Help operators to force the closest Waystone to close

execute as @e[type=marker,tag=pk.waystones.waystone.controller,limit=1,sort=nearest] at @s run function pk_waystones:blocks/waystone/use/on_stop/trigger