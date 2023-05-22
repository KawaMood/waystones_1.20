#> pk_waystones:base/uninstall/marker_initialize

tag @s add pk.uninstall

execute store result entity @s data.WasForceloaded byte 1 run scoreboard players get $forceload pk.temp