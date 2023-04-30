#> pk_waystones:blocks/waystone/place/blocks_list/store
# Store the Waystone info from the controller

# Clear storage
data remove storage pk.common:data Temp.Waystone

# Set component score id
execute store result storage pk.common:data Temp.Waystone.id int 1 run scoreboard players get $next pk.custom_block.component.id

# Set version
execute store result storage pk.common:data Temp.Waystone.Version int 1 run scoreboard players get $pk.waystones.version pk.value

# Set type and name from item used by player
data modify storage pk.common:data Temp.Waystone.Type set from storage pk.common:data Temp.Item.tag.SkullOwner.Properties.textures[0].Signature
data modify storage pk.common:data Temp.Waystone.Name set from storage pk.common:data Temp.Item.tag.display.Name

# Set owner data
data modify storage pk.common:data Temp.Waystone.Owner.UUID set from entity @a[tag=pk.temp.current,distance=..10,limit=1] UUID
execute store result storage pk.common:data Temp.Waystone.Owner.id int 1 run scoreboard players get @a[tag=pk.temp.current,distance=..10,limit=1] pk.player.id

# Set coordinates
data modify storage pk.common:data Temp.Waystone.x set from storage pk.common:data Temp.Block.x
data modify storage pk.common:data Temp.Waystone.y set from storage pk.common:data Temp.Block.y
data modify storage pk.common:data Temp.Waystone.z set from storage pk.common:data Temp.Block.z

# Set dimension
function pk_waystones:blocks/waystone/place/blocks_list/set_dimension_id

# Set Waypoint render item
execute summon armor_stand run function pk_waystones:blocks/waystone/place/blocks_list/set_waypoint

# Store current block's info into the list
data modify storage pk.waystones:data Blocks.Waystones append from storage pk.common:data Temp.Waystone