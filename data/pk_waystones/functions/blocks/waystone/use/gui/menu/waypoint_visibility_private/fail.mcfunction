#> pk_waystones:blocks/waystone/use/gui/menu/waypoint_visibility_private/fail

scoreboard players set $action.stop pk.temp 1

tellraw @s {"text": "You can't change settings of Waystones you don't own","color": "red"}