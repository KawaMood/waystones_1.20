#> pk_waystones:packages/dimension_marker/marker_initialize

# Increment dimension id
scoreboard players add $next pk.dimension.id 1
scoreboard players operation @s pk.dimension.id = $next pk.dimension.id

# Add tag
tag @s add pk.dimension.marker

# Store dimension id in data
execute store result entity @s data.Dimension.id int 1 run scoreboard players get $next pk.dimension.id

# Debug logs
execute if score $logs.datapack.waystones pk.value matches 1 run tellraw @a[tag=pk.dev] [{"text":"New dimension marker set","color": "gray"}]