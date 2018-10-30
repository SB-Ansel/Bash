#!/bin/sh
echo "Total word count of book =" $(wc -l 52293-0.txt)
echo "All the lines without[M] =" $(grep -c -v -o '^[M]' 52293-0.txt)
echo "Total occurrences of [M] =" $(grep -c -o '^[M]' 52293-0.txt)