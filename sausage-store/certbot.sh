#!/bin/sh

WEBSITE="frontend:80"
WEBROOT_DIR="/var/www/html"

# Функция для ожидания доступности сайта
wait_for_website() {
    until wget --spider "$WEBSITE" 2>&1 | grep -qE 'remote file exists'; do
        echo "Await whyle frontend started.."
        sleep 5
    done
}

wait_for_website

# Выпускаем сертификат если его ещё нет.
if ! test -f /etc/letsencrypt/live/$DOMAIN/fullchain.pem; then
    certbot register --email $DOMAIN_EMAIL --agree-tos -m $DOMAIN_EMAIL -n
    certbot certonly --webroot -w $WEBROOT_DIR --email $DOMAIN_EMAIL -d $DOMAIN --agree-tos -n
fi

# Проверка срока действия сертификата и обновление, если необходимо
while true; do
    DAYS_LEFT=$(sudo certbot certificates | grep "Expiry Date" | awk '{print $4}')
    if [[ $DAYS_LEFT -lt 1 ]]; then
        echo "SSL-сертификат истекает через менее чем 1 день. Обновление..."
        sudo certbot renew --webroot --agree-tos -w $WEBROOT_DIR -d $DOMAIN
    else
        echo "SSL-сертификат еще действителен. Ничего не делаем."
    fi
    # Проверка каждые 24 часа (можно настроить по своему усмотрению)
    sleep 86400
done