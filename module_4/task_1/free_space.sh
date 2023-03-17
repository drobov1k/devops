#!/bin/bash

THRESHOLD=10

if [[ ! -z $1 ]]; then
  THRESHOLD=$1
fi

while true
do
  FREE_SPACE=$(df -h / | awk '{print $4}' | tail -n 1 | sed 's/G//')

  if (( $(echo "$FREE_SPACE < $THRESHOLD" | bc -l) )); then
    echo "Warning: Free disk space is below threshold ($THRESHOLD GB)!"
  fi

  sleep 10
done