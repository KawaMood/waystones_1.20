#> pk_waystones:packages/air_toggling/context_trigger

# (Need to get the prefix of the current data pack in tag to avoid being ticked by other data packs)
scoreboard players remove @s pk.waystones.air_toggling 1
execute store result entity @s Air short 1 run time query gametime 
execute if entity @s[scores={pk.air_toggling=1..}] run schedule function pk_waystones:packages/air_toggling/context_search 1t replace
tag @s[scores={pk.air_toggling=0}] remove pk.waystones.air_toggling