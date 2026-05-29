#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" 

mkdir -p $LOGS_FOLDER
echo "Script execution started at: $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run this script with root privileges"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "$2 installation$R Failed$N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "$2 installed$G Successfully$N" | tee -a $LOG_FILE
    fi
}

for package in $@
do
    # Check if the package is already installed
    dnf list installed $package &>>$LOG_FILE

    # If the package is not installed, install it by checking exit code.
    if [ $? -ne 0 ]; then
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "$package"
    else 
        echo -e "$package already exists$Y SKIPPING$N installation of $package" | tee -a $LOG_FILE
    fi
done