#!/bin/bash
if [ "$ACTION" = "save" ]; then
    echo "Saving Cloud Pod $NAME"
    localstack pod save "$NAME"
elif [ "$ACTION" = "load" ]; then
    echo "Loading Cloud Pod $NAME"
    localstack pod load "$NAME"
else
    echo "Invalid action: $ACTION"
    exit 1
fi