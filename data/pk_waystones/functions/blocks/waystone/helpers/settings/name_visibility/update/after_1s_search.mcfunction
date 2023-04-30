#> pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/after_1s_search

# Remove custom blocks when chunks are (normally) fully loaded
execute as @e[type=marker,tag=pk.custom_block.update] at @s run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/after_1s_trigger

# Logs
execute unless score $logs.load pk.value matches ..0 if score $attempted.value pk.temp matches 0 run tellraw @a [{"text": "Updated ","color": "yellow"},{"text": "PK Waystones","color": "aqua","bold": true},{"text": " "},{"text": "Name Visibility","color": "light_purple"},{"text": " setting set to ","color": "yellow"},{"text": "Hide","color": "light_purple"}]
execute unless score $logs.load pk.value matches ..0 if score $attempted.value pk.temp matches 1 run tellraw @a [{"text": "Updated ","color": "yellow"},{"text": "PK Waystones","color": "aqua","bold": true},{"text": " "},{"text": "Name Visibility","color": "light_purple"},{"text": " setting set to ","color": "yellow"},{"text": "Show","color": "light_purple"}]