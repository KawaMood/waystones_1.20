#> pk_waystones:base/update/start
# Update the current data pack if needed

# Update depending on the current version 
# - Changes from V.2.0.4
execute if score $pk.waystones.version pk.value matches ..4 run function pk_waystones:base/update/revisions/4

# Set the data pack current version score
scoreboard players set $pk.waystones.version pk.value 5
data modify storage pk.common:data Datapacks[{Name:"Waystones"}].Version set value "2.0.4"