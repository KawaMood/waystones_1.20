#> pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/chunks_list_create_recursive

# Prepare the chunk data from current element
data remove storage pk.common:data Update.Chunk
data modify storage pk.common:data Update.Chunk.Dimension set from storage pk.common:data Update.Elements[-1].Dimension
execute store result storage pk.common:data Update.Chunk.x int 16 run data get storage pk.common:data Update.Elements[-1].x 0.0625
execute store result storage pk.common:data Update.Chunk.z int 16 run data get storage pk.common:data Update.Elements[-1].z 0.0625

# Search if array contains the chunk, and if not, append it to the chunks list
data modify storage pk.common:data Update.In.Chunks set from storage pk.common:data Update.Chunks
execute store result score $length pk.temp run data get storage pk.common:data Update.In.Chunks
execute store result score $replaced_items pk.temp run data modify storage pk.common:data Update.In.Chunks[{}] set from storage pk.common:data Update.Chunk
execute if score $length pk.temp matches 0 run data modify storage pk.common:data Update.Chunks append from storage pk.common:data Update.Chunk
execute if score $length pk.temp = $replaced_items pk.temp run data modify storage pk.common:data Update.Chunks append from storage pk.common:data Update.Chunk

# Recursive call
data remove storage pk.common:data Update.Elements[-1]
execute if data storage pk.common:data Update.Elements[{}] run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/chunks_list_create_recursive