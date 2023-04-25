#> pk_waystones:blocks/waystone/place/before/cancel/trigger

scoreboard players set $stop pk.temp 1

# Give back item to player (except if it is on creative mode)
execute at @s[gamemode=!creative] run function pk_waystones:blocks/waystone/place/before/cancel/summon_item

# Remove block
setblock ~ ~ ~ air