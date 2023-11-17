#> pk_waystones:blocks/waystone/helpers/drop/set_motion

# Prepare a default motion
data modify storage pk.common:data Temp.Entity.Motion set value [0.0d,0.1d,0.0d]

# Set a random motion from -0.1d to 0.1d for X and Z axis Motion
execute store result score $random pk.value run random value 0..20
scoreboard players remove $random pk.value 10
execute store result storage pk.common:data Temp.Entity.Motion[0] double 0.01 run scoreboard players get $random pk.value
execute store result score $random pk.value run random value 0..20
scoreboard players remove $random pk.value 10
execute store result storage pk.common:data Temp.Entity.Motion[2] double 0.01 run scoreboard players get $random pk.value
data modify entity @s Motion set from storage pk.common:data Temp.Entity.Motion

# Air toggling
function pk_waystones:packages/air_toggling/context_prepare