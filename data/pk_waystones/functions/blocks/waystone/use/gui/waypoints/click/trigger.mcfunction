#> pk_waystones:blocks/waystone/use/gui/waypoints/click/trigger

# Logs
execute if score $logs.datapack.waystones pk.value matches 1 run tellraw @a[tag=pk.dev] [{"selector":"@a[tag=pk.temp.current,limit=1]","color": "gray"},{"text": " clicked \"waypoint\" button"}]

# Search for player's vehicle and leashed mobs
scoreboard players add $next pk.waystones.link 1
scoreboard players operation @a[tag=pk.temp.current,limit=1] pk.waystones.link = $next pk.waystones.link
scoreboard players set $has_vehicle pk.temp 0
scoreboard players set $has_leashed_mobs pk.temp 0
data remove storage pk.common:data Params
data modify storage pk.common:data Params.UUID set from entity @a[tag=pk.temp.current,limit=1] UUID
execute if score $pk.waystones.settings.grouped_tp pk.value matches 1 run function pk_waystones:blocks/waystone/use/gui/waypoints/click/leashed_mobs/search with storage pk.common:data Params
execute if score $pk.waystones.settings.grouped_tp pk.value matches 1 as @a[tag=pk.temp.current,limit=1] on vehicle if entity @s run function pk_waystones:blocks/waystone/use/gui/waypoints/click/vehicle/player_has_vehicle

# Search the clicked waypoint
function pk_waystones:blocks/waystone/use/gui/waypoints/click/search

# Animations (initial point)
execute at @a[tag=pk.temp.current,limit=1] run playsound block.portal.travel player @a[distance=..30,tag=!pk.temp.current] ~ ~ ~ 0.2 1.8
execute at @a[tag=pk.temp.current,limit=1] run particle reverse_portal ~ ~1 ~ 0.5 0.5 0.5 0.001 50

# Prepare: Process for all dimensions
data remove storage pk.common:data Params
data modify storage pk.common:data Params.dimension set from storage pk.common:data Temp.GUI.Clicked.Waypoint.tag.pkData.Dimension
data modify storage pk.common:data Params.x set from storage pk.common:data Temp.GUI.Clicked.Waypoint.tag.pkData.x
data modify storage pk.common:data Params.y set from storage pk.common:data Temp.GUI.Clicked.Waypoint.tag.pkData.y
data modify storage pk.common:data Params.z set from storage pk.common:data Temp.GUI.Clicked.Waypoint.tag.pkData.z
function pk_waystones:blocks/waystone/use/gui/waypoints/click/teleport_start with storage pk.common:data Params