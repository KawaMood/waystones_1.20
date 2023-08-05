#> pk_waystones:base/load
# Main load

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Settings:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

# Common:
# - $logs.load pk.value | default: (undefined) | <=0 = mask load logs | (undefined) or >=1 = show load logs
# - $logs.tick pk.value | default: (undefined) | (undefined) or <=0 = mask tick logs | >=1 = show tick logs
# - $custom_block.light_update pk.value | default: (undefined) | <=0 = disable | (undefined) or >=1 = enable custom blocks light update

# Concerning this datapack:
# - $logs.datapack.waystones pk.value | default: (undefined) | (undefined) or <=0 = masks | >=1 = show Waystones logs
# - $pk.waystones.settings.limit_per_player pk.value | default: (undefined) | if set, defines the maximal amount of Waystones a player can place
# - $pk.waystones.settings.limit_per_server pk.value | default: (undefined) | if set, defines the maximal amount of Waystones the server can contain
# - $pk.waystones.settings.ignore_monsters pk.value | default: (undefined) | <=0 = disallow Waystones use if a monster is nearby | (undefined) or >=1 = ignore
# - $pk.waystones.settings.legacy_textures pk.value | default: (undefined) | (undefined) or <=0 = disable | >=1 = use legacy Waystone textures
#
# /!\ Specific settings that need to be toggle using commands (function pk_waystones:cmd/settings/<path>)
# - $pk.waystones.settings.name_visibility pk.value | default: (undefined) | (undefined) or <=0 = hide | >=1 = show Waystones names above themselves
# - $pk.waystones.settings.show_same_dimension_only pk.value | default: (undefined) | >=1 show only Waystones of same the dimension in a Waystone's menu
# - $pk.waystones.settings.allow_visibility_change pk.value | default: (undefined) | (undefined) or >=1 = allow | <=0 = disallow Visibility changes for regular players
# - $pk.waystones.settings.allow_protection_change pk.value | default: (undefined) | (undefined) or >=1 = allow | <=0 = disallow Protection changes for regular players
# - $pk.waystones.settings.keep_vehicle_on_tp pk.value | default: (undefined) | (undefined) or <=0 = don't | >=1 = teleport the player's vehicle when using a Waypoint

# Special tags:
# - pk.dev : Allow player to see data packs specific logs
# - pk.waystones.manager : Allow player to bypass restrictions and manage other players Waystones

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Locations:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
# Location -30000000 0 1611 in Overworld | Standardized chunk used by many data packs, used here to run command blocks processes
execute in minecraft:overworld run forceload add -30000000 1600

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Storage:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
# Define storage
# - pk.common.data | Used to store installed PK Datapacks names and version and for temp data manipulation
# - pk.waystones:data Block | Used to store features of a specific custom block from this data pack
# - pk.waystones:data Blocks | Used to store the list of the placed custom block from this data pack
#declare storage pk.common:data
#declare storage pk.waystones:data

# Initialize PK data packs storage if needed
execute unless data storage pk.common:data Datapacks[{}] run data modify storage pk.common:data Datapacks set value []

# Add current data pack into the PK data packs storage if needed
execute unless data storage pk.common:data Datapacks[{Name:"Waystones"}] run data modify storage pk.common:data Datapacks append value {Name:"Waystones"}

# Initialize the storage used to store Waystones location
execute unless data storage pk.waystones:data Blocks.Waystones[{}] run data modify storage pk.waystones:data Blocks.Waystones set value []

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Scores:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
# Define objectives that are common to each PK data pack:
# - pk.temp only concerns temp values that can be cleared at any time without risks.
# - pk.value is used for fixed values and variable settings, and won't be cleared on uninstallation until there is no PK data pack anymore.
scoreboard objectives add pk.temp dummy
scoreboard objectives add pk.value dummy
scoreboard objectives add pk.custom_block.component.id dummy
scoreboard objectives add pk.custom_block.interaction.id dummy
scoreboard objectives add pk.crafted.knowledge_book crafted:knowledge_book

# Define objective that are specific to the current data pack
scoreboard objectives add pk.waystones.mined.barrel mined:barrel
scoreboard objectives add pk.waystones.owned_waystones_amount dummy
scoreboard objectives add pk.waystones.player.leave_game custom:leave_game
scoreboard objectives add pk.waystones.player.setting.hide_coordinates trigger
scoreboard objectives add pk.waystones.waystone.page dummy
scoreboard objectives add pk.waystones.waystone.animations.delay dummy

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Packages:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
# Player id
function pk_waystones:packages/player_id/load
# RNG
function pk_waystones:packages/random/load
# Air toggling
function pk_waystones:packages/air_toggling/load

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Updates:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
execute unless score $pk.waystones.version pk.value matches 10 run function pk_waystones:base/update/start

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Logs:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
execute unless score $logs.load pk.value matches ..0 run tellraw @a [{"text": "Loaded ","color": "yellow"},{"text": "KawaMood's Waystones ","color": "aqua","bold": true},{"text": "(V.","color": "aqua"},{"nbt":"Datapacks[{Name:\"Waystones\"}].Version", "storage": "pk.common:data","color": "aqua"},{"text": ")","color": "aqua"},{"text": " successfully"}]