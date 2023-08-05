#> pk_waystones:blocks/waystone/use/gui/waypoints/click/vanilla_dim/marker_prepare

# Relocate marker to Waystone
data modify storage pk.common:data Temp.Pos set value [0d,0d,0d]
execute store result storage pk.common:data Temp.Pos[0] double 1 run data get storage pk.common:data Temp.GUI.Clicked.Waypoint.tag.pkData.x
execute store result storage pk.common:data Temp.Pos[1] double 1 run data get storage pk.common:data Temp.GUI.Clicked.Waypoint.tag.pkData.y
execute store result storage pk.common:data Temp.Pos[2] double 1 run data get storage pk.common:data Temp.GUI.Clicked.Waypoint.tag.pkData.z
data modify entity @s Pos set from storage pk.common:data Temp.Pos

# Teleport player
execute unless score $has_vehicle pk.temp matches 0 run tp @e[tag=pk.temp.current.vehicle,limit=1] @s
tp @a[tag=pk.temp.current,limit=1] @s
execute as @a[tag=pk.temp.current,limit=1] at @s align xyz positioned ~0.5 ~ ~0.5 run function pk_waystones:blocks/waystone/use/gui/waypoints/click/player_landing

# Remove marker
kill @s