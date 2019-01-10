#!/bin/bash

# Shows old channels in the Asterisk.
# Check the all the channel's duration time.

# Usage: ./main.sh -d 7200

chans=(`asterisk -rx "core show channels concise"`)
olds=()
curtime=`date +"%s"`
duration=7200

# parse option
while getopts d: option
do
  case "${option}"
  in
    d) duration=${OPTARG};;
  esac
done

# check the all the channels and get overtimed channels
for chan in "${chans[@]}"
do
  # get all channels
  # $1: channel's name
  # $12: channel's duration
  read chan_name chan_duration <<< $(echo ${chan} | awk -F "!" '{print $1" "$12}')

  # if the channel is older than given duration,
  # consider it as a old.
  if [ $((chan_duration)) -gt $((duration)) ]
  then
    olds+=($chan_name)
  fi
done

# print all the old channels
for old in $olds
do
  echo "channel name: $old"
done
