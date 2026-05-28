#!/bin/bash

#Before using functions this is the script here the if statement of updating or validating installation status is repeated so this script is not that effective as more lines of code is used and reduces performance.
# USERID=$(id -u)

# if [ $USERID -ne 0 ]; then
#     echo "ERROR: Please run this script with root privileges"
#     exit 1
# fi

# dnf install mysql -y

# if [ $? -ne 0 ]; then
#     echo "ERROR: MySQL installation failed"
#     exit 1
# else
#     echo "MySQL installed successfully"
# fi

# dnf install nginx -y

# if [ $? -ne 0 ]; then
#     echo "ERROR: Nginx installation failed"
#     exit 1
# else
#     echo "Nginx installed successfully"
# fi

# dnf install mongodb-mongosh -y

# if [ $? -ne 0 ]; then
#     echo "ERROR: MongoDB-mongosh installation failed"
#     exit 1
# else
#     echo "MongoDB-mongosh installed successfully"
# fi

#After using functions 👇
#This version is easier to read and is more efficient as we are using less lines of code.

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run this script with root privileges"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "ERROR: $2 installation failed"
        exit 1
    else
        echo "$2 installed successfully"
    fi
}

dnf install mysql -y
VALIDATE $? "MySQL"

dnf install nginx -y
VALIDATE $? "Nginx"

dnf install python3 -y
VALIDATE $? "Python3"