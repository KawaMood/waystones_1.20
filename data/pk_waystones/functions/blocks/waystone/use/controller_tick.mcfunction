#> pk_waystones:blocks/waystone/use/controller_tick

# Set scores
scoreboard players operation $temp pk.custom_block.interaction.id = @s pk.custom_block.interaction.id
scoreboard players set $stop pk.temp 0

tag @s add pk.temp.current.controller

# Retrieve user
tag @a[predicate=pk_waystones:scores/custom_block/interaction_id_matching,limit=1] add pk.temp.current

# Check GUI
function pk_waystones:blocks/waystone/use/gui/check

# If the container is closed: stop the process
execute if block ~ ~ ~ barrel[open=false] run function pk_waystones:blocks/waystone/use/on_stop/trigger

# If no player close anymore but block_state open blocked on true (potential issue on some external-tool based services)
execute if score $stop pk.temp matches 0 unless entity @a[tag=pk.temp.current,distance=..10,limit=1] if block ~ ~ ~ barrel[open=true] run function pk_waystones:blocks/waystone/use/on_stop/trigger

# Free user
tag @a[tag=pk.temp.current,limit=1] remove pk.temp.current
tag @s remove pk.temp.current.controller