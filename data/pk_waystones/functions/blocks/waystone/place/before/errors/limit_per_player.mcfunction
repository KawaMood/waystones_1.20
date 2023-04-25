#> pk_waystones:blocks/waystone/place/before/errors/limit_per_player

# Throw error
title @s clear
title @s actionbar {"text": "You placed too many Waystones", "color": "red"}

# Cancel process
function pk_waystones:blocks/waystone/place/before/cancel/trigger