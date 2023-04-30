#> pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/marker_summon_recursive

# Store the current item
data modify storage pk.common:data Temp.Array.Item set from storage pk.common:data Temp.Array.Search[-1]

# Summon marker
execute summon marker run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/marker_initialize

# Recursive call
data remove storage pk.common:data Temp.Array.Search[-1]
execute if data storage pk.common:data Temp.Array.Search[{}] run function pk_waystones:blocks/waystone/helpers/settings/name_visibility/update/marker_summon_recursive