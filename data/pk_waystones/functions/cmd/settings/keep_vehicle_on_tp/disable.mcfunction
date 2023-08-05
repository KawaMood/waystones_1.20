#> pk_waystones:cmd/settings/keep_vehicle_on_tp/disable

# Check current setting's value
execute if score $pk.waystones.settings.keep_vehicle_on_tp pk.value matches ..0 run tellraw @s [{"text": "Keep Vehicle On Tp","color": "light_purple"},{"text": " setting is already set on ","color": "red"},{"text": "Disabled","color": "light_purple"}]
execute unless score $pk.waystones.settings.keep_vehicle_on_tp pk.value matches ..0 run tellraw @s [{"text": "Keep Vehicle On Tp","color": "light_purple"},{"text": " setting has been set on ","color": "yellow"},{"text": "Disabled","color": "light_purple"}]

# Update setting's value
scoreboard players set $pk.waystones.settings.keep_vehicle_on_tp pk.value 0