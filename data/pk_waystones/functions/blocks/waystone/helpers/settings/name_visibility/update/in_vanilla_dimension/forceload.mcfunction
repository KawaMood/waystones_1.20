#> pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/in_vanilla_dimension/forceload

execute store result score $already_forceloaded pk.temp run forceload query ~ ~
execute if score $already_forceloaded pk.temp matches 0 run forceload add ~ ~
tp @s ~ ~ ~