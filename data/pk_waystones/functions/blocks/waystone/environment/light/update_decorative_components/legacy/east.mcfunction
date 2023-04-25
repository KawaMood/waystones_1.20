#> pk_waystones:blocks/waystone/environment/light/update_decorative_components/legacy/east

# Change position
tp @s ~ ~ ~

# Change transformation.translation offsets
execute if entity @s[tag=pk.part.middle.legacy] run data modify entity @s transformation.translation set value [-0.5005f,0.4995f,0.4995f]