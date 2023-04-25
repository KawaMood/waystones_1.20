#> pk_waystones:blocks/waystone/place/blocks_list/set_waypoint

# Set item's id
# - Try to get the item form of the block bellow the Waystone
loot replace entity @s weapon.mainhand mine ~ ~-1 ~ minecraft:netherite_pickaxe{Enchantments:[{id:"minecraft:silk_touch",lvl:1s}]}
# - If the block isn't valid (air for example) or is a block from a mod or last snapshots, set a default block
execute unless entity @s[predicate=pk_waystones:hold/waypoint_compatible] run item replace entity @s weapon.mainhand with grass_block
# - Store the render item
data modify storage pk.common:data Temp.Waystone.Waypoint set from entity @s HandItems[0]

# Add other identifier tags
data modify storage pk.common:data Temp.Waystone.Waypoint.tag merge value {pkGUI:1b,pkWaystoneGUI:1b,pkWaypoint:1b,display:{Lore:[]}}

# Set position 
data modify storage pk.common:data Temp.Waystone.Waypoint.tag.pkData.x set from storage pk.common:data Temp.Waystone.x
data modify storage pk.common:data Temp.Waystone.Waypoint.tag.pkData.y set from storage pk.common:data Temp.Waystone.y
data modify storage pk.common:data Temp.Waystone.Waypoint.tag.pkData.z set from storage pk.common:data Temp.Waystone.z

# Set Waystone id
data modify storage pk.common:data Temp.Waystone.Waypoint.tag.pkData.id set from storage pk.common:data Temp.Waystone.id

# Set owner id
data modify storage pk.common:data Temp.Waystone.Waypoint.tag.pkData.Owner.id set from storage pk.common:data Temp.Waystone.Owner.id

# Set default states
data modify storage pk.common:data Temp.Waystone.Waypoint.tag.pkData merge value {Private:0b,Protected:0b}

# Set dimension name and id
execute if score $temp pk.dimension.id matches -1 run data modify storage pk.common:data Temp.Dimension.Name set value "the Nether"
execute if score $temp pk.dimension.id matches 0 run data modify storage pk.common:data Temp.Dimension.Name set value "Overworld"
execute if score $temp pk.dimension.id matches 1 run data modify storage pk.common:data Temp.Dimension.Name set value "the End"
execute if score $temp pk.dimension.id matches 99.. run data modify storage pk.common:data Temp.Dimension.Name set value "a custom dimension"
execute store result storage pk.common:data Temp.Waystone.Waypoint.tag.pkData.Dimension.id int 1 run scoreboard players get $temp pk.dimension.id

# Set lore and name
setblock ~ ~ ~ oak_sign{Text1:'{"nbt":"Temp.Waystone.Name","storage":"pk.common:data","color":"yellow","italic":false,"interpret":true}',Text2:'[{"text": "[","italic":false},{"nbt":"Temp.Waystone.x","storage":"pk.common:data"},{"text": ","},{"nbt":"Temp.Waystone.y","storage":"pk.common:data"},{"text": ","},{"nbt":"Temp.Waystone.z","storage":"pk.common:data"},{"text": "] in "},{"nbt":"Temp.Dimension.Name","storage":"pk.common:data"}]'}
data modify storage pk.common:data Temp.Waystone.Waypoint.tag.display.Name set from block ~ ~ ~ Text1
data modify storage pk.common:data Temp.Waystone.Waypoint.tag.display.Lore append from block ~ ~ ~ Text2

# Remove armor_stand
kill @s