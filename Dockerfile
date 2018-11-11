FROM alpine:3.8

RUN apk add apache2
RUN mkdir -p /run/apache2 && \
    mkdir /var/www/localhost/htdocs/res && \
    mkdir /theme1 && \
    mkdir /theme2
ADD httpd.conf /etc/apache2/httpd.conf
ADD publish/html5/theme1/* /theme1/
ADD publish/html5/theme2/* /theme2/
ADD publish/html5/game.min.js /var/www/localhost/htdocs/
ADD publish/html5/index.html /var/www/localhost/htdocs/
ADD publish/html5/project.json /var/www/localhost/htdocs/
ADD start.sh /
ENV THEME 1

EXPOSE 80

CMD ["/start.sh"]

