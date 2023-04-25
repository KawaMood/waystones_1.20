#> pk_waystones:blocks/waystone/use/gui/menu/create

# Set scores
scoreboard players operation $gui.current_page pk.temp = @s pk.waystones.waystone.page

# Store data of the Waypoint
data remove storage pk.common:data Temp.GUI.Menu
data modify storage pk.common:data Temp.GUI.Menu set value []
data remove storage pk.common:data Temp.Waypoint
data modify storage pk.common:data Temp.Waypoint set from entity @s data.Waystone.Waypoint.tag.pkData

# Place a temporary sign on the base
setblock ~ ~-1 ~ oak_sign

# Add the "Prev Page" button
data modify block ~ ~-1 ~ Text1 set value '[{"text":"Previous page [","italic":false},{"score":{"name":"$gui.current_page","objective":"pk.temp"}},{"text":"/"},{"score":{"name":"$gui.total_pages","objective":"pk.temp"}},{"text":"]"}]'
execute if score @s pk.waystones.waystone.page matches 2.. run data modify storage pk.common:data Temp.GUI.Menu append value {Slot:18b,id:"minecraft:gunpowder",Count:1b,tag:{pkGUI:1b,pkWaystoneGUI:1b,pkMenu:1b,pkData:{action:"page.prev"}}}
execute if score @s pk.waystones.waystone.page matches 2.. run data modify storage pk.common:data Temp.GUI.Menu[-1].tag.display.Name set from block ~ ~-1 ~ Text1

# Add the "Next Page" button
data modify block ~ ~-1 ~ Text1 set value '[{"text":"Next page [","italic":false},{"score":{"name":"$gui.current_page","objective":"pk.temp"}},{"text":"/"},{"score":{"name":"$gui.total_pages","objective":"pk.temp"}},{"text":"]"}]'
execute if score @s pk.waystones.waystone.page < $gui.total_pages pk.temp run data modify storage pk.common:data Temp.GUI.Menu append value {Slot:26b,id:"minecraft:gunpowder",Count:1b,tag:{pkGUI:1b,pkWaystoneGUI:1b,pkMenu:1b,pkData:{action:"page.next"}}}
execute if score @s pk.waystones.waystone.page < $gui.total_pages pk.temp run data modify storage pk.common:data Temp.GUI.Menu[-1].tag.display.Name set from block ~ ~-1 ~ Text1

# Add the "Hide" button
execute if entity @s[tag=pk.waystones.state.public] run data modify storage pk.common:data Temp.GUI.Menu append value {Slot:19b,id:"minecraft:lime_dye",Count:1b,tag:{pkGUI:1b,pkWaystone:1b,pkMenu:1b,pkData:{action:"waypoint.visibility.private"},display:{Name:'{"text":"Visibility [Public]","italic":false}',Lore:['{"text":"Click to hide this waypoint"}','{"text":"in the public list"}']}}}
execute if entity @s[tag=pk.waystones.state.private] run data modify storage pk.common:data Temp.GUI.Menu append value {Slot:19b,id:"minecraft:magenta_dye",Count:1b,tag:{pkGUI:1b,pkWaystone:1b,pkMenu:1b,pkData:{action:"waypoint.visibility.public"},display:{Name:'{"text":"Visibility [Private]","italic":false}',Lore:['{"text":"Click to show this waypoint"}','{"text":"in the public list"}']}}}

# Add the "Protect" button
execute if entity @s[tag=pk.waystones.state.unprotected] run data modify storage pk.common:data Temp.GUI.Menu append value {Slot:20b,id:"minecraft:lime_dye",Count:1b,tag:{pkGUI:1b,pkWaystone:1b,pkMenu:1b,pkData:{action:"waypoint.protection.enable"},display:{Name:'{"text":"Protection [Disabled]","italic":false}',Lore:['{"text":"Click to prevent this waypoint"}','{"text":"to be broken by any source"}']}}}
execute if entity @s[tag=pk.waystones.state.protected] run data modify storage pk.common:data Temp.GUI.Menu append value {Slot:20b,id:"minecraft:magenta_dye",Count:1b,tag:{pkGUI:1b,pkWaystone:1b,pkMenu:1b,pkData:{action:"waypoint.protection.disable"},display:{Name:'{"text":"Protection [Enabled]","italic":false}',Lore:['{"text":"Click to allow this Waystone"}','{"text":"to be broken by any source"}']}}}

# Remove the temporary sign
setblock ~ ~-1 ~ barrier

# Display Menu
data modify block ~ ~ ~ Items append from storage pk.common:data Temp.GUI.Menu[]