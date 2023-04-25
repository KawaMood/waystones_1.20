#> pk_waystones:blocks/waystone/remove/blocks_list/remove_recursive

# If the component id of the current item matches the component id of the block to remove, don't prepend it to the new array
data modify storage pk.common:data Temp.Array.Item set from storage pk.common:data Temp.Array.Search[-1]
execute store result score $item pk.custom_block.component.id run data get storage pk.common:data Temp.Array.Search[-1].id
execute unless score $temp pk.custom_block.component.id = $item pk.custom_block.component.id run data modify storage pk.common:data Temp.Array.New prepend from storage pk.common:data Temp.Array.Item

# Recursive call
data remove storage pk.common:data Temp.Array.Search[-1] 
execute if data storage pk.common:data Temp.Array.Search[{}] run function pk_waystones:blocks/waystone/remove/blocks_list/remove_recursive