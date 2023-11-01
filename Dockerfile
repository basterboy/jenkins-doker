FROM alpine:3.18.4

ENV TZ=Europe/Kiev

RUN apk update && apk add --no-cache apache2 php tzdata \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && rm -rf /var/www/localhost/htdocs/index.html

COPY src/index.php /var/www/localhost/htdocs

EXPOSE 80

CMD ["httpd", "-D", "FOREGROUND"]
