#> pk_waystones:blocks/waystone/use/on_stop/trigger
# Player stops to use a Waystone

# Remove tag
tag @s remove pk.custom_block.in_use

# Force the block to empty
function pk_waystones:blocks/waystone/helpers/refresh_container

# Remove interaction
execute align xyz run kill @e[type=interaction,tag=pk.waystones.waystone.lock_interaction.in_use,dx=0,predicate=pk_waystones:scores/custom_block/component_id_matching,limit=1]

# Stop the default sound
stopsound @a[distance=..30] block block.barrel.close

# Debug logs
execute if score $logs.datapack.waystones pk.value matches 1 run tellraw @a[tag=pk.dev] [{"selector":"@a[tag=pk.temp.current,limit=1]","color": "gray"},{"text": " closed Waystone at ["},{"nbt":"x","block":"~ ~ ~"},{"text": ","},{"nbt":"y","block":"~ ~ ~"},{"text": ","},{"nbt":"z","block":"~ ~ ~"},{"text": "]"}]