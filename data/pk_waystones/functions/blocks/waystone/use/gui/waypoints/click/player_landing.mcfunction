#> pk_waystones:blocks/waystone/use/gui/waypoints/click/player_landing

# Randomly reposition player around the Waystone
function pk_waystones:packages/random/uniform
execute if score $random pk.value matches ..250 run tp @s ~-1 ~ ~ 
execute if score $random pk.value matches 251..500 run tp @s ~1 ~ ~
execute if score $random pk.value matches 501..750 run tp @s ~ ~ ~-1
execute if score $random pk.value matches 751.. run tp @s ~ ~ ~1

# Animations (landing point)
execute at @s run playsound block.portal.travel player @a[distance=..30] ~ ~ ~ 0.2 1.8
execute at @s run particle portal ~ ~1 ~ 0.5 0.5 0.5 0.001 50 force