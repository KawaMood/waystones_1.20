#> pk_waystones:cmd/settings/grouped_tp/enable

# Check current setting's value
execute if score $pk.waystones.settings.grouped_tp pk.value matches 1.. run tellraw @s [{"text": "Keep Vehicle On Tp","color": "light_purple"},{"text": " setting is already set on ","color": "red"},{"text": "Enabled","color": "light_purple"}]
execute unless score $pk.waystones.settings.grouped_tp pk.value matches 1.. run tellraw @s [{"text": "Keep Vehicle On Tp","color": "light_purple"},{"text": " setting has been set on ","color": "yellow"},{"text": "Enabled","color": "light_purple"}]

# Update setting's value
scoreboard players set $pk.waystones.settings.grouped_tp pk.value 1