#> pk_waystones:blocks/waystone/use/gui/menu/waypoint_protection_disable/success

# Prepare data
data modify storage pk.common:data Temp.Updated.Waystone set from entity @s data.Waystone
data modify storage pk.common:data Temp.Updated.Waystone.Waypoint.tag.pkData.Protected set value 0b

# Update Waystone
tag @s remove pk.waystones.state.protected
tag @s add pk.waystones.state.unprotected
data modify entity @s data.Waystone set from storage pk.common:data Temp.Updated.Waystone

# Update Block Info
function pk_waystones:blocks/waystone/helpers/blocks_list/update

# Animations
playsound block.beacon.power_select block @a[tag=pk.temp.current,limit=1] ~ ~ ~ 0.8 1.8