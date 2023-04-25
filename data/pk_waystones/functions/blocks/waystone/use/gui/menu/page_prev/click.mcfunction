#> pk_waystones:blocks/waystone/use/gui/menu/page_prev/click

# Reduce score
scoreboard players remove @s pk.waystones.waystone.page 1

# Logs
execute if score $logs.datapack.waystones pk.value matches 1 run tellraw @a[tag=pk.dev] [{"selector":"@a[tag=pk.temp.current,limit=1]","color": "gray"},{"text": " clicked \"previous page\" button"}]