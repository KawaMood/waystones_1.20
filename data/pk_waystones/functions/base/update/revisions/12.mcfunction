#> pk_waystones:base/update/revisions/12

# Enable grouped teleportation setting by default
scoreboard players set $pk.waystones.settings.grouped_tp pk.value 1
# Make it takes the value that the player potentially set to the old $pk.waystones.settings.keep_vehicle_on_tp setting
execute if score $pk.waystones.settings.keep_vehicle_on_tp pk.value matches 0..1 run scoreboard players operation $pk.waystones.settings.grouped_tp pk.value = $pk.waystones.settings.keep_vehicle_on_tp pk.value