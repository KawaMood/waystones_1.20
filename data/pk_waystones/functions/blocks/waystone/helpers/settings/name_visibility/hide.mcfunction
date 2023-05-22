#> pk_waystones:blocks/waystone/helpers/settings/name_visibility/hide

# Attempted value
scoreboard players set $attempted.value pk.temp 0

# Check current setting's value
execute unless score $pk.waystones.settings.name_visibility pk.value matches 1 run tellraw @s [{"text": "Name Visibility","color": "light_purple"},{"text": " setting is already set on ","color": "red"},{"text": "Hide","color": "light_purple"}]
execute if score $pk.waystones.settings.name_visibility pk.value matches 1 run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/start

# Update setting's value
scoreboard players set $pk.waystones.settings.name_visibility pk.value 0