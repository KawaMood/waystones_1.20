#> pk_waystones:base/uninstall/helpers/remove_waystone

# Set scores
scoreboard players operation $temp pk.custom_block.component.id = @s pk.custom_block.component.id

# Remove block
setblock ~ ~-1 ~ air
setblock ~ ~ ~ air

# Remove entities
kill @e[type=#pk_waystones:custom_block/components,tag=pk.waystones.waystone.component,predicate=pk_waystones:scores/custom_block/component_id_matching,distance=..20]

# Remove forceload
forceload remove ~ ~