#> pk_waystones:blocks/waystone/use/gui/polluters/return_item_to_player

summon item ~ ~ ~ {Tags:["pk.temp.current.item"],Item:{id:"minecraft:stick",Count:1b},PickupDelay:0s}
data modify entity @e[type=item,tag=pk.temp.current.item,distance=..0.1,limit=1] Item set from storage pk.common:data Temp.GUI.Polluters[-1]
tag @e[type=item,tag=pk.temp.current.item,distance=..0.1,limit=1] remove pk.temp.current.item