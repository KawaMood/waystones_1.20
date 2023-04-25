#> pk_waystones:blocks/waystone/place/skins/sand/base/1

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
tag @s add pk.part.base.1

# Set data
data merge entity @s {item:{id:"minecraft:sandstone",Count:1b},transformation:{scale:[0.6875f,0.6875f,0.6875f],translation:[0.5f,0.755f,0.5f],right_rotation:[0f,1f,0f,0f]}}