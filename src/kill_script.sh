#!/bin/bash
if [ $(tail -1000 crawler.log | grep SUCCESS | wc -l) -eq 0 ]
then
  echo "Puppeteer instances stuck"
  for VARIABLE in $(ps aux | grep 'puppeteer' | awk '{print $2}')
  do
    echo $VARIABLE
    sudo kill -15 $VARIABLE
    sleep 5
  done
fi
