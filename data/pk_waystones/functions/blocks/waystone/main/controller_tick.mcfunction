#> pk_waystones:blocks/waystone/main/controller_tick
# Main tick function from Waystones controllers
# Each controller_tick functions are dispatched from here

# Set scores
scoreboard players operation $temp pk.custom_block.component.id = @s pk.custom_block.component.id

# Tag controller
tag @s add pk.temp.current.controller

# Store current Waystone data
data modify storage pk.common:data Temp.Waystone set from entity @s data.Waystone

# When being used by a player
execute if entity @s[tag=pk.custom_block.in_use] run function pk_waystones:blocks/waystone/use/controller_tick

# Watch environnement (blocks, entities and light)
function pk_waystones:blocks/waystone/environment/controller_tick

# Animations
scoreboard players remove @s[scores={pk.waystones.waystone.animations.delay=1..}] pk.waystones.waystone.animations.delay 1
execute if entity @s[scores={pk.waystones.waystone.animations.delay=0}] run particle enchant ~ ~1 ~ 0.5 0.5 0.5 0.001 1 
scoreboard players set @s[scores={pk.waystones.waystone.animations.delay=0}] pk.waystones.waystone.animations.delay 5

# Free controller
tag @s remove pk.temp.current.controller