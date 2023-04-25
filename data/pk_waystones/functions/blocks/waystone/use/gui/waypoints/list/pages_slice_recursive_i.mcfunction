#> pk_waystones:blocks/waystone/use/gui/waypoints/list/pages_slice_recursive_i
# Slice array in pages of 18 Waystones

data remove storage pk.common:data Temp.Loop.i.Page
data modify storage pk.common:data Temp.Loop.i.Page set value []
scoreboard players set $item.slot pk.temp 0
scoreboard players set $waypoints_amount_in_page pk.temp 0
scoreboard players add $gui.total_pages pk.temp 1
function pk_waystones:blocks/waystone/use/gui/waypoints/list/pages_slice_recursive_j

execute if score $remaining_waystones pk.temp matches 1.. run function pk_waystones:blocks/waystone/use/gui/waypoints/list/pages_slice_recursive_i