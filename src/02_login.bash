#!/usr/bin/env bash

echo 'Welcome to the True or False Game!'
msg=`curl -su rihanna:785bdf267c5244 -c cookie.txt http://0.0.0.0:8000/login`
echo "Login message: "$msg
