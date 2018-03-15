#!/bin/sh

if [ ${THEME} == "2" ]; then
  cp -a /theme2/* /var/www/html/res/
else
  cp -a /theme1/* /var/www/html/res/
fi

exec /usr/sbin/httpd -D FOREGROUND
