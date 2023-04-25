#> pk_waystones:blocks/waystone/actions/right_click_on_container/trigger
# @within advancement pk_waystones:interactions/clicked_waystone

advancement revoke @s only pk_waystones:interactions/clicked_waystone

# Increment and set interaction.id score
scoreboard players add $next pk.custom_block.interaction.id 1
scoreboard players operation @s pk.custom_block.interaction.id = $next pk.custom_block.interaction.id

# Search the clicked block
tag @s add pk.temp.current
function pk_waystones:blocks/waystone/actions/right_click_on_container/search_block/start
tag @s remove pk.temp.current