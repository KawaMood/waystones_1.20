#> pk_waystones:blocks/waystone/helpers/drop/set_motion

# Prepare a default motion
data modify storage pk.common:data Temp.Entity.Motion set value [0.0d,0.1d,0.0d]

# Set a random motion from -0.1d to 0.1d for X and Z axis Motion
scoreboard players set $random_max pk.value 20
function pk_waystones:packages/random/uniform
scoreboard players remove $random pk.value 10
execute store result storage pk.common:data Temp.Entity.Motion[0] double 0.01 run scoreboard players get $random pk.value
function pk_waystones:packages/random/uniform
scoreboard players remove $random pk.value 10
execute store result storage pk.common:data Temp.Entity.Motion[2] double 0.01 run scoreboard players get $random pk.value
data modify entity @s Motion set from storage pk.common:data Temp.Entity.Motion

# (Reset random max to original value)
scoreboard players set $random_max pk.value 1000

# Air toggling
function pk_waystones:packages/air_toggling/context_prepare