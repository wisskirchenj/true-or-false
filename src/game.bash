#!/usr/bin/env bash

RESPONSES=( "Perfect!" "Awesome!" "You are a genius!" "Wow!" "Wonderful!" )

function print_menu() {
  echo """
0. Exit
1. Play a game
2. Display scores
3. Reset scores
Enter an option:"""
}

function curl_login() {
  curl -su rihanna:785bdf267c5244 -c cookie.txt http://0.0.0.0:8000/login > /dev/null
}

function play_game() {
  RANDOM=4096
  correct_count=0
  echo "What is your name?" && read user_name
  while [ ! $false_answer ]; do
    quiz=`curl -sb cookie.txt http://0.0.0.0:8000/game`
    #quiz='{"question": "Illidan Stormrage betrayed his own clan", "answer": "True"}' #<-- for testing
    correct_answer=`cut -f 8 -d '"' <<< $quiz`
    cut -f 4 -d '"' <<< $quiz
    echo "True or False?"
    read answer
    if [ $answer == $correct_answer ]; then
      correct_count=$(( $correct_count + 1 ))
      index=$(( RANDOM % ${#RESPONSES[@]} ))
      echo ${RESPONSES[$index]}
      echo
    else
      false_answer=1
      echo "Wrong answer, sorry!"
      echo "$user_name you have $correct_count correct answer(s)."
      echo "Your score is $(( correct_count * 10 )) points."
    fi
  done
  unset false_answer
}

echo "Welcome to the True or False Game!"
curl_login
print_menu && read choice
while [ ! $choice == "0" ]; do
  case $choice in
    "1") play_game;;
    "2") echo "Displaying scores";;
    "3") echo "Resetting scores";;
    *) echo "Invalid option!";;
  esac
  print_menu && read choice
done
echo "See you later!"