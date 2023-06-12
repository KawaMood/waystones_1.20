# Restore commandBlockOutput gamerule state
execute if score $gamerule.command_block_output.previous_value pk.value matches 1 run gamerule commandBlockOutput true