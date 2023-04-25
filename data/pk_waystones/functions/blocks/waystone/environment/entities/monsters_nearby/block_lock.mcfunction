#> pk_waystones:blocks/waystone/environment/entities/monsters_nearby/block_lock

tag @s add pk.custom_block.lock.monsters_nearby

execute align xyz positioned ~0.4995 ~-0.0005 ~0.4995 summon interaction run function pk_waystones:blocks/waystone/environment/entities/monsters_nearby/lock_interaction_initialize