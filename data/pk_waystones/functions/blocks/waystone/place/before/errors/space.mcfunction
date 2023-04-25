#> pk_waystones:blocks/waystone/place/before/errors/space

# Throw error
title @s clear
title @s actionbar {"text": "There is not enough space for the Waystone to be placed here", "color": "red"}

# Cancel process
function pk_waystones:blocks/waystone/place/before/cancel/trigger