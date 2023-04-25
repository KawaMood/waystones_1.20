#> pk_waystones:blocks/waystone/place/skins/deepslate/base/2

# Set component id score to link entities
scoreboard players operation @s pk.custom_block.component.id = $next pk.custom_block.component.id

# Add tags
tag @s add pk.custom_block
tag @s add pk.custom_block.component
tag @s add pk.custom_block.decorative
tag @s add pk.waystones
tag @s add pk.waystones.waystone
tag @s add pk.waystones.waystone.component
tag @s add pk.waystones.waystone.decorative
tag @s add pk.part.base
tag @s add pk.part.base.2

# Set data
data merge entity @s {item:{id:"minecraft:deepslate_brick_slab",Count:1b},transformation:{scale:[1f,1f,1f],translation:[0.5f,0.5f,0.5f],right_rotation:[0f,1f,0f,0f]}}