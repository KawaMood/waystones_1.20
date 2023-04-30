#> pk_waystones:packages/dimension_marker/load
# This package place a marker in a force-loaded chunk in each custom dimension that remains thopper sorterable for other purposes.
# Only one marker per dimension is placed, no matter the fact this package is also embed in other data packs.

scoreboard objectives add pk.dimension.id dummy

# Initialize dimension id (start at 100)
execute unless score $next pk.dimension.id matches 99.. run scoreboard players set $next pk.dimension.id 99