#> pk_waystones:blocks/waystone/actions/craft/trigger/deepslate

# Remove advancement and recipe
advancement revoke @s only pk_waystones:interactions/crafted_deepslate_waystone
recipe take @s pk_waystones:deepslate_waystone

# Check if the player crafted a knowledge book
execute if entity @s[scores={pk.crafted.knowledge_book=1..}] store result score %crafted_amount pk.temp run clear @s knowledge_book
execute if score %crafted_amount pk.temp matches 1.. run function pk_waystones:blocks/waystone/actions/craft/recursive_give/deepslate