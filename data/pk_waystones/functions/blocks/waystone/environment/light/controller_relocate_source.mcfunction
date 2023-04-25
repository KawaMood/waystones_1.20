#> pk_waystones:blocks/waystone/environment/light/controller_relocate_source

scoreboard players set $stop pk.temp 0

# Set to bottom
execute positioned ~ ~-1 ~ unless predicate pk_waystones:location/light/0 run function pk_waystones:blocks/waystone/environment/light/relocate_source/bottom

# Set to top
execute if score $stop pk.temp matches 0 positioned ~ ~1 ~ unless predicate pk_waystones:location/light/0 run function pk_waystones:blocks/waystone/environment/light/relocate_source/top

# Set to west
execute if score $stop pk.temp matches 0 positioned ~-1 ~ ~ unless predicate pk_waystones:location/light/0 run function pk_waystones:blocks/waystone/environment/light/relocate_source/west

# Set to east
execute if score $stop pk.temp matches 0 positioned ~1 ~ ~ unless predicate pk_waystones:location/light/0 run function pk_waystones:blocks/waystone/environment/light/relocate_source/east

# Set to south
execute if score $stop pk.temp matches 0 positioned ~ ~ ~1 unless predicate pk_waystones:location/light/0 run function pk_waystones:blocks/waystone/environment/light/relocate_source/south

# Set to north
execute if score $stop pk.temp matches 0 positioned ~ ~ ~-1 unless predicate pk_waystones:location/light/0 run function pk_waystones:blocks/waystone/environment/light/relocate_source/north