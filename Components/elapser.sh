#! /bin/bash
COMMAND_TO_EXEC="ls"
read -p "Enter command:" COMMAND_TO_EXEC
start=$(date +%s)
$COMMAND_TO_EXEC
end=$(date +%s)
echo "Time taken: $((end-start)) seconds"
