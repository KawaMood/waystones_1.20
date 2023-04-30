#> pk_waystones:base/uninstall/after_1s

# Remove custom blocks when chunks are (normally) fully loaded
execute as @e[type=marker,tag=pk.custom_block.uninstall] at @s run function pk_waystones:base/uninstall/remove_custom_block

# Remove current data pack storage
data remove storage pk.waystones:data Blocks

# Remove current data pack scores
scoreboard objectives remove pk.waystones.mined.barrel
scoreboard objectives remove pk.waystones.owned_waystones_amount
scoreboard objectives remove pk.waystones.player.leave_game
scoreboard objectives remove pk.waystones.waystone.page
scoreboard objectives remove pk.waystones.waystone.animations.delay

# Remove the current data pack from the installed PK data packs list
data remove storage pk.common:data Datapacks[{Name:"Waystones"}]

# Logs
execute unless score $logs.load pk.value matches ..0 run tellraw @a [{"text": "Uninstalled ","color": "yellow"},{"text": "PK Waystones","color": "aqua","bold": true},{"text": " successfully.\nYou can now safely remove it from the \"datapacks/\" folder of your world","color": "yellow"}]

# Remove common features if there is no PK data pack installed anymore
execute unless data storage pk.common:data Datapacks[{}] run function pk_waystones:base/uninstall/remove_common_features

# Remove installed version score
scoreboard players reset $pk.waystones.version pk.value