#> pk_waystones:blocks/waystone/use/gui/waypoints/click/trigger

# Search the clicked waypoint
function pk_waystones:blocks/waystone/use/gui/waypoints/click/search

# Prepare marker to the Waystone location
execute summon marker run function pk_waystones:blocks/waystone/use/gui/waypoints/click/teleport

# Logs
execute if score $logs.datapack.waystones pk.value matches 1 run tellraw @a[tag=pk.dev] [{"selector":"@a[tag=pk.temp.current,limit=1]","color": "gray"},{"text": " clicked \"waypoint\" button"}]