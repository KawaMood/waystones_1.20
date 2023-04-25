#> pk_waystones:packages/dimension_marker/marker_initialize

# Increment and set dimension id (start at 100)
execute unless score $next pk.dimension.id matches 99.. run scoreboard players set $next pk.dimension.id 99
scoreboard players add $next pk.dimension.id 1
scoreboard players operation @s pk.dimension.id = $next pk.dimension.id

# Add tag
tag @s add pk.dimension.marker

# Store dimension id in data
execute store result entity @s data.Dimension.id int 1 run scoreboard players get $next pk.dimension.id