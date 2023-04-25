#> pk_waystones:blocks/waystone/environment/entities/monsters_nearby/lock_interaction_initialize

# Set interaction.id score
scoreboard players operation @s pk.custom_block.component.id = $temp pk.custom_block.component.id

# Add tags
tag @s add pk.waystones
tag @s add pk.waystones.waystone
tag @s add pk.waystones.waystone.lock_interaction
tag @s add pk.waystones.waystone.lock_interaction.monsters_nearby

# Set data
data merge entity @s {width:1.001f,height:1.001f,response:1b}