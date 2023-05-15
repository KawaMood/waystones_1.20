#> pk_waystones:base/uninstall/recursive

# Store the current item
data modify storage pk.common:data Uninstall.Array.Item set from storage pk.common:data Uninstall.Array.Search[-1]

# Prepare command of CB 3 as a text component
data modify block -30000000 62 1611 front_text.messages[0] set value '[{"text":"execute in "},{"nbt":"Uninstall.Array.Item.Dimension","storage":"pk.common:data"},{"text":" positioned "},{"nbt":"Uninstall.Array.Item.x","storage":"pk.common:data"},{"text":" "},{"nbt":"Uninstall.Array.Item.y","storage":"pk.common:data"},{"text":" "},{"nbt":"Uninstall.Array.Item.z","storage":"pk.common:data"},{"text":" run function pk_waystones:base/uninstall/cb/3"}]'

# Summon temp armor stand
summon armor_stand -30000000 0 1611 {Tags:["pk.custom_block.uninstaller"],Marker:1b,UUID:[I;1163404890,-122270909,-1667040180,-1462485666],CustomName:'{"text":""}'}
data modify entity 4558265a-f8b6-4b43-9ca2-fc4ca8d43d5e CustomName set from block -30000000 62 1611 front_text.messages[0]

# Prepare command blocks chain
fill -30000000 64 1611 -30000000 66 1611 air
# - CB 1
setblock -30000000 64 1611 command_block[conditional=false,facing=up]{auto:1b,UpdateLastExecution:0b,Command:"enchant 4558265a-f8b6-4b43-9ca2-fc4ca8d43d5e aqua_affinity"} replace
# - CB 2
setblock -30000000 65 1611 chain_command_block[conditional=false,facing=up]{auto:1b,UpdateLastExecution:0b,Command:"function pk_waystones:base/uninstall/cb/2"} replace
# - CB 3
setblock -30000000 66 1611 chain_command_block[conditional=false,facing=up]{auto:1b,UpdateLastExecution:0b,Command:""} replace

# Recursive call or stop the process
data remove storage pk.common:data Uninstall.Array.Search[-1]
execute unless data storage pk.common:data Uninstall.Array.Search[{}] run schedule function pk_waystones:base/uninstall/stop 41t
execute if data storage pk.common:data Uninstall.Array.Search[{}] run schedule function pk_waystones:base/uninstall/recursive 2t