#> pk_waystones:blocks/waystone/environment/light/relocate_source/north

# Set score
scoreboard players set $stop pk.temp 1

# Update light source tag
function pk_waystones:blocks/waystone/environment/light/controller_remove_source_tags
tag @s add pk.custom_block.light_source.north

# Find relative decorative components
tag @e[type=#pk_waystones:custom_block/components,tag=pk.custom_block.decorative,tag=pk.part.middle,predicate=pk_waystones:scores/custom_block/component_id_matching,distance=..10] add pk.temp.current

# Update current decorative components
execute if entity @s[tag=!pk.legacy_textures] as @e[type=#pk_waystones:custom_block/components,tag=pk.custom_block.decorative,tag=pk.temp.current,distance=..10] run function pk_waystones:blocks/waystone/environment/light/update_decorative_components/default/north
execute if entity @s[tag=pk.legacy_textures] as @e[type=#pk_waystones:custom_block/components,tag=pk.custom_block.decorative,tag=pk.temp.current,distance=..10] run function pk_waystones:blocks/waystone/environment/light/update_decorative_components/legacy/north

# Free relative decorative components
tag @e[type=#pk_waystones:custom_block/components,tag=pk.custom_block.decorative,tag=pk.temp.current,distance=..10] remove pk.temp.current

# Debug logs
execute if score $logs.datapack.waystones pk.value matches 1 run tellraw @a[tag=pk.dev] [{"text": "Waystone at [","color": "gray"},{"nbt":"x","block":"~ ~ ~1"},{"text": ","},{"nbt":"y","block":"~ ~ ~1"},{"text": ","},{"nbt":"z","block":"~ ~ ~1"},{"text": "] redefined its own light source to \"north\""}]