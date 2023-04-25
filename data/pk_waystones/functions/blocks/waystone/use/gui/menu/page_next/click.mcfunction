#> pk_waystones:blocks/waystone/use/gui/menu/page_next/click

# Increment score
scoreboard players add @s pk.waystones.waystone.page 1

# Logs
execute if score $logs.datapack.waystones pk.value matches 1 run tellraw @a[tag=pk.dev] [{"selector":"@a[tag=pk.temp.current,limit=1]","color": "gray"},{"text": " clicked \"next page\" button"}]