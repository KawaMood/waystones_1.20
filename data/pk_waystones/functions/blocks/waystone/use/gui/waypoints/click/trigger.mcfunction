#> pk_waystones:blocks/waystone/use/gui/waypoints/click/trigger

# Turn off command blocks output in chat during the process
execute store success score $gm_command_block_output_state pk.value run gamerule commandBlockOutput false

# Mark the player
tag @a[tag=pk.temp.current,limit=1] add pk.waystones.teleport_this_tick

# Search the clicked waypoint
function pk_waystones:blocks/waystone/use/gui/waypoints/click/search

# Animations (initial point)
execute at @a[tag=pk.temp.current,limit=1] run playsound block.portal.travel player @a[distance=..30,tag=!pk.temp.current] ~ ~ ~ 0.2 1.8
execute at @a[tag=pk.temp.current,limit=1] run particle reverse_portal ~ ~1 ~ 0.5 0.5 0.5 0.001 50

# Prepare
execute in minecraft:overworld run function pk_waystones:blocks/waystone/use/gui/waypoints/click/prepare

# Logs
execute if score $logs.datapack.waystones pk.value matches 1 run tellraw @a[tag=pk.dev] [{"selector":"@a[tag=pk.temp.current,limit=1]","color": "gray"},{"text": " clicked \"waypoint\" button"}]

# After 2 tick
schedule function pk_waystones:blocks/waystone/use/gui/waypoints/click/after_2t 2t