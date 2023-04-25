#> pk_waystones:blocks/waystone/helpers/update/1_20_rotation/after_1s

# Remove custom blocks when chunks are (normally) fully loaded
execute as @e[type=marker,tag=pk.waystones.update.forceload_chunk] at @s run function pk_waystones:blocks/waystone/helpers/update/1_20_rotation/trigger

# Logs
execute unless score $logs.load pk.value matches ..0 run tellraw @a [{"text": "Updated ","color": "yellow"},{"text": "PK Waystones","color": "aqua","bold": true},{"text": " item displays rotations for 1.20 updated successfully","color": "yellow"}]