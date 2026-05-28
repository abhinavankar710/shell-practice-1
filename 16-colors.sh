#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run this script with root privileges"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "$2 installation$R Failed$N"
        exit 1
    else
        echo -e "$2 installed$R Successfully$N"
    fi
}

dnf list installed $2
if [ $1 -ne 0]; then
    dnf install mysql -y
        VALIDATE $? "MySQL"
else 
    echo "MySQL already exists$Y SKIPPING$N installation of MySQL"
fi

dnf list installed $2
if [ $1 -ne 0]; then
    dnf install nginx -y
        VALIDATE $? "Nginx"
else 
    echo "Nginx already exists$Y SKIPPING$N installation of Nginx"
fi

dnf list installed $2
if [ $1 -ne 0]; then
    dnf install python3 -y
        VALIDATE $? "Python3"
else 
    echo "Python3 already exists$Y SKIPPING$N installation of Python3"
fi