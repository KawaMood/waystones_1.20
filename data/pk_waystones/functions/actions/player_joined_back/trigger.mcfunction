#> pk_waystones:actions/player_joined_back/trigger

# Reset score
scoreboard players set @s pk.waystones.player.leave_game 0

# Update the owned score of the player
function pk_waystones:actions/player_joined_back/search_owned_waystones_amount/start