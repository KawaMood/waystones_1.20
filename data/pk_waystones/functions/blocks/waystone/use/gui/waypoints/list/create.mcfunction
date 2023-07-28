#> pk_waystones:blocks/waystone/use/gui/waypoints/list/create
# Create the list of Waypoints to display in a Waystone
# Most of rules-based displays are managed within function pk_waystones:blocks/waystone/use/gui/waypoints/list/pages_slice_recursive_j

# Set scores
scoreboard players operation $gui.current_page pk.temp = @s pk.waystones.waystone.page
scoreboard players set $gui.total_pages pk.temp 0

# Prepare data
execute if score $pk.waystones.settings.show_same_dimension_only pk.value matches 1.. run data modify storage pk.common:data Temp.CurrentDimension set from entity @s data.Waystone.Dimension
data remove storage pk.common:data Temp.GUI

# Create pages
data remove storage pk.common:data Temp.Waystones
data modify storage pk.common:data Temp.GUI.Pages set value []
data modify storage pk.common:data Temp.Waystones set from storage pk.waystones:data Blocks.Waystones
execute store result score $remaining_waystones pk.temp run data get storage pk.common:data Temp.Waystones
function pk_waystones:blocks/waystone/use/gui/waypoints/list/pages_slice_recursive_i

# Search page to display from pages
data modify storage pk.common:data Temp.GUI.PagesBackup set from storage pk.common:data Temp.GUI.Pages
data remove storage pk.common:data Temp.GUI.Page
scoreboard players set $i pk.temp 0
function pk_waystones:blocks/waystone/use/gui/waypoints/list/page_current_search_recursive

# Display waypoints from found page
data modify block ~ ~ ~ Items append from storage pk.common:data Temp.GUI.Page[]