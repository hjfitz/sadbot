#!/bin/bash
# demonstrates outputting something from a python file without need for 
# shell script middle-man

ech=$(python ./test.py)
echo $ech
