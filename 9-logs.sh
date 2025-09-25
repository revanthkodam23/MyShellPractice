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

LOGFOLDER="/var/log/shellscripts"
SCRIPT_NAME=$(echo $0 | cut -d'.' -f1)
LOGFILE="$LOGFOLDER/${SCRIPT_NAME}_$(date +'%Y%m%d_%H%M%S').log"

mkdir -p $LOGFOLDER

VALIDATE(){
if [ $1 -ne 0 ]; then
  print_red "$2 installation failed." | tee -a $LOGFILE
  exit 1
else
  print_green "$2 installed successfully." | tee -a $LOGFILE
fi
}

echo "script started at $(date)" &>>$LOGFILE | tee -a $LOGFILE

# Update package list
dnf makecache &>>$LOGFILE
VALIDATE $? "Package list update" | tee -a $LOGFILE
print_blue "Package list updated." | tee -a $LOGFILE    
# Install MySQL Server



# Install MySQL Server
dnf list mysql &>>$LOGFILE
if [ $? -eq 0 ]; then
    print_yellow "MySQL is already installed." | tee -a $LOGFILE
    
else
    print_blue "MySQL is not installed. Proceeding with installation." | tee -a $LOGFILE
    dnf install mysql -y &>>$LOGFILE
    VALIDATE $? "MySQL"
fi


# Check installation status


# Install Nginx
dnf list nginx &>>$LOGFILE
if [ $? -eq 0 ]; then
    print_yellow "Nginx is already installed." | tee -a $LOGFILE
    
else
    print_blue "Nginx is not installed. Proceeding with installation." | tee -a $LOGFILE    
    dnf install nginx -y &>>$LOGFILE
    VALIDATE $? "Nginx"
fi

# Install Python
dnf list python3 &>>$LOGFILE  
if [ $? -eq 0 ]; then
    print_yellow "Python is already installed." | tee -a $LOGFILE
    
else
    print_blue "Python is not installed. Proceeding with installation." | tee -a $LOGFILE
    dnf install python3 -y &>>$LOGFILE
    VALIDATE $? "Python"
fi

# Install Node.js
dnf list nodejs &>>$LOGFILE
if [ $? -eq 0 ]; then
    print_yellow "Node.js is already installed." | tee -a $LOGFILE
    
else
    print_blue "Node.js is not installed. Proceeding with installation." | tee -a $LOGFILE
    dnf install nodejs -y &>>$LOGFILE
    
    # Check installation status
    VALIDATE $? "Node.js"
fi

echo "script ended at $(date)" &>>$LOGFILE | tee -a $LOGFILE
# End of script
