#!/bin/sh

BLUE="blue:8080/api/products"
GREEN="green:8080/api/products"

# Функция для ожидания доступности сайта
wait_for_website() {
    until wget --spider "$BLUE" 2>&1 | grep -qE 'response... 200' || wget --spider "$GREEN" 2>&1 | grep -qE 'response... 200'; do
        echo "Waiting for backend to become available..."
        sleep 5
    done
}

wait_for_website

# Ожидаем сертификат если его ещё нет.
if ! test -f /etc/letsencrypt/live/$DOMAIN/fullchain.pem; then
    cp -rf /app/default.conf /etc/nginx/conf.d/default.conf

    touch /home/certbot/index.html
    nginx

    while [ ! -f /etc/letsencrypt/live/$DOMAIN/fullchain.pem ]
    do
        echo "Await ssl certificates generate..."
        sleep 5
    done

    nginx -s stop
    rm /etc/nginx/conf.d/default.conf
fi

echo "Starting Nginx..."
exec forego start -r
