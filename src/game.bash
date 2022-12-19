#!/usr/bin/env bash

function print_menu() {
  echo """
0. Exit
1. Play a game
2. Display scores
3. Reset scores
Enter an option:"""
}

echo "Welcome to the True or False Game!"
print_menu
read choice
while [[ ! $choice =~ ^0$ ]]; do
  case $choice in
    "1") echo "Playing game";;
    "2") echo "Displaying scores";;
    "3") echo "Resetting scores";;
    *) echo "Invalid option!";;
  esac
  print_menu
  read choice
done
echo "See you later!"