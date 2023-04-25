#> pk_waystones:blocks/waystone/actions/right_click_on_lock_interaction/switch

# Run commands depending on the lock_interaction type
# - In use
execute if entity @s[tag=pk.waystones.waystone.lock_interaction.in_use] run title @a[tag=pk.temp.current,limit=1,distance=..16] actionbar "This Waystone is currently used by someone else"
# - Monsters nearby
execute if entity @s[tag=pk.waystones.waystone.lock_interaction.monsters_nearby] run title @a[tag=pk.temp.current,limit=1,distance=..16] actionbar "You may not use the Waystone now; there are monsters nearby"

# Remove the interacted by player data
data remove entity @s interaction.player