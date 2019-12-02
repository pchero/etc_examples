#!/usr/bin/env bash
# sh ./main.sh test.com test1.com

#start main
if [ $# -lt 1 ]; then
    printf "Usage: %s <target asterisk's internal ip> <...>\n" $0
    exit 1
fi

for target in "$@"
do
    echo "Checking the target: $target"
done

read -p "THIS WILL REMOVE $@ FROM LIVE TRAFFIC. ARE YOU SURE? " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
fi

for target in "$@"
do
    echo "Remove the traffics for the target: $target"
done

