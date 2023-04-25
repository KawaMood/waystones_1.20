#> pk_waystones:blocks/waystone/helpers/drop/nether

# Summon item
summon item ~ ~ ~ {Tags:["pk.temp.current.item"],Item:{id:"minecraft:player_head",Count:1b,tag:{display:{Name:'{"text":"Waystone","italic": false,"color": "yellow"}',Lore:['{"text":"Waystone","italic": false,"color": "gray"}']},HideFlags:1,pkCustomBlockPlacer:1b,pkWaystone:1b,pkNetherWaystone:1b,SkullOwner:{Name:"%pk.custom_block.waystone",Id:[I;16,11,3,2],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZjYzNDdmNmUxNTdmMDMxNjdiNDhiZjc5YzVmMDIwMDRlMTNlODkwNGE2OWFkNjgwZTJkN2ZlOTI3Mjg4ZDg5ZiJ9fX0=",Signature:"nether"}]}},RepairCost:0,CustomModelData:16110034}}}

# Set motion if needed
execute if score $drop_with_random_motion pk.temp matches 1 as @e[type=item,tag=pk.temp.current.item,limit=1,distance=..0.1] run function pk_waystones:blocks/waystone/helpers/drop/set_motion

# Remove the current tag if unused
execute unless score $drop_with_current_tag pk.temp matches 1 run tag @e[type=item,tag=pk.temp.current.item,limit=1,distance=..0.1] remove pk.temp.current.item