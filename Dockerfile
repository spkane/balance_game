FROM alpine:3.20

RUN apk add --no-cache apache2
RUN mkdir -p /run/apache2
COPY httpd.conf /etc/apache2/httpd.conf

RUN addgroup -S container && \
    adduser  -S container -G container
RUN chown -R container.container  /run
USER container:container

RUN mkdir -p /home/container/www/htdocs/res && \
    mkdir -p /home/container/www/logs && \
    mkdir -p /home/container/run/apache2 && \
    mkdir /home/container/theme1 && \
    mkdir /home/container/theme2

COPY publish/html5/theme1/* /home/container/theme1/
COPY publish/html5/theme2/* /home/container/theme2/
COPY publish/html5/game.min.js /home/container/www/htdocs/
COPY publish/html5/index.html /home/container/www/htdocs/
COPY publish/html5/project.json /home/container/www/htdocs/
COPY start.sh /home/container
ENV THEME=1

EXPOSE 8080

CMD ["/home/container/start.sh"]
