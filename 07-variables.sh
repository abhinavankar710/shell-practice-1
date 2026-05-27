#!/bin/bash

START_TIME=$(date +%Y-%m-%d-%H-%M-%S)
Start_time_seconds=$(date +%s)

echo "Script executed at: $START_TIME"

sleep 7

END_TIME=$(date +%Y-%m-%d-%H-%M-%S)
End_time_seconds=$(date +%s)

echo "Script completed at: $END_TIME"

TOTAL_TIME=$((End_time_seconds - Start_time_seconds))

echo "Total execution time: $TOTAL_TIME seconds"