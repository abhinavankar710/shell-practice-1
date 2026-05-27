#!/bin/bash

START_TIME=$(date +%Y-%m-%d-%H-%M-%S)

echo "Script executed at: $START_TIME"

sleep 10 &

END_TIME=$(date +%Y-%m-%d-%H-%M-%S)

echo "Script completed at: $END_TIME"

TOTAL_TIME=$(END_TIME - START_TIME)

echo "Total execution time: $TOTAL_TIME seconds"