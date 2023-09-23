#> pk_waystones:blocks/waystone/use/gui/waypoints/click/trigger

# Logs
execute if score $logs.datapack.waystones pk.value matches 1 run tellraw @a[tag=pk.dev] [{"selector":"@a[tag=pk.temp.current,limit=1]","color": "gray"},{"text": " clicked \"waypoint\" button"}]

# Search the clicked waypoint
function pk_waystones:blocks/waystone/use/gui/waypoints/click/search

# Animations (initial point)
execute at @a[tag=pk.temp.current,limit=1] run playsound block.portal.travel player @a[distance=..30,tag=!pk.temp.current] ~ ~ ~ 0.2 1.8
execute at @a[tag=pk.temp.current,limit=1] run particle reverse_portal ~ ~1 ~ 0.5 0.5 0.5 0.001 50

data modify storage pk.common:data Backup.GUI set from storage pk.common:data Temp.GUI

# Prepare: Process for all dimensions
data modify storage pk.common:data Params.dimension set from storage pk.common:data Temp.GUI.Clicked.Waypoint.tag.pkData.Dimension
function pk_waystones:blocks/waystone/use/gui/waypoints/click/teleport_start with storage pk.common:data Params