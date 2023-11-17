#> pk_waystones:blocks/waystone/use/gui/waypoints/click/vehicle/player_has_vehicle

# Increment scores
scoreboard players set $has_vehicle pk.temp 1

# Tag vehicle and passengers
tag @s add pk.temp.current.vehicle
tag @s add pk.waystones.vehicle
execute on passengers run tag @s add pk.temp.current.passenger
execute on passengers run tag @s add pk.waystones.passenger

# Link vehicle and passengers
scoreboard players operation @e[tag=pk.temp.current.vehicle] pk.waystones.link = $next pk.waystones.link
scoreboard players operation @e[tag=pk.temp.current.passenger] pk.waystones.link = $next pk.waystones.link