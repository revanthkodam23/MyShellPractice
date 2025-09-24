#!/bin/bash

# Check if the user is root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root or use sudo."
  exit 1
fi


# Update package list
dnf makecache

# Install MySQL Server
dnf install mysql-server -y

# Check installation status
if [ $? -ne 0 ]; then
  echo "MySQL installation failed."
  exit 1
else
  echo "MySQL installed successfully."
fi