#> pk_waystones:blocks/waystone/use/gui/waypoints/click/custom_dim/cb/3
# Teleport player

tp @s ~ ~ ~
execute at @s align xyz positioned ~0.5 ~ ~0.5 run function pk_waystones:blocks/waystone/use/gui/waypoints/click/player_landing
tag @s remove pk.waystones.teleport_this_tick