#> pk_waystones:blocks/waystone/use/gui/player_clicked_gui_item

# Check if the player clicked a menu button
scoreboard players set $clicked_item pk.temp 0
execute store result score $clicked_item pk.temp run clear @a[tag=pk.temp.current,limit=1] #pk_waystones:all{pkWaypoint:1b}
execute if score $clicked_item pk.temp matches 1.. run function pk_waystones:blocks/waystone/use/gui/waypoints/click/trigger

# Check if the player clicked prev page
scoreboard players set $clicked_item pk.temp 0
execute store result score $clicked_item pk.temp run clear @a[tag=pk.temp.current,limit=1] #pk_waystones:gui{pkMenu:1b,pkData:{action:"page.prev"}}
execute if score $clicked_item pk.temp matches 1.. run function pk_waystones:blocks/waystone/use/gui/menu/page_prev/click

# Check if the player clicked next page
scoreboard players set $clicked_item pk.temp 0
execute store result score $clicked_item pk.temp run clear @a[tag=pk.temp.current,limit=1] #pk_waystones:gui{pkMenu:1b,pkData:{action:"page.next"}}
execute if score $clicked_item pk.temp matches 1.. run function pk_waystones:blocks/waystone/use/gui/menu/page_next/click

# Check if the player clicked visibility public button
scoreboard players set $clicked_item pk.temp 0
execute store result score $clicked_item pk.temp run clear @a[tag=pk.temp.current,limit=1] #pk_waystones:gui{pkMenu:1b,pkData:{action:"waypoint.visibility.public"}}
execute if score $clicked_item pk.temp matches 1.. run function pk_waystones:blocks/waystone/use/gui/menu/waypoint_visibility_public/click

# Check if the player clicked visibility private button
scoreboard players set $clicked_item pk.temp 0
execute store result score $clicked_item pk.temp run clear @a[tag=pk.temp.current,limit=1] #pk_waystones:gui{pkMenu:1b,pkData:{action:"waypoint.visibility.private"}}
execute if score $clicked_item pk.temp matches 1.. run function pk_waystones:blocks/waystone/use/gui/menu/waypoint_visibility_private/click

# Check if the player clicked protection disable button
scoreboard players set $clicked_item pk.temp 0
execute store result score $clicked_item pk.temp run clear @a[tag=pk.temp.current,limit=1] #pk_waystones:gui{pkMenu:1b,pkData:{action:"waypoint.protection.disable"}}
execute if score $clicked_item pk.temp matches 1.. run function pk_waystones:blocks/waystone/use/gui/menu/waypoint_protection_disable/click

# Check if the player clicked protection enable button
scoreboard players set $clicked_item pk.temp 0
execute store result score $clicked_item pk.temp run clear @a[tag=pk.temp.current,limit=1] #pk_waystones:gui{pkMenu:1b,pkData:{action:"waypoint.protection.enable"}}
execute if score $clicked_item pk.temp matches 1.. run function pk_waystones:blocks/waystone/use/gui/menu/waypoint_protection_enable/click

# Clear other items that have no action
clear @a[tag=pk.temp.current,limit=1] #pk_waystones:gui{pkMenu:1b}

# Update GUI
function pk_waystones:blocks/waystone/use/gui/update