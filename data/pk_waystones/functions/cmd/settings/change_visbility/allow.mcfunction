#> pk_waystones:cmd/settings/change_visbility/allow

# Check current setting's value
execute if score $pk.waystones.settings.allow_visibility_change pk.value matches 1.. run tellraw @s [{"text": "Change Visibility","color": "light_purple"},{"text": " setting is already set on ","color": "red"},{"text": "Allow","color": "light_purple"}]
execute unless score $pk.waystones.settings.allow_visibility_change pk.value matches 1.. run tellraw @s [{"text": "Change Visibility","color": "light_purple"},{"text": " setting has been set on ","color": "yellow"},{"text": "Allow","color": "light_purple"}]

# Update setting's value
scoreboard players set $pk.waystones.settings.allow_visibility_change pk.value 1