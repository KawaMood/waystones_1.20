#> pk_waystones:blocks/waystone/place/trigger
# Place a waystone and store its relative information in the blocks list

# Scores
# - Increment the component id score
scoreboard players add $next pk.custom_block.component.id 1
# - Increment current player owned waystones amount score
scoreboard players add @s pk.waystones.owned_waystones_amount 1
# - Increment waystones total amount score (redefined from each placement)
scoreboard players add $waystones.total_amount pk.value 1

# Prepare Waystone data and store the Waystone in the blocks list
function pk_waystones:blocks/waystone/place/blocks_list/store

# Set controller
execute positioned ~0.5 ~1.5 ~0.5 summon marker run function pk_waystones:blocks/waystone/place/controller_initialize

# Set name
execute if score $pk.waystones.settings.name_visibility pk.value matches 1 positioned ~0.5 ~2.3 ~0.5 summon text_display run function pk_waystones:blocks/waystone/place/name_initialize

# Set base block
setblock ~ ~ ~ barrier

# Set container block
setblock ~ ~1 ~ barrel[facing=down]{CustomName:'{"italic":false,"text":"Waystone"}',Items:[{id:"minecraft:light_gray_stained_glass_pane",Count:1b,tag:{pkCustomBlock:1b,pkGUI:1b,pkWaystone:1b,pkInUse:0b},Slot:0b}]}
data modify block ~ ~1 ~ CustomName set from storage pk.common:data Temp.Waystone.Name

# Set decorative parts relative to type
execute if data storage pk.common:data Temp.Waystone{Type:"regular"} run function pk_waystones:blocks/waystone/place/skins/regular/start
execute if data storage pk.common:data Temp.Waystone{Type:"sand"} run function pk_waystones:blocks/waystone/place/skins/sand/start
execute if data storage pk.common:data Temp.Waystone{Type:"nether"} run function pk_waystones:blocks/waystone/place/skins/nether/start
execute if data storage pk.common:data Temp.Waystone{Type:"deepslate"} run function pk_waystones:blocks/waystone/place/skins/deepslate/start

# Animations
playsound block.beacon.ambient ambient @a[distance=..30] ~ ~ ~ 1 1.75

# Debug logs
execute if score $logs.datapack.waystones pk.value matches 1 run tellraw @a[tag=pk.dev] [{"selector":"@a[tag=pk.temp.current,limit=1]","color": "gray"},{"text": " placed Waystone at ["},{"nbt":"Temp.Waystone.x","storage":"pk.common:data"},{"text": ","},{"nbt":"Temp.Waystone.y","storage":"pk.common:data"},{"text": ","},{"nbt":"Temp.Waystone.z","storage":"pk.common:data"},{"text": "]"}]