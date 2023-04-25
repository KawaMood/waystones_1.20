#> pk_waystones:blocks/waystone/actions/right_click_on_lock_interaction/trigger

# Revoke advancement
advancement revoke @s only pk_waystones:interactions/clicked_locked_waystone

# Temporary tag the player
tag @s add pk.temp.current

# Search the clicked interaction
execute as @e[type=interaction,tag=pk.waystones.waystone.lock_interaction,distance=..16] if data entity @s interaction.player run function pk_waystones:blocks/waystone/actions/right_click_on_lock_interaction/switch

# Remove the current tag
tag @s remove pk.temp.current