#> pk_waystones:blocks/waystone/environment/controller_tick
# Monitor adjacent/current block(s) and near entities
# Adjacent hoppers and droppers are checked when a player place one within advancements

# Set scores
scoreboard players set $stop pk.temp 0

# Check if a block of the Waystone has been destroyed
execute unless predicate pk_waystones:gameplay/waystone/is_complete run function pk_waystones:blocks/waystone/remove/before/check

# Remove hopper minecarts being at range to draw items from the container block
execute if score $stop pk.temp matches 0 positioned ~-0.5 ~-2.01 ~-0.5 as @e[type=hopper_minecart,dy=1.01] at @s run function pk_waystones:blocks/waystone/environment/entities/hopper_minecart_remove

# Check if there are hostile mobs nearby
execute if score %pk.waystones.settings.ignore_monsters pk.value matches ..0 run function pk_waystones:blocks/waystone/environment/entities/monsters_nearby/check

# Light update
execute unless score $custom_block.light_update pk.value matches 0 run function pk_waystones:blocks/waystone/environment/light/controller_check