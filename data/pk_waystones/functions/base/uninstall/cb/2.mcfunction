#> pk_waystones:base/uninstall/cb/2
# Prepare command for the CB 3 and schedule the function that remove block

# Parse the desired command and put it
data modify block -3000 66 1611 Command set string block -3000 64 1611 LastOutput 91 -38

# Remove armor stand
kill 4558265a-f8b6-4b43-9ca2-fc4ca8d43d5e

# Remove block some ticks after (chunk loading)
schedule function pk_waystones:base/uninstall/helpers/scheduled_remove_block_set_context 40t append