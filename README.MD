# IDEA EDU Course ...

Bash-scripting menu-based application using cookies with curl and websockets to run a quiz game

## Technology / External Libraries

- bash 5.2.15 on macOS
- curl

## Repository Contents

The sources of main project tasks (6 stages).

## Program description

Accessing a question game per web socket connect to an API using cookies and the curl utility.

Stage 1: Connect to the API and download your username and password.

Stage 2: Connect to the API with the username and password of stage 1 and grant access by login.

Stage 3: Login and use your session cookie to connect to the game endpoint and fetch a quiz question.

Stage 4: Create a game menu for the application.

Stage 5: Implement the 'Play a game' menu option to actually do the quiz.

Stage 6: Save the player scores and print them.

Have fun!

## Project completion

[Project was completed on 10.11.22.]: #

## Progress

12.12.22 Project started - gitHub repo and project structure setup.

12.12.22 Stage 1 completed - array-handling, read into array, POSIX-regexp, bats-testing

12.12.22 Stage 2 completed - functionize, while-loop and use of basic calculator 'bc'

12.12.22 Stage 3 completed - login to game, create a cookie and use cookie to get a first quiz question

12.12.22 Stage 4 completed - implement a game menu

19.12.22 Stage 5 completed - implement the play menu option, that lets users enter their name, solve quizzes, provided by 
the socket endpoint in a loop until the first wrong answer is given and display their score
