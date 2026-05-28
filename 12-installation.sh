#!/bin/bash

USER= "$USER"

if [ "$USER" == "root" ]; then
    
    dnf install mysql -y && if [ $? -eq 0 ]; then
        echo "MySQL installed successfully"
    else
        echo "MySQL installation failed"
    fi

else
    echo "You are logged in as $USER user please take root user access to install MySQL"
fi