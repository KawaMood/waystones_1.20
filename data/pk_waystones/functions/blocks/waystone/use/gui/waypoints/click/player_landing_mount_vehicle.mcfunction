#> pk_waystones:blocks/waystone/use/gui/waypoints/click/player_landing_mount_vehicle

tp @e[tag=pk.temp.current.vehicle,limit=1] @s
ride @s mount @e[tag=pk.temp.current.vehicle,limit=1,distance=..0.1]
tag @e[tag=pk.temp.current.vehicle,limit=1] remove pk.temp.current.vehicle