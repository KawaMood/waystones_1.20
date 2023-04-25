#> pk_waystones:blocks/waystone/use/on_start/trigger
# Player starts to use a Waystone

# Set scores
scoreboard players operation @s pk.custom_block.interaction.id = $next pk.custom_block.interaction.id
scoreboard players operation $temp pk.custom_block.component.id = @s pk.custom_block.component.id
scoreboard players set @s pk.waystones.waystone.page 1

# Add in use tag
tag @s add pk.custom_block.in_use

# Place interaction entity to prevent other player to open the Waystone
execute align xyz positioned ~0.4995 ~-0.0005 ~0.4995 summon interaction run function pk_waystones:blocks/waystone/use/on_start/lock_interaction_initialize

# Create Waystones Pages
function pk_waystones:blocks/waystone/use/gui/waypoints/list/create

# Create Menu
function pk_waystones:blocks/waystone/use/gui/menu/create

# Animations
stopsound @a[distance=..30] block block.barrel.open
playsound minecraft:entity.allay.item_taken block @a ~ ~ ~ 1 1.4

# Debug logs
execute if score $logs.datapack.waystones pk.value matches 1 run tellraw @a[tag=pk.dev] [{"selector":"@a[tag=pk.temp.current,limit=1]","color": "gray"},{"text": " opened Waystone at ["},{"nbt":"x","block":"~ ~ ~"},{"text": ","},{"nbt":"y","block":"~ ~ ~"},{"text": ","},{"nbt":"z","block":"~ ~ ~"},{"text": "]"}]