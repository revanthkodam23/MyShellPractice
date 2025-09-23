#!/bin/bash

echo "please Enter the number"
read Number

if [$((Number%2)) -eq 0]; then
    echo "given number $Number is Even Number"
else
    echo "given number $Number is Odd Number" 
fi