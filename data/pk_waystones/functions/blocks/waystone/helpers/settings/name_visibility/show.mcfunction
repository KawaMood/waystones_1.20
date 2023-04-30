#> pk_waystones:blocks/waystone/helpers/settings/name_visibility/show

# Attempted value
scoreboard players set $attempted.value pk.temp 1

# Check current setting's value
execute if score $pk.waystones.settings.name_visibility pk.value matches 1 run tellraw @a [{"text": "Name Visibility","color": "light_purple"},{"text": " setting is already set on ","color": "red"},{"text": "Show","color": "light_purple"}]
execute unless score $pk.waystones.settings.name_visibility pk.value matches 1 run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/start

# Update setting's value
scoreboard players set $pk.waystones.settings.name_visibility pk.value 1