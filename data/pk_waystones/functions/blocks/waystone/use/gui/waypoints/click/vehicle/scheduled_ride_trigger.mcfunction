#> pk_waystones:blocks/waystone/use/gui/waypoints/click/vehicle/scheduled_ride_trigger

# Make passengers ride vehicle
scoreboard players operation $temp pk.waystones.link = @s pk.waystones.link
tp @e[tag=pk.waystones.vehicle,predicate=pk_waystones:scores/link/match,distance=..10,limit=1] ~ ~ ~
execute as @e[tag=pk.waystones.passenger,predicate=pk_waystones:scores/link/match,distance=..10] run ride @s mount @e[tag=pk.waystones.vehicle,predicate=pk_waystones:scores/link/match,distance=..10,limit=1]

# Remove tags
tag @e[tag=pk.waystones.vehicle,predicate=pk_waystones:scores/link/match,distance=..10,limit=1] remove pk.waystones.vehicle
tag @e[tag=pk.waystones.passenger,predicate=pk_waystones:scores/link/match,distance=..10] remove pk.waystones.passenger