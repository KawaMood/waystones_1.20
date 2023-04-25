#> pk_waystones:blocks/waystone/use/gui/waypoints/click/teleport

tag @s add pk.waystones.waystone.player.repositioner

# Animations (initial point)
execute at @a[tag=pk.temp.current,limit=1] run playsound block.portal.travel player @a[distance=..30,tag=!pk.temp.current] ~ ~ ~ 0.2 1.8
execute at @a[tag=pk.temp.current,limit=1] run particle reverse_portal ~ ~1 ~ 0.5 0.5 0.5 0.001 50

# Relocate to the coordinates
execute store result entity @s Pos[0] double 1 run data get storage pk.common:data Temp.GUI.Clicked.Waypoint.tag.pkData.x
execute store result entity @s Pos[1] double 1 run data get storage pk.common:data Temp.GUI.Clicked.Waypoint.tag.pkData.y
execute store result entity @s Pos[2] double 1 run data get storage pk.common:data Temp.GUI.Clicked.Waypoint.tag.pkData.z

# Relocate in the right dimension
execute store result score $temp pk.dimension.id run data get storage pk.common:data Temp.GUI.Clicked.Waypoint.tag.pkData.Dimension.id
execute if score $temp pk.dimension.id matches -1 in minecraft:the_nether positioned as @s run tp @a[tag=pk.temp.current,limit=1] ~ ~ ~
execute if score $temp pk.dimension.id matches 0 in minecraft:overworld positioned as @s run tp @a[tag=pk.temp.current,limit=1] ~ ~ ~
execute if score $temp pk.dimension.id matches 1 in minecraft:the_end positioned as @s run tp @a[tag=pk.temp.current,limit=1] ~ ~ ~
execute if score $temp pk.dimension.id matches 99.. at @e[type=marker,tag=pk.dimension.marker,predicate=pk_waystones:scores/dimension_marker/matching_id] positioned as @s run tp @a[tag=pk.temp.current,limit=1] ~ ~ ~

# When the user lands
execute as @a[tag=pk.temp.current,limit=1] at @s run function pk_waystones:blocks/waystone/use/gui/waypoints/click/player_landing

# Remove marker
kill @s