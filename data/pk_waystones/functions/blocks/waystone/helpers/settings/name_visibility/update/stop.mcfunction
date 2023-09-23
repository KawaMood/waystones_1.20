#> pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/stop

# Logs
execute if score $attempted.value pk.temp matches 0 run tellraw @a[tag=pk.updater] [{"text": "Name Visibility","color": "light_purple"},{"text": " setting has been set on ","color": "yellow"},{"text": "Hide","color": "light_purple"}]
execute if score $attempted.value pk.temp matches 1 run tellraw @a[tag=pk.updater] [{"text": "Name Visibility","color": "light_purple"},{"text": " setting has been set on ","color": "yellow"},{"text": "Show","color": "light_purple"}]

# Free player
tag @a[tag=pk.updater] remove pk.updater