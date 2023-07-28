#> pk_waystones:blocks/waystone/use/gui/waypoints/list/pages_add_waypoint

# Set slot
execute store result storage pk.common:data Temp.Waystones[0].Waypoint.Slot byte 1 run scoreboard players get $item.slot pk.temp
scoreboard players add $item.slot pk.temp 1

# Waypoint settings:
# - Hide coordinates
execute if entity @a[tag=pk.temp.current,distance=..10,limit=1,scores={pk.waystones.player.setting.hide_coordinates=1..}] run data modify storage pk.common:data Temp.Waystones[0].Waypoint.tag.display.Lore set value []
# - Show Id
setblock ~ ~-1 ~ oak_sign{front_text:{messages:['[{"text":"id: ","color":"dark_gray","italic":false},{"nbt":"Temp.Waystones[0].id","storage":"pk.common:data"}]','{"text":""}','{"text":""}','{"text":""}']}}
execute if entity @a[tag=pk.temp.current,tag=pk.waystones.manager,distance=..10,limit=1] run data modify storage pk.common:data Temp.Waystones[0].Waypoint.tag.display.Lore append from block ~ ~-1 ~ front_text.messages[0] 
setblock ~ ~-1 ~ barrier

# Set Waypoint item form
data modify storage pk.common:data Temp.Loop.i.Page append from storage pk.common:data Temp.Waystones[0].Waypoint

# Increase amount of Waypoints in page
scoreboard players add $waypoints_amount_in_page pk.temp 1