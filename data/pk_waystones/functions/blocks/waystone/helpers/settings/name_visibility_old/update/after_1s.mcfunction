#> pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/after_1s

# Remove custom blocks when chunks are (normally) fully loaded
execute as @e[type=marker,tag=pk.waystones.update.forceload_chunk] at @s run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/trigger

# Logs
execute unless score $logs.load pk.value matches ..0 if score $attempted.value pk.temp matches 0 run tellraw @a [{"text": "Updated ","color": "yellow"},{"text": "PK Waystones","color": "aqua","bold": true},{"text": " Name Visibility setting set to false","color": "yellow"}]
execute unless score $logs.load pk.value matches ..0 if score $attempted.value pk.temp matches 1 run tellraw @a [{"text": "Updated ","color": "yellow"},{"text": "PK Waystones","color": "aqua","bold": true},{"text": " Name Visibility setting set to true","color": "yellow"}]