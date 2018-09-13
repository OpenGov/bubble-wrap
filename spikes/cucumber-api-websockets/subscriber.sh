#!/bin/bash

fifo_name="events";

[ -f $fifo_name ] || mkfifo $fifo_name;

while true
do
    if read line <$fifo_name; then
        echo $line
    fi
done
