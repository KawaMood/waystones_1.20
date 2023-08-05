#> pk_waystones:blocks/waystone/use/gui/waypoints/click/player_landing

# Randomly reposition player around the Waystone
function pk_waystones:packages/random/uniform
# - If the player has no vehicle
execute if score $has_vehicle pk.temp matches 0 if score $random pk.value matches ..250 run tp @s ~-1 ~ ~ 
execute if score $has_vehicle pk.temp matches 0 if score $random pk.value matches 251..500 run tp @s ~1 ~ ~
execute if score $has_vehicle pk.temp matches 0 if score $random pk.value matches 501..750 run tp @s ~ ~ ~-1
execute if score $has_vehicle pk.temp matches 0 if score $random pk.value matches 751.. run tp @s ~ ~ ~1
# - If the player has a vehicle
execute unless score $has_vehicle pk.temp matches 0 if score $random pk.value matches ..250 run tp @s ~-2 ~ ~ 
execute unless score $has_vehicle pk.temp matches 0 if score $random pk.value matches 251..500 run tp @s ~2 ~ ~
execute unless score $has_vehicle pk.temp matches 0 if score $random pk.value matches 501..750 run tp @s ~ ~ ~-2
execute unless score $has_vehicle pk.temp matches 0 if score $random pk.value matches 751.. run tp @s ~ ~ ~2

# If the player had vehicle
execute unless score $has_vehicle pk.temp matches 0 at @s run function pk_waystones:blocks/waystone/use/gui/waypoints/click/player_landing_mount_vehicle

# Animations (landing point)
execute at @s run playsound block.portal.travel player @a[distance=..30] ~ ~ ~ 0.2 1.8
execute at @s run particle portal ~ ~1 ~ 0.5 0.5 0.5 0.001 50 force