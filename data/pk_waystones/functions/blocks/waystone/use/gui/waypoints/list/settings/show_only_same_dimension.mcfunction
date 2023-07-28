#> pk_waystones:blocks/waystone/use/gui/waypoints/list/settings/show_only_same_dimension
# Skip the Waypoint if it is not in the same dimension as the current Waystone

scoreboard players set $compare pk.temp 0
data remove storage pk.common:data Temp.Compare
data modify storage pk.common:data Temp.Compare set from storage pk.common:data Temp.CurrentDimension
execute store success score $compare pk.temp run data modify storage pk.common:data Temp.Compare set from storage pk.common:data Temp.Waystones[0].Dimension 
execute if score $compare pk.temp matches 1 run scoreboard players set $should_skip_waypoint pk.temp 1