#> pk_waystones:blocks/waystone/actions/craft/recursive_give/regular
# Recusrsively give a regular Waystone

function pk_waystones:blocks/waystone/helpers/give/regular
scoreboard players remove %crafted_amount pk.temp 1
execute if score %crafted_amount pk.temp matches 1.. run function pk_waystones:blocks/waystone/actions/craft/recursive_give/regular