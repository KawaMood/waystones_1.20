#> pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/after_1s_trigger

# Prepare score
data modify storage pk.common:data Temp.Waystone set from entity @s data.Waystone
execute store result score $temp pk.custom_block.component.id run data get storage pk.common:data Temp.Waystone.id

# If value set to 0 : Remove text display entity
execute if score $attempted.value pk.temp matches 0 run kill @e[type=text_display,tag=pk.waystones.waystone.name,predicate=pk_waystones:scores/custom_block/component_id_matching,distance=..10]
# If value set to 1 : Set text display entity
execute if score $attempted.value pk.temp matches 1 positioned ~0.5 ~2.3 ~0.5 summon text_display run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/name_initialize

# Unload the targeted chunk
forceload remove ~ ~

# Remove the current entity
kill @s