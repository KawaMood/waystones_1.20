#> pk_waystones:base/uninstall/remove_specific_features
# Specific: remove features

# Remove current data pack storage
data remove storage pk.waystones:data Blocks

# Remove the current data pack from the installed PK data packs list
data remove storage pk.common:data Datapacks[{Name:"Waystones"}]

# Remove scores
scoreboard objectives remove pk.waystones.mined.barrel
scoreboard objectives remove pk.waystones.owned_waystones_amount
scoreboard objectives remove pk.waystones.player.leave_game
scoreboard objectives remove pk.waystones.player.setting.hide_coordinates
scoreboard objectives remove pk.waystones.waystone.page
scoreboard objectives remove pk.waystones.waystone.animations.delay

# Remove installed version score
scoreboard players reset $pk.waystones.version pk.value