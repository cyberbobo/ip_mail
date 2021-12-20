#!/bin/bash
curl --get https://ping.eu/ > myip.html

var=$(sed -n '/^#1:/p;/^Your IP is /p' myip.html)
echo $var

var2=$(echo $var | cut -d'<' -f2 | cut -d'>' -f2)
echo $var2

sed "s/<template>/$var2/g" template_mail.eml > mail.eml

/usr/sbin/sendmail -t < mail.eml 

