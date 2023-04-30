#> pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/remove_custom_block

# Remove block container and all id-matching components
setblock ~ ~ ~ air
setblock ~ ~1 ~ air
kill @e[type=#pk_waystones:custom_block/components,tag=pk.waystones.waystone.component,distance=..10]

# Unload the targeted chunk
forceload remove ~ ~

# Remove the current entity
kill @s