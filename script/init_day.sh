# !/usr/bin/env zsh

day=$1

echo "setting up dir for day $day"
mkdir "day_$day"
touch "day_$day/input.txt"
touch "day_$day/sample.txt"
touch "day_$day/solution.rb"
