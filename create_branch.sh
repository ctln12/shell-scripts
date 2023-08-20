#!/bin/zsh

echo "Creating the new branch..."

if [ -z "$1" ]
then
  echo "Branch name is missing!"
else
  task_number=$(echo "$1" | cut -c 1-7)
  task_text=$(echo "$1" | cut -c 9-)
  sanitized_text=$(echo "$task_text" | tr -d ":/" | tr -s " " "-" | tr "[:upper:]" "[:lower:]")
  sanitized_name=$(echo "$task_number-$sanitized_text")
  git checkout -b $sanitized_name
fi
