#> pk_waystones:blocks/waystone/environment/light/update_decorative_components/top

# Change position
tp @s ~ ~ ~

# Change transformation.translation offsets
execute if entity @s[tag=pk.part.middle.1] run data modify entity @s transformation.translation set value [0.2495f,-0.5005f,0.2495f]
execute if entity @s[tag=pk.part.middle.2] run data modify entity @s transformation.translation set value [0.7505f,-0.5005f,0.2495f]
execute if entity @s[tag=pk.part.middle.3] run data modify entity @s transformation.translation set value [0.7505f,-0.5005f,0.7505f]
execute if entity @s[tag=pk.part.middle.4] run data modify entity @s transformation.translation set value [0.2495f,-0.5005f,0.7505f]
execute if entity @s[tag=pk.part.middle.5] run data modify entity @s transformation.translation set value [0.2495f,0.0005f,0.2495f]
execute if entity @s[tag=pk.part.middle.6] run data modify entity @s transformation.translation set value [0.7505f,0.0005f,0.2495f]
execute if entity @s[tag=pk.part.middle.7] run data modify entity @s transformation.translation set value [0.7505f,0.0005f,0.7505f]
execute if entity @s[tag=pk.part.middle.8] run data modify entity @s transformation.translation set value [0.2495f,0.0005f,0.7505f]