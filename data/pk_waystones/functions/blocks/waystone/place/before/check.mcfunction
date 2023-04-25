#> pk_waystones:blocks/waystone/place/before/check
# From the found block {Waystone:1b} placer, check if a Waystone can be placed

# Prepare score
execute store result score $waystones.total_amount pk.value run data get storage pk.waystones:data Blocks.Waystones
scoreboard players set $stop pk.temp 0

# Check if the Waystone has a custom name, if not, remove color
execute if data storage pk.common:data Temp.Item.tag.display{Name:'{"text":"Waystone","italic": false,"color": "yellow"}'} run data modify storage pk.common:data Temp.Item.tag.display.Name set value '{"text":"Waystone","italic": false}'

# Check if the current dimension isn't black listed
execute if score $stop pk.temp matches 0 if predicate pk_waystones:location/dimension/blacklisted run function pk_waystones:blocks/waystone/place/before/errors/dimension

# Check if the player exceeded the Waystones limit per player
execute if score $stop pk.temp matches 0 if score @s pk.waystones.owned_waystones_amount >= $pk.waystones.settings.limit_per_player pk.value run function pk_waystones:blocks/waystone/place/before/errors/limit_per_player

# Check if the Waystones limit of the server has been exceeded
execute if score $stop pk.temp matches 0 if score $waystones.total_amount pk.value >= $pk.waystones.settings.limit_per_server pk.value run function pk_waystones:blocks/waystone/place/before/errors/limit_per_server

# Check if the Waystone fits on the placed area
execute if score $stop pk.temp matches 0 unless predicate pk_waystones:gameplay/waystone/fit run function pk_waystones:blocks/waystone/place/before/errors/space

# If all checks passed
execute if score $stop pk.temp matches 0 run function pk_waystones:blocks/waystone/place/trigger