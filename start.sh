#!/bin/sh

if [ "${THEME}" -eq "2" ]; then
  cp /home/container/theme2/* /home/container/www/htdocs/res/
else
  cp /home/container/theme1/* /home/container/www/htdocs/res/
fi

exec /usr/sbin/httpd -D FOREGROUND
