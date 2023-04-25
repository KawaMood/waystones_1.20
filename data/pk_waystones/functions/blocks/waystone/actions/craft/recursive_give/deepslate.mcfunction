#> pk_waystones:blocks/waystone/actions/craft/recursive_give/deepslate
# Recusrsively give a deepslate Waystone

function pk_waystones:blocks/waystone/helpers/give/deepslate
scoreboard players remove %crafted_amount pk.temp 1
execute if score %crafted_amount pk.temp matches 1.. run function pk_waystones:blocks/waystone/actions/craft/recursive_give/deepslate