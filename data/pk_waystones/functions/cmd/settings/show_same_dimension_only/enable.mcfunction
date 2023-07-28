#> pk_waystones:cmd/settings/show_same_dimension_only/enable

# Check current setting's value
execute if score $pk.waystones.settings.show_same_dimension_only pk.value matches 1.. run tellraw @s [{"text": "Show Same Dimension Only","color": "light_purple"},{"text": " setting is already set on ","color": "red"},{"text": "Enabled","color": "light_purple"}]
execute unless score $pk.waystones.settings.show_same_dimension_only pk.value matches 1.. run tellraw @s [{"text": "Show Same Dimension Only","color": "light_purple"},{"text": " setting has been set on ","color": "yellow"},{"text": "Enabled","color": "light_purple"}]

# Update setting's value
scoreboard players set $pk.waystones.settings.show_same_dimension_only pk.value 1