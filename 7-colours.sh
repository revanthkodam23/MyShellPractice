#!/bin/bash

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
# Example usage
print_red "This is a red message"
print_green "This is a green message"
print_yellow "This is a yellow message"
print_blue "This is a blue message" 
# End of script
print_blue "End of script"



