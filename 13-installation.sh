#!/bin/bash

#Join Devops Version in the start 
#     👇
# USERID=$(id -u)

# if [ $USERID -ne 0 ]; then
#     echo "ERROR: Please run this script as root privileges"
# fi

# dnf install mysql -y

# if [ $? -ne 0 ]; then
#     echo "ERROR: MySQL installation failed"
# else
#     echo "MySQL installed successfully"
# fi


# After corrections 👇

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run this script as root privileges"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR: MySQL installation failed"
    exit 1
else
    echo "MySQL installed successfully"
fi