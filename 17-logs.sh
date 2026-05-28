#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log" 

mkdir -p $LOGS_FOLDER what does this do
echo "Script execution started at: $(date)"

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

dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install mysql -y
        VALIDATE $? "MySQL"
else 
    echo -e "MySQL already exists$Y SKIPPING$N installation of MySQL"
fi

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y
        VALIDATE $? "Nginx"
else 
    echo -e "Nginx already exists$Y SKIPPING$N installation of Nginx"
fi

dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install python3 -y
        VALIDATE $? "Python3"
else 
    echo -e "Python3 already exists$Y SKIPPING$N installation of Python3"
fi