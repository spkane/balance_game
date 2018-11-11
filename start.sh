#!/bin/sh

if [ ${THEME} == "2" ]; then
  cp -a /theme2/* /var/www/localhost/htdocs/res/
else
  cp -a /theme1/* /var/www/localhost/htdocs/res/
fi

exec /usr/sbin/httpd -D FOREGROUND
