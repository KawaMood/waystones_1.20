#> pk_waystones:blocks/waystone/use/gui/waypoints/click/vanilla_dim/start

# Logs
execute if score $logs.datapack.waystones pk.value matches 1 run tellraw @a[tag=pk.dev] [{"text":"trigger vanilla dimension process","color":"gray"}]

# Mark the process as started
scoreboard players set $process_started pk.temp 1

# Summon marker
execute summon marker run function pk_waystones:blocks/waystone/use/gui/waypoints/click/vanilla_dim/marker_prepare