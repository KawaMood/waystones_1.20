# Restore commandBlockOutput gamerule state
execute if score $gm_command_block_output_state pk.value matches 1 run gamerule commandBlockOutput true