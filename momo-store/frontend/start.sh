#!/bin/sh

WEBSITE="backend:8081"

wait_for_website() {
    until wget --spider "$WEBSITE" 2>&1 | grep -qE 'server returned'; do
        echo "Waiting for website to become available..."
        sleep 5
    done
}

wait_for_website

echo "Website is reachable. Starting Nginx..."
exec nginx -g 'daemon off;'
