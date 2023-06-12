#> pk_waystones:blocks/waystone/use/gui/waypoints/click/custom_dim/start

# Logs
execute if score $logs.datapack.waystones pk.value matches 1 run tellraw @a[tag=pk.dev] [{"text":"trigger custom dimension process","color":"gray"}]

# Check if the specific chunk that need to stay loaded is loaded 
execute store result score $forceload pk.temp run forceload query -30000000 1611
execute if score $forceload pk.temp matches 0 run forceload add -30000000 1611

# Mark the player
tag @a[tag=pk.temp.current,limit=1] add pk.waystones.teleport_this_tick

# Turn off command blocks output in chat during the process
execute store success score $gamerule.command_block_output.previous_value pk.value run gamerule commandBlockOutput false

# Place sign
setblock -30000000 61 1611 stone
setblock -30000000 62 1611 warped_sign

# Prepare command of CB 3 as a text component
data modify block -30000000 62 1611 front_text.messages[0] set value '[{"text":"execute as @a[tag=pk.waystones.teleport_this_tick,limit=1] in "},{"nbt":"Temp.GUI.Clicked.Waypoint.tag.pkData.Dimension","storage":"pk.common:data"},{"text":" positioned "},{"nbt":"Temp.GUI.Clicked.Waypoint.tag.pkData.x","storage":"pk.common:data"},{"text":" "},{"nbt":"Temp.GUI.Clicked.Waypoint.tag.pkData.y","storage":"pk.common:data"},{"text":" "},{"nbt":"Temp.GUI.Clicked.Waypoint.tag.pkData.z","storage":"pk.common:data"},{"text":" run function pk_waystones:blocks/waystone/use/gui/waypoints/click/custom_dim/cb/3"}]'

# Summon temp armor stand
execute positioned -30000000 0 1611 run summon armor_stand ~ ~ ~ {Tags:["pk.custom_block.uninstaller"],Marker:1b,UUID:[I;1163404890,-122270909,-1667040180,-1462485666],CustomName:'{"text":""}'}
data modify entity 4558265a-f8b6-4b43-9ca2-fc4ca8d43d5e CustomName set from block -30000000 62 1611 front_text.messages[0]

# Prepare command blocks chain
fill -30000000 64 1611 -30000000 66 1611 air
# - CB 1
setblock -30000000 64 1611 command_block[conditional=false,facing=up]{auto:1b,UpdateLastExecution:0b,Command:"enchant 4558265a-f8b6-4b43-9ca2-fc4ca8d43d5e aqua_affinity"} replace
# - CB 2
setblock -30000000 65 1611 chain_command_block[conditional=false,facing=up]{auto:1b,UpdateLastExecution:0b,Command:"function pk_waystones:blocks/waystone/use/gui/waypoints/click/custom_dim/cb/2"} replace
# - CB 3
setblock -30000000 66 1611 chain_command_block[conditional=false,facing=up]{auto:1b,UpdateLastExecution:0b,Command:""} replace

# After 2 tick
schedule function pk_waystones:blocks/waystone/use/gui/waypoints/click/custom_dim/after_2t 2t