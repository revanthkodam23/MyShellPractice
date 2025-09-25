#!/bin/bash

# Check if the user is root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root or use sudo."
  exit 1
fi

# Colours for terminal output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print messages in different colours
print_red() {
    echo -e "${RED}$1${NC}"
}       
print_green() {
    echo -e "${GREEN}$1${NC}"
}       
print_yellow() {
    echo -e "${YELLOW}$1${NC}"
}   

print_blue() {
    echo -e "${BLUE}$1${NC}"
} 


VALIDATE(){
if [ $1 -ne 0 ]; then
  print_red "$2 installation failed."
  exit 1
else
  print_green "$2 installed successfully."
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
