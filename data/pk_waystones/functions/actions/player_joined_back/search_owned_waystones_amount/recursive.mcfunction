#> pk_waystones:actions/player_joined_back/search_owned_waystones_amount/recursive

# Store the id of the owner of the current Waystone and compare it with the current player id
execute store result score $owner.id pk.temp run data get storage pk.common:data Temp.Array.Search[-1].Owner.id
execute if score $owner.id pk.temp = $player.id pk.temp run scoreboard players add $amount pk.temp 1

# Recursive call
data remove storage pk.common:data Temp.Array.Search[-1]
execute if data storage pk.common:data Temp.Array.Search[{}] run function pk_waystones:actions/player_joined_back/search_owned_waystones_amount/recursive