#!/bin/bash

read -p "Enter a number: " num

if [ "$num" -le 1 ]; then
  echo "$num is not a prime number."
  exit 0
fi

for ((i=2; i<=num/2; i++))
do
  if [ $((num % i)) -eq 0 ]; then
    echo "$num is not a prime number."
    exit 0
  fi
done

echo "$num is a prime number."