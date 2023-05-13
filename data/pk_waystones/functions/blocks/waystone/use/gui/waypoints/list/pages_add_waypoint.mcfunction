#> pk_waystones:blocks/waystone/use/gui/waypoints/list/pages_add_waypoint

# Set slot
execute store result storage pk.common:data Temp.Waystones[0].Waypoint.Slot byte 1 run scoreboard players get $item.slot pk.temp
scoreboard players add $item.slot pk.temp 1

# Hide coordinate
#execute if entity @a[tag=pk.temp.current,distance=..10,limit=1,scores={pk.waystones.player.setting.hide_coordinates=1..}] run data remove storage pk.common:data Temp.Waystones[0].Waypoint.display.Lore

# Set Waypoint item form
data modify storage pk.common:data Temp.Loop.i.Page append from storage pk.common:data Temp.Waystones[0].Waypoint

# Increase amount of Waypoints in page
scoreboard players add $waypoints_amount_in_page pk.temp 1