#!/usr/bin/bash

echo "<HTML><BODY>" > /var/www/html/index.nginx-debian.html
echo "Your ip address: " >> /var/www/html/index.nginx-debian.html
curl "https://jsonip.com" | jq '.ip'  >> /var/www/html/index.nginx-debian.html
echo "</BODY></HTML>" >> /var/www/html/index.nginx-debian.html
