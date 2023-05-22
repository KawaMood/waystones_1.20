#> pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/chunk_update_single_element

scoreboard players operation $temp pk.custom_block.component.id = @s pk.custom_block.component.id
data modify storage pk.common:data Temp.Waystone set from entity @s data.Waystone

execute if score $attempted.value pk.temp matches 0 if entity @s[tag=pk.waystones.show_name] run kill @e[type=text_display,predicate=pk_waystones:scores/custom_block/component_id_matching]
execute if score $attempted.value pk.temp matches 1 if entity @s[tag=!pk.waystones.show_name] positioned ~ ~0.8 ~ summon text_display run function pk_waystones:blocks/waystone/place/name_initialize

execute if score $attempted.value pk.temp matches 0 run tag @s remove pk.waystones.show_name
execute if score $attempted.value pk.temp matches 1 run tag @s add pk.waystones.show_name