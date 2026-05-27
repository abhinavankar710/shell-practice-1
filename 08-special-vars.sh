#!/bin/bash

echo "All variables passed to the script: $@"
echo "All variables passed to the script: $*"
echo "Script name: $0"
echo "Current Directory: $PWD"
echo "Current User: $USER"
echo "Home Directory of $USER: $HOME"
echo "PID of the script: $$"
echo "PID of the last background process: $!"