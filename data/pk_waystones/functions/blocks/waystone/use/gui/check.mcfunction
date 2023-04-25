#> pk_waystones:blocks/waystone/use/gui/check

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Storage and scores:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

# Reset scores
scoreboard players set $clicked_gui pk.temp 0
scoreboard players set $clicked_menu_button pk.temp 0
scoreboard players set $clicked_waypoint pk.temp 0

# Check if player clicked a GUI item
execute store result score $clicked_gui pk.temp run clear @a[tag=pk.temp.current,limit=1] #pk_waystones:all{pkGUI:1b} 0

# Store current and previous content of the GUI
data remove storage pk.common:data Temp.GUI.Prev.Content 
data remove storage pk.common:data Temp.GUI.Content
data modify storage pk.common:data Temp.GUI.Prev.Content set from entity @s data.GUI.Prev.Content
data modify storage pk.common:data Temp.GUI.Content set from block ~ ~ ~ Items

# Check if the player placed an item in the GUI
data remove storage pk.common:data Temp.GUI.Polluters
data modify storage pk.common:data Temp.GUI.Polluters set from storage pk.common:data Temp.GUI.Content
data remove storage pk.common:data Temp.GUI.Polluters[{tag:{pkGUI:1b}}]

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Events:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

# Player placed an item in the GUI
execute if data storage pk.common:data Temp.GUI.Polluters[{}] run function pk_waystones:blocks/waystone/use/gui/polluters/return_item_to_player_recursive

# Player clicked a GUI item
execute if score $clicked_gui pk.temp matches 1.. run function pk_waystones:blocks/waystone/use/gui/player_clicked_gui_item

# Player dropped GUI items from the block container using the drop key
execute at @a[tag=pk.temp.current,limit=1] if entity @e[type=item,distance=..2,nbt={Item:{tag:{pkGUI:1b}}}] run function pk_waystones:blocks/waystone/use/gui/player_dropped_gui_item

# Store previous content of the GUI
data modify entity @s data.GUI.Prev.Content set from block ~ ~ ~ Items