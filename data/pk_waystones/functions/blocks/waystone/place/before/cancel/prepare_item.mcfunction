#> pk_waystones:blocks/waystone/place/before/cancel/prepare_item

data modify entity @s Item.tag.SkullOwner set from storage pk.common:data Temp.Block.SkullOwner
data modify entity @s PickupDelay set value 0s
tag @s remove pk.temp.current.item