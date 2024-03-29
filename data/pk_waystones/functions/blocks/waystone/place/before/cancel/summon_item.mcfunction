#> pk_waystones:blocks/waystone/place/before/cancel/summon_item

# Summon item
scoreboard players set $drop_with_current_tag pk.temp 1
scoreboard players set $drop_with_random_motion pk.temp 0
execute if data storage pk.common:data Temp.Block.SkullOwner.Properties.textures[{Signature:"regular"}] run function pk_waystones:blocks/waystone/helpers/drop/regular
execute if data storage pk.common:data Temp.Block.SkullOwner.Properties.textures[{Signature:"deepslate"}] run function pk_waystones:blocks/waystone/helpers/drop/deepslate
execute if data storage pk.common:data Temp.Block.SkullOwner.Properties.textures[{Signature:"nether"}] run function pk_waystones:blocks/waystone/helpers/drop/nether
execute if data storage pk.common:data Temp.Block.SkullOwner.Properties.textures[{Signature:"sand"}] run function pk_waystones:blocks/waystone/helpers/drop/sand

# Prepare item
execute as @e[type=item,tag=pk.temp.current.item,limit=1,distance=..0.1] run function pk_waystones:blocks/waystone/place/before/cancel/prepare_item