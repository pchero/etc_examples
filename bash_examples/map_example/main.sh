#!/bin/sh

declare -A newmap
newmap[name]="Irfan Zulfiqar"
newmap[designation]=SSE
newmap[company]="My Own Company"

echo ${newmap[company]}
echo ${newmap[name]}

