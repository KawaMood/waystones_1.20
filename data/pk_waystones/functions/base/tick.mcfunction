#> pk_waystones:base/tick
# Main tick

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Custom blocks:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
# Waystone
execute as @e[type=marker,tag=pk.waystones.waystone.controller] at @s run function pk_waystones:blocks/waystone/main/controller_tick

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Actions:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
# Player joined back
execute as @a[scores={pk.waystones.player.leave_game=1..}] run function pk_waystones:actions/player_joined_back/trigger
# Player mined barrel
scoreboard players set @a[scores={pk.waystones.mined.barrel=1..}] pk.waystones.mined.barrel 0