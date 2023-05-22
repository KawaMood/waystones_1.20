#> pk_waystones:blocks/waystone/remove/trigger

# Set score
scoreboard players operation $temp pk.custom_block.component.id = @s pk.custom_block.component.id

# Reduce waystones total amount score (redefined from each placement)
scoreboard players remove $waystones.total_amount pk.value 1

# Stop checking environment
scoreboard players set $stop pk.temp 1

# Kill dropped GUI items and potential barrel
execute align xyz run kill @e[type=item,nbt={Item:{tag:{pkGUI:1b}}},dx=0]
execute unless block ~ ~ ~ barrel align xyz run kill @e[type=item,nbt={Item:{id:"minecraft:barrel",Count:1b},Age:0s},dx=0,limit=1]

# Drop item depending on the Waystone type
execute unless score $uninstall pk.temp matches 1 run function pk_waystones:blocks/waystone/remove/drop_item

# Modify the dropped item
data modify entity @e[type=item,tag=pk.temp.current.item,limit=1,distance=..2] Item.tag.display.Name set from storage pk.common:data Temp.Waystone.Name
tag @e[type=item,tag=pk.temp.current.item,limit=1,distance=..2] remove pk.temp.current

# Force remaining blocks to be removed
setblock ~ ~-1 ~ air
setblock ~ ~ ~ air

# Check if the owner is online, if it is the case, remove a waystone to its owned waystones amount score
execute store result score $temp pk.player.id run data get storage pk.common:data Temp.Waystone.Owner.id
scoreboard players remove @a[predicate=pk_waystones:scores/player_id/matching_id] pk.waystones.owned_waystones_amount 1

# Remove the Waystone in the blocks list
execute unless score $uninstall pk.temp matches 1 run function pk_waystones:blocks/waystone/remove/blocks_list/remove

# Remove all id-matching components
kill @e[type=#pk_waystones:custom_block/components,tag=pk.waystones.waystone.component,predicate=pk_waystones:scores/custom_block/component_id_matching,distance=..10]
kill @s

# Debug logs
execute if score $logs.datapack.waystones pk.value matches 1 run tellraw @a[tag=pk.dev] [{"text": "Waystone has been removed","color": "gray"}]