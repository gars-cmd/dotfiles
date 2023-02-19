#!/bin/bash


dir=$HOME/Sync-Devices/
# Check if a file name is provided as an argument
if [ -z "$1" ]; then
  echo "Please provide a file name as an argument"
  exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
  echo "File $1 does not exist"
  exit 1
fi

# Copy the file to the specified directory
cp  "$1" "$dir"

echo "File $1 has been copied to directory $dir"
