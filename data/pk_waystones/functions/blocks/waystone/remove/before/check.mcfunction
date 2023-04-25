#> pk_waystones:blocks/waystone/remove/before/check

# Set scores
scoreboard players set $stop pk.temp 0

# Check if the the Waystone is protected
execute if entity @s[tag=pk.waystones.state.protected] run function pk_waystones:blocks/waystone/remove/before/check_breaking_source

# Proceed
execute if score $stop pk.temp matches 1 run function pk_waystones:blocks/waystone/remove/before/cancel
execute if score $stop pk.temp matches 0 run function pk_waystones:blocks/waystone/remove/trigger