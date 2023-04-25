#> pk_waystones:blocks/waystone/helpers/settings/name_visibility/hide

# Attempted value
scoreboard players set $attempted.value pk.temp 0

# Check current setting's value
execute unless score $pk.waystones.settings.name_visibility pk.value matches 1 run tellraw @a {"text": "The Name Visbility setting is already set to \"hide\"","color": "red"}
execute if score $pk.waystones.settings.name_visibility pk.value matches 1 run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/start

# Update setting's value
scoreboard players set $pk.waystones.settings.name_visibility pk.value 0