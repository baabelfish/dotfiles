#!/bin/bash
# TODO: Poll from the api
light_amount=3

for i in `seq 1 $light_amount`; do
    ~/.xutils/myhue/command.sh $i $* &> /dev/null
done
