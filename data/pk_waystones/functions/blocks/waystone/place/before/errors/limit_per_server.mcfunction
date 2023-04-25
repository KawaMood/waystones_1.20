#> pk_waystones:blocks/waystone/place/before/errors/limit_per_server

# Throw error
title @s clear
title @s actionbar {"text": "There are too many Waystones in this world", "color": "red"}

# Cancel process
function pk_waystones:blocks/waystone/place/before/cancel/trigger