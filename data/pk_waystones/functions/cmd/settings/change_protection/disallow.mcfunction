#> pk_waystones:cmd/settings/change_protection/disallow

# Check current setting's value
execute if score $pk.waystones.settings.allow_protection_change pk.value matches ..0 run tellraw @s [{"text": "Change Protection","color": "light_purple"},{"text": " setting is already set on ","color": "red"},{"text": "Disallow","color": "light_purple"}]
execute unless score $pk.waystones.settings.allow_protection_change pk.value matches ..0 run tellraw @s [{"text": "Change Protection","color": "light_purple"},{"text": " setting has been set on ","color": "yellow"},{"text": "Disallow","color": "light_purple"}]

# Update setting's value
scoreboard players set $pk.waystones.settings.allow_protection_change pk.value 0