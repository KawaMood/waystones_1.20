#> pk_waystones:blocks/waystone/use/gui/player_dropped_gui_item
#@location current user
#@context current controller

kill @e[type=item,distance=..2,nbt={Item:{tag:{pkGUI:1b}}}]
execute at @s run function pk_waystones:blocks/waystone/use/gui/update