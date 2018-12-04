#!/bin/sh

# run the sipp for dummy uas
sipp -sn uas 127.0.0.1 -p 5061 -d 100

# create a call to a dummy uas and get channel id
CHANNELID=$(curl -X POST http://127.0.0.1:8088/ari/channels\?api_key=asterisk:asterisk\&endpoint=pjsip/test@sippuas\&app=test | python -m json.tool | grep "id" | awk -F '"' '{print $4}')

echo "Created channel info" $CHANNELID

# sleep 10 sec
sleep 10

# channel continue
curl -X POST http://127.0.0.1:8088/ari/channels/$CHANNELID/continue\?api_key=asterisk:asterisk

