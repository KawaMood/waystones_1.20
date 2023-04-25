#> pk_waystones:blocks/waystone/place/skins/regular/middle/5

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
tag @s add pk.part.middle
tag @s add pk.part.middle.5

# Set data 
data merge entity @s {item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;16,11,1,0],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZjVjYjY5YzExNTAzODZmM2Q5ZDhlYTM3MmVkNGFmZTI0ZTM5ZTE3YTQ1MGNlZWM0ZmI3ZTczNGFjNTMzODQyNSJ9fX0="}]}}}},transformation:{translation:[0.2495f,2.0005f,0.2495f],scale:[1.002f,1.002f,1.002f],right_rotation:[0f,1f,0f,0f]}}