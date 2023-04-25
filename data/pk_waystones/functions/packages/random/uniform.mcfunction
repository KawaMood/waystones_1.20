#> pk_waystones:packages/random/uniform
# Originaly from Aeldrion's Minecraft-Random data pack
# Github: https://github.com/Aeldrion/Minecraft-Random/

# Calculate size of range
scoreboard players operation $size pk.temp = $random_max pk.value
scoreboard players operation $size pk.temp -= $random_min pk.value
scoreboard players add $size pk.temp 1

# Xn+1 = (aXn + c) mod m
scoreboard players operation $lcg pk.value *= $lcg_a pk.value
scoreboard players operation $lcg pk.value += $lcg_c pk.value
scoreboard players operation $lcg pk.value %= $lcg_m pk.value

# Trim "low quality" bits
scoreboard players operation $random pk.value = $lcg pk.value
scoreboard players operation $random pk.value /= $8 pk.value

# Get within desired range
scoreboard players operation $random pk.value %= $size pk.temp
scoreboard players operation $random pk.value += $random_min pk.value