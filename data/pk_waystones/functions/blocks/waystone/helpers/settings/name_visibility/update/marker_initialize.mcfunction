#> pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/marker_initialize

tag @s add pk.update

execute store result entity @s data.WasForceloaded byte 1 run scoreboard players get $forceload pk.temp