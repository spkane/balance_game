FROM fedora:22

RUN dnf install -y httpd
RUN mkdir /var/www/html/res
ADD httpd.conf /etc/httpd/conf/httpd.conf
ADD publish/html5/res/* /var/www/html/res/
ADD publish/html5/game.min.js /var/www/html/
ADD publish/html5/index.html /var/www/html/
ADD publish/html5/project.json /var/www/html/
ADD boring_404.html /var/www/html/
ENV 404_PATH /boring_404.html

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
