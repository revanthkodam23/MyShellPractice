#!/bin/bash

# Check if the user is root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root or use sudo."
  exit 1
fi

VALIDATE(){
if [ $1 -ne 0 ]; then
  echo "$2 installation failed."
  exit 1
else
  echo "$2 installed successfully."
fi
}

# Update package list
dnf makecache

# Install MySQL Server
dnf install mysql -y 

# Check installation status
VALIDATE $? "MySQL"

# Install Nginx
dnf install nginx -y

# Check installation status
VALIDATE $? "Nginx"

# Install Python
dnf install python3 -y

# Check installation status
VALIDATE $? "Python"
# Install Node.js
dnf install nodejs -y

# Check installation status
VALIDATE $? "Node.js"
