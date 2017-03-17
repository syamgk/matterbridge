#!/bin/bash
sed -Ei "s/IRC_NICK/$IRC_NICK/" $config
sed -Ei "s/MM_SERVER_NAME/$MM_SERVER_NAME/" $config
sed -Ei "s/MM_TEAM_NAME/$MM_TEAM_NAME/" $config
sed -Ei "s/MM_LOGIN/$MM_LOGIN/" $config
sed -Ei "s/MM_PASS/$MM_PASS/" $config
sed -Ei "s/IRC_CHANNEL_NAME/$IRC_CHANNEL_NAME/" $config
./matterbridge
