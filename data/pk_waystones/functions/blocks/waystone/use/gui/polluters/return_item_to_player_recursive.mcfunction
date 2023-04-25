#> pk_waystones:blocks/waystone/use/gui/polluters/return_item_to_player_recursive

# Return the item the player placed in the GUI
execute at @a[tag=pk.temp.current,limit=1] run function pk_waystones:blocks/waystone/use/gui/polluters/return_item_to_player
data remove storage pk.common:data Temp.GUI.Polluters[-1]

# Update GUI unless the player has a GUI item (this will be run further)
execute unless data storage pk.common:data Temp.GUI.Polluters[{}] if score $clicked_gui pk.temp matches 0 run function pk_waystones:blocks/waystone/use/gui/update

# Recursive call
execute if data storage pk.common:data Temp.GUI.Polluters[{}] run function pk_waystones:blocks/waystone/use/gui/polluters/return_item_to_player_recursive