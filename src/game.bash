#!/usr/bin/env bash

RESPONSES=( "Perfect!" "Awesome!" "You are a genius!" "Wow!" "Wonderful!" )
SCORES_FILE="scores.txt"

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

function append_to_scores() {
  echo "User: $1, Score: $2, Date: `date +%Y-%m-%d`" >> $SCORES_FILE
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
    echo "True or False?" && read answer
    if [ $answer == $correct_answer ]; then
      correct_count=$(( correct_count + 1 ))
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
  append_to_scores $user_name $(( correct_count * 10 ))
  unset false_answer
}

function reset_scores() {
  rm $SCORES_FILE 2> /dev/null && echo "File deleted successfully!" || echo "File not found or no scores in it!"
}

function display_scores() {
  if [ ! -f $SCORES_FILE ]; then
    echo "File not found or no scores in it!"
    return
  fi
  echo "Player scores"
  cat $SCORES_FILE
}

echo "Welcome to the True or False Game!"
curl_login
print_menu && read choice
while [ ! $choice == "0" ]; do
  case $choice in
    "1") play_game;;
    "2") display_scores;;
    "3") reset_scores;;
    *) echo "Invalid option!";;
  esac
  print_menu && read choice
done
echo "See you later!"