#!/bin/bash

MYIP=$(dig +short myip.opendns.com @resolver1.opendns.com)
HOME_DOMAIN="*.davis.im"
curl -u "$IWMN_USERNAME:$IWMN_PASSWORD" "https://iwantmyname.com/basicauth/ddns?hostname=$HOME_DOMAIN&myip=$MYIP&ttl=60"