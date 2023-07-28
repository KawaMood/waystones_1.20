#> pk_waystones:blocks/waystone/use/gui/waypoints/list/pages_slice_recursive_j

# Store the current Waypoint to the page (item form) with conditions
# - Set scores
scoreboard players set $should_skip_waypoint pk.temp 0
execute store result score $waystone_id pk.temp run data get storage pk.common:data Temp.Waystones[0].id
execute store result score $owner.id pk.temp run data get storage pk.common:data Temp.Waystones[0].Owner.id
# - The Waystone id matches the current Waystone: skip it
execute if score $waystone_id pk.temp = $temp pk.custom_block.component.id run scoreboard players set $should_skip_waypoint pk.temp 1
# - The Waypoint is private and the current user isn't the owner or a manager: skip it
execute if data storage pk.common:data Temp.Waystones[0].Waypoint.tag.pkData{Private:1b} unless entity @a[tag=pk.temp.current,distance=..10,predicate=pk_waystones:gameplay/waystone/owner_or_manager,limit=1] run scoreboard players set $should_skip_waypoint pk.temp 1
# - "Only show the Waystones of the same dimension" setting is enabled and the dimension of the Waypoint is different from the current Waystone's dimension
execute if score $pk.waystones.settings.show_same_dimension_only pk.value matches 1.. run function pk_waystones:blocks/waystone/use/gui/waypoints/list/settings/show_only_same_dimension
# - Otherwise, add the waypoint in the list
execute if score $should_skip_waypoint pk.temp matches 0 run function pk_waystones:blocks/waystone/use/gui/waypoints/list/pages_add_waypoint

# Reduce remaining waystones score
scoreboard players remove $remaining_waystones pk.temp 1

# Add current page to the pages array if reaches 18 Waystones or if it reaches the end of the Waystones array
execute if score $waypoints_amount_in_page pk.temp matches 18 run data modify storage pk.common:data Temp.GUI.Pages append from storage pk.common:data Temp.Loop.i.Page
execute if score $remaining_waystones pk.temp matches 0 run data modify storage pk.common:data Temp.GUI.Pages append from storage pk.common:data Temp.Loop.i.Page

# Recursive call
data remove storage pk.common:data Temp.Waystones[0]
execute if score $remaining_waystones pk.temp matches 1.. if score $waypoints_amount_in_page pk.temp matches ..17 run function pk_waystones:blocks/waystone/use/gui/waypoints/list/pages_slice_recursive_j