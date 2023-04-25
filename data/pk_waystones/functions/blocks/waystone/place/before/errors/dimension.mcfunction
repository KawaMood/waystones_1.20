#> pk_waystones:blocks/waystone/place/before/errors/dimension

# Throw error
title @s clear
title @s actionbar {"text": "Waystones can't be placed in this dimension", "color": "red"}

# Cancel process
function pk_waystones:blocks/waystone/place/before/cancel/trigger