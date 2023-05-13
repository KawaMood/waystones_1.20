# Remove current data pack storage
data remove storage pk.waystones:data Blocks

# Remove current data pack scores

# Remove the current data pack from the installed PK data packs list
data remove storage pk.common:data Datapacks[{Name:"Attempt"}]

# Remove installed version score
scoreboard players reset $pk.waystones.version pk.value