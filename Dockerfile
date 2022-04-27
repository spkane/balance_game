FROM alpine:3.8

RUN apk add --no-cache apache2
RUN mkdir -p /run/apache2 && \
    mkdir /var/www/localhost/htdocs/res && \
    mkdir /theme1 && \
    mkdir /theme2
COPY httpd.conf /etc/apache2/httpd.conf
COPY publish/html5/theme1/* /theme1/
COPY publish/html5/theme2/* /theme2/
COPY publish/html5/game.min.js /var/www/localhost/htdocs/
COPY publish/html5/index.html /var/www/localhost/htdocs/
COPY publish/html5/project.json /var/www/localhost/htdocs/
COPY start.sh /
ENV THEME 1

EXPOSE 80

CMD ["/start.sh"]
