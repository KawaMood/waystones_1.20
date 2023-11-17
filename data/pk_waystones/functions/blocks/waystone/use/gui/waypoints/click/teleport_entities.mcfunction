#> pk_waystones:blocks/waystone/use/gui/waypoints/click/teleport_entities

# Teleport player and potential vehicle and its passengers
execute unless score $has_vehicle pk.temp matches 0 run tp @e[tag=pk.temp.current.vehicle,limit=1] ~ ~2 ~
execute unless score $has_vehicle pk.temp matches 0 run tp @e[type=!player,tag=pk.temp.current.passenger] ~ ~2 ~
execute align xyz positioned ~0.5 ~0.5 ~0.5 as @a[tag=pk.temp.current,limit=1] run function pk_waystones:blocks/waystone/use/gui/waypoints/click/player_landing

# Remove tags from entities
execute unless score $has_vehicle pk.temp matches 0 run tag @e[tag=pk.temp.current.passenger] remove pk.temp.current.passenger
execute unless score $has_vehicle pk.temp matches 0 run tag @e[tag=pk.temp.current.vehicle,limit=1] remove pk.temp.current.vehicle
execute unless score $has_leashed_mobs pk.temp matches 0 run tag @e[tag=pk.temp.current.leashed] remove pk.temp.current.leashed