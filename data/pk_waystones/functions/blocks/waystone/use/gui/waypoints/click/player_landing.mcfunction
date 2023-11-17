#> pk_waystones:blocks/waystone/use/gui/waypoints/click/player_landing

# Randomly reposition player around the Waystone
execute store result score $random pk.value run random value 1..1000
# Without vehicle
execute if score $has_vehicle pk.temp matches 0 if score $random pk.value matches ..250 run tp @s ~-1 ~ ~ 
execute if score $has_vehicle pk.temp matches 0 if score $random pk.value matches 251..500 run tp @s ~1 ~ ~
execute if score $has_vehicle pk.temp matches 0 if score $random pk.value matches 501..750 run tp @s ~ ~ ~-1
execute if score $has_vehicle pk.temp matches 0 if score $random pk.value matches 751.. run tp @s ~ ~ ~1
# With vehicle
execute if score $has_vehicle pk.temp matches 1 if score $random pk.value matches ..250 run tp @s ~-2 ~ ~ 
execute if score $has_vehicle pk.temp matches 1 if score $random pk.value matches 251..500 run tp @s ~2 ~ ~
execute if score $has_vehicle pk.temp matches 1 if score $random pk.value matches 501..750 run tp @s ~ ~ ~-2
execute if score $has_vehicle pk.temp matches 1 if score $random pk.value matches 751.. run tp @s ~ ~ ~2
# Leashed mobs
execute if score $has_leashed_mobs pk.temp matches 1 if score $random pk.value matches ..250 run tp @e[tag=pk.temp.current.leashed] ~-2 ~ ~ 
execute if score $has_leashed_mobs pk.temp matches 1 if score $random pk.value matches 251..500 run tp @e[tag=pk.temp.current.leashed] ~2 ~ ~
execute if score $has_leashed_mobs pk.temp matches 1 if score $random pk.value matches 501..750 run tp @e[tag=pk.temp.current.leashed] ~ ~ ~-2
execute if score $has_leashed_mobs pk.temp matches 1 if score $random pk.value matches 751.. run tp @e[tag=pk.temp.current.leashed] ~ ~ ~2

# If the player had vehicle
execute unless score $has_vehicle pk.temp matches 0 run schedule function pk_waystones:blocks/waystone/use/gui/waypoints/click/vehicle/scheduled_ride_set_context 2t

# Animations (landing point)
execute at @s run playsound block.portal.travel player @a[distance=..30] ~ ~ ~ 0.2 1.8
execute at @s run particle portal ~ ~1 ~ 0.5 0.5 0.5 0.001 50 force