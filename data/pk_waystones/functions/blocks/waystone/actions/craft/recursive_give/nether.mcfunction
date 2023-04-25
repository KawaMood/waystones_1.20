#> pk_waystones:blocks/waystone/actions/craft/recursive_give/nether
# Recusrsively give a nether Waystone

function pk_waystones:blocks/waystone/helpers/give/nether
scoreboard players remove %crafted_amount pk.temp 1
execute if score %crafted_amount pk.temp matches 1.. run function pk_waystones:blocks/waystone/actions/craft/recursive_give/nether