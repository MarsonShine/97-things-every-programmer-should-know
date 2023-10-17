#!/bin/bash

for i in {4..97}
do
    if [ $i -lt 10 ]
    then
        mkdir thing_0$i
        touch thing_0$i/README.md
    else
        mkdir thing_$i
        touch thing_$i/README.md
    fi
done

