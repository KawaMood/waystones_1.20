#> pk_waystones:blocks/waystone/use/gui/waypoints/list/page_current_search_recursive

# Increment the iteration value
scoreboard players add $i pk.temp 1

# If the page is reached, store it
execute if score $gui.current_page pk.temp = $i pk.temp run data modify storage pk.common:data Temp.GUI.Page set from storage pk.common:data Temp.GUI.Pages[0]

# Recursive call
data remove storage pk.common:data Temp.GUI.Pages[0]
execute unless score $gui.current_page pk.temp = $i pk.temp if data storage pk.common:data Temp.GUI.Pages[0] run function pk_waystones:blocks/waystone/use/gui/waypoints/list/page_current_search_recursive