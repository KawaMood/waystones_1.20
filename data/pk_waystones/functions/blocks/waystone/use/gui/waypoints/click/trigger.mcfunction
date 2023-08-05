#> pk_waystones:blocks/waystone/use/gui/waypoints/click/trigger

# Logs
execute if score $logs.datapack.waystones pk.value matches 1 run tellraw @a[tag=pk.dev] [{"selector":"@a[tag=pk.temp.current,limit=1]","color": "gray"},{"text": " clicked \"waypoint\" button"}]

# Search for player's vehicle
scoreboard players set $has_vehicle pk.temp 0
execute if score $pk.waystones.settings.keep_vehicle_on_tp pk.value matches 1 as @a[tag=pk.temp.current,limit=1] on vehicle if entity @s run function pk_waystones:blocks/waystone/use/gui/waypoints/click/player_has_vehicle

# Search the clicked waypoint
function pk_waystones:blocks/waystone/use/gui/waypoints/click/search

# Animations (initial point)
execute at @a[tag=pk.temp.current,limit=1] run playsound block.portal.travel player @a[distance=..30,tag=!pk.temp.current] ~ ~ ~ 0.2 1.8
execute at @a[tag=pk.temp.current,limit=1] run particle reverse_portal ~ ~1 ~ 0.5 0.5 0.5 0.001 50

data modify storage pk.common:data Backup.GUI set from storage pk.common:data Temp.GUI

# Prepare: Process for vanilla dimension
scoreboard players set $process_started pk.temp 0
execute if data storage pk.common:data Temp.GUI.Clicked.Waypoint.tag.pkData{Dimension:"minecraft:overworld"} in minecraft:overworld run function pk_waystones:blocks/waystone/use/gui/waypoints/click/vanilla_dim/start
execute if score $process_started pk.temp matches 0 if data storage pk.common:data Temp.GUI.Clicked.Waypoint.tag.pkData{Dimension:"minecraft:the_nether"} in minecraft:the_nether run function pk_waystones:blocks/waystone/use/gui/waypoints/click/vanilla_dim/start
execute if score $process_started pk.temp matches 0 if data storage pk.common:data Temp.GUI.Clicked.Waypoint.tag.pkData{Dimension:"minecraft:the_end"} in minecraft:the_end run function pk_waystones:blocks/waystone/use/gui/waypoints/click/vanilla_dim/start
# Prepare: Process for custom dimension
execute if score $process_started pk.temp matches 0 in minecraft:overworld run function pk_waystones:blocks/waystone/use/gui/waypoints/click/custom_dim/start