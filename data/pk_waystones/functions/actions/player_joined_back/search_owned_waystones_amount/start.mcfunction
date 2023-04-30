#> pk_waystones:actions/player_joined_back/search_owned_waystones_amount/start

# Prepare scores
scoreboard players set $amount pk.temp 0
scoreboard players operation $player.id pk.temp = @s pk.player.id

# Start
data remove storage pk.common:data Temp.Array
data modify storage pk.common:data Temp.Array.Search set from storage pk.waystones:data Blocks.Waystones
execute if data storage pk.common:data Temp.Array.Search[{}] run function pk_waystones:actions/player_joined_back/search_owned_waystones_amount/recursive

# Update score
scoreboard players operation @s pk.waystones.owned_waystones_amount = $amount pk.temp