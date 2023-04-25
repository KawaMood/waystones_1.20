#> pk_waystones:blocks/waystone/helpers/refresh_container

setblock ~ ~ ~ air
setblock ~ ~ ~ barrel[facing=down]{CustomName:'{"italic":false,"text":"Waystone"}',Items:[{id:"minecraft:light_gray_stained_glass_pane",Count:1b,tag:{pkCustomBlock:1b,pkGUI:1b,pkWaystone:1b,pkInUse:0b},Slot:0b}]}
data modify block ~ ~ ~ CustomName set from entity @s data.Waystone.Name