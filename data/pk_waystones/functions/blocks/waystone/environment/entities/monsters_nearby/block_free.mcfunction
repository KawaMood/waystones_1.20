#> pk_waystones:blocks/waystone/environment/entities/monsters_nearby/block_free

tag @s remove pk.custom_block.lock.monsters_nearby

execute align xyz run kill @e[type=interaction,tag=pk.waystones.waystone.lock_interaction.monsters_nearby,dx=0,predicate=pk_waystones:scores/custom_block/component_id_matching,limit=1]