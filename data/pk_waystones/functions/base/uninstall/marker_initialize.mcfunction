#> pk_waystones:base/uninstall/marker_initialize

# Tag the current marker
tag @s add pk.custom_block.uninstall

# Switch process depending on the dimension the custom block is in
execute store result score $temp pk.dimension.id run data get storage pk.common:data Temp.Array.Item.Dimension.id
# - If the custom block is in vanilla dimension
execute if score $temp pk.dimension.id matches -1..1 run function pk_waystones:base/uninstall/in_vanilla_dimension/start
# - If the custom block is in custom dimension
execute if score $temp pk.dimension.id matches 100.. run function pk_waystones:base/uninstall/in_custom_dimension/start