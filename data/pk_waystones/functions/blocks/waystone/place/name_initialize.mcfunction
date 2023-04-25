#> pk_waystones:blocks/waystone/place/name_initialize

# Set component id score to link entities
scoreboard players operation @s pk.custom_block.component.id = $next pk.custom_block.component.id

# Add tags
tag @s add pk.custom_block
tag @s add pk.custom_block.component
tag @s add pk.custom_block.decorative
tag @s add pk.waystones
tag @s add pk.waystones.waystone
tag @s add pk.waystones.waystone.component
tag @s add pk.waystones.waystone.name

# Set data
data modify entity @s text set from storage pk.common:data Temp.Waystone.Name
data modify entity @s billboard set value "center"