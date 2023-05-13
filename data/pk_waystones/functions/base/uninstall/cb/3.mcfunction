#> pk_waystones:base/uninstall/cb/3

execute store result score $forceload pk.temp run forceload query ~ ~
execute if score $forceload pk.temp matches 0 run forceload add ~ ~

tellraw @a[tag=pk.dev] [{"text":"Loading chunk in ","color":"gray"},{"nbt":"Uninstall.Array.Item.Dimension","storage":"pk.common:data"},{"text": " at ["},{"nbt":"Uninstall.Array.Item.x","storage":"pk.common:data"},{"text":","},{"nbt":"Uninstall.Array.Item.y","storage":"pk.common:data"},{"text":","},{"nbt":"Uninstall.Array.Item.z","storage":"pk.common:data"},{"text": "]"}]