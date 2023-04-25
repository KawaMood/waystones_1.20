#> pk_waystones:blocks/waystone/remove/before/check_breaking_source
# Try to check (with provided features reliabilities) if has been broken by the owner or a manager
# /!\ Note that this method is still unsafe. We don't have any way to check it safely for the moment

execute store result score $owner.id pk.temp run data get entity @s data.Waystone.Owner.id
execute unless entity @a[scores={pk.waystones.mined.barrel=1..},predicate=pk_waystones:gameplay/waystone/owner_or_manager,distance=..10] run scoreboard players set $stop pk.temp 1