#> pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/in_vanilla_dimension/start

# Place entity at the right position
data modify storage pk.common:data Temp.Pos set value [0d,0d,0d]
execute store result storage pk.common:data Temp.Pos[0] double 1 run data get storage pk.common:data Temp.Array.Item.x
execute store result storage pk.common:data Temp.Pos[1] double 1 run data get storage pk.common:data Temp.Array.Item.y
execute store result storage pk.common:data Temp.Pos[2] double 1 run data get storage pk.common:data Temp.Array.Item.z
data modify entity @s Pos set from storage pk.common:data Temp.Pos

# Relocate the execution depending on the dimension
execute if score $temp pk.dimension.id matches -1 in minecraft:the_nether positioned as @s run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/in_vanilla_dimension/forceload
execute if score $temp pk.dimension.id matches 0 in minecraft:overworld positioned as @s run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/in_vanilla_dimension/forceload
execute if score $temp pk.dimension.id matches 1 in minecraft:the_end positioned as @s run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/in_vanilla_dimension/forceload