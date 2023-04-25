#> pk_waystones:blocks/waystone/remove/trigger

# Reduce waystones total amount score (redefined from each placement)
scoreboard players remove $waystones.total_amount pk.value 1

# Stop checking environment
scoreboard players set $stop pk.temp 1

# Kill dropped GUI items and potential barrel
execute align xyz run kill @e[type=item,nbt={Item:{tag:{pkGUI:1b}}},dx=0]
execute unless block ~ ~ ~ barrel align xyz run kill @e[type=item,nbt={Item:{id:"minecraft:barrel",Count:1b},Age:0s},dx=0,limit=1]

# Drop item depending on the Waystone type
scoreboard players set $drop_with_current_tag pk.temp 1
scoreboard players set $drop_with_random_motion pk.temp 1
execute positioned ~ ~-0.5 ~ if data storage pk.common:data Temp.Waystone{Type:"regular"} run function pk_waystones:blocks/waystone/helpers/drop/regular
execute positioned ~ ~-0.5 ~ if data storage pk.common:data Temp.Waystone{Type:"sand"} run function pk_waystones:blocks/waystone/helpers/drop/sand
execute positioned ~ ~-0.5 ~ if data storage pk.common:data Temp.Waystone{Type:"nether"} run function pk_waystones:blocks/waystone/helpers/drop/nether
execute positioned ~ ~-0.5 ~ if data storage pk.common:data Temp.Waystone{Type:"deepslate"} run function pk_waystones:blocks/waystone/helpers/drop/deepslate

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
function pk_waystones:blocks/waystone/remove/blocks_list/remove

# Remove all id-matching components
kill @e[type=#pk_waystones:custom_block/components,tag=pk.waystones.waystone.component,predicate=pk_waystones:scores/custom_block/component_id_matching,distance=..10]

# Debug logs
execute if score $logs.datapack.waystones pk.value matches 1 run tellraw @a[tag=pk.dev] [{"text": "Waystone has been removed","color": "gray"}]