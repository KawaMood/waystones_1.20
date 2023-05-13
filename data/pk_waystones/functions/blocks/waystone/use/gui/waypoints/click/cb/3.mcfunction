#> pk_waystones:blocks/waystone/use/gui/waypoints/click/cb/3
# Teleport player

tp @s ~ ~ ~
execute at @s run function pk_waystones:blocks/waystone/use/gui/waypoints/click/player_landing
tag @s remove pk.waystones.teleport_this_tick