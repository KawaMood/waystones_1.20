# Check if the specific chunk that need to stay loaded is loaded 
execute store result score $forceload pk.temp run forceload query -3000 1611
execute if score $forceload pk.temp matches 0 run forceload add -3000 1611

# Place sign
setblock -3000 61 1611 stone
setblock -3000 62 1611 warped_sign

# Prepare command of CB 3 as a text component
data modify block -3000 62 1611 front_text.messages[0] set value '[{"text":"execute as @a[tag=pk.waystones.teleport_this_tick,limit=1] in "},{"nbt":"Temp.GUI.Clicked.Waypoint.tag.pkData.Dimension","storage":"pk.common:data"},{"text":" positioned "},{"nbt":"Temp.GUI.Clicked.Waypoint.tag.pkData.x","storage":"pk.common:data"},{"text":" "},{"nbt":"Temp.GUI.Clicked.Waypoint.tag.pkData.y","storage":"pk.common:data"},{"text":" "},{"nbt":"Temp.GUI.Clicked.Waypoint.tag.pkData.z","storage":"pk.common:data"},{"text":" run function pk_waystones:blocks/waystone/use/gui/waypoints/click/cb/3"}]'

# Summon temp armor stand
execute positioned -3000 0 1611 run summon armor_stand ~ ~ ~ {Tags:["pk.custom_block.uninstaller"],Marker:1b,UUID:[I;1163404890,-122270909,-1667040180,-1462485666],CustomName:'{"text":""}'}
data modify entity 4558265a-f8b6-4b43-9ca2-fc4ca8d43d5e CustomName set from block -3000 62 1611 front_text.messages[0]

# Prepare command blocks chain
fill -3000 64 1611 -3000 66 1611 air
# - CB 1
setblock -3000 64 1611 command_block[conditional=false,facing=up]{auto:1b,UpdateLastExecution:0b,Command:"enchant 4558265a-f8b6-4b43-9ca2-fc4ca8d43d5e aqua_affinity"} replace
# - CB 2
setblock -3000 65 1611 chain_command_block[conditional=false,facing=up]{auto:1b,UpdateLastExecution:0b,Command:"function pk_waystones:blocks/waystone/use/gui/waypoints/click/cb/2"} replace
# - CB 3
setblock -3000 66 1611 chain_command_block[conditional=false,facing=up]{auto:1b,UpdateLastExecution:0b,Command:""} replace