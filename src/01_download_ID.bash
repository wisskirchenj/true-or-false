#!/usr/bin/env bash

echo 'Welcome to the True or False Game!'
curl -o ID_card.txt --silent http://0.0.0.0:8000/download/file.txt
cat ID_card.txt
