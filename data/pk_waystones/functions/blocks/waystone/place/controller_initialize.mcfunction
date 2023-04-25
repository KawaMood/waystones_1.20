#> pk_waystones:blocks/waystone/place/controller_initialize

# Set component id score to link entities
scoreboard players operation @s pk.custom_block.component.id = $next pk.custom_block.component.id

# Initialize animations delay score
scoreboard players set @s pk.waystones.waystone.animations.delay 0

# Set tags
tag @s add pk.custom_block
tag @s add pk.custom_block.container
tag @s add pk.custom_block.component
tag @s add pk.custom_block.controller
tag @s add pk.custom_block.light_source.bottom
tag @s add pk.waystones
tag @s add pk.waystones.waystone
tag @s add pk.waystones.waystone.component
tag @s add pk.waystones.waystone.controller
tag @s add pk.waystones.state.public
tag @s add pk.waystones.state.unprotected

execute if score $pk.waystones.settings.legacy_textures pk.value matches 1.. run tag @s add pk.legacy_textures

# Store information to the controller
data modify entity @s data.Waystone set from storage pk.common:data Temp.Waystone