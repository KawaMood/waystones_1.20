#> pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/in_custom_dimension/forceload
# Change position and forceload chunk

data modify entity @s Pos set from entity @s data.Pos
execute at @s store result score $already_forceloaded pk.temp run forceload query ~ ~
execute at @s if score $already_forceloaded pk.temp matches 0 run forceload add ~ ~