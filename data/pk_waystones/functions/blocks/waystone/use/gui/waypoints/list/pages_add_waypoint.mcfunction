#> pk_waystones:blocks/waystone/use/gui/waypoints/list/pages_add_waypoint

# Set slot
execute store result storage pk.common:data Temp.Waystones[0].Waypoint.Slot byte 1 run scoreboard players get $item.slot pk.temp
scoreboard players add $item.slot pk.temp 1

# Set Waypoint item form
data modify storage pk.common:data Temp.Loop.i.Page append from storage pk.common:data Temp.Waystones[0].Waypoint

# Increase amount of Waypoints in page
scoreboard players add $waypoints_amount_in_page pk.temp 1