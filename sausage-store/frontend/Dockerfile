FROM node:16.20.0-alpine3.18 as builder
ARG VERSION=${VERSION}
WORKDIR /usr/src
COPY ./ ./
RUN npm install && npm run build

FROM nginxproxy/nginx-proxy
RUN apt-get update && apt install wget -y
COPY default.conf /app/
COPY nginx.tmpl /app/
WORKDIR /app
COPY --from=builder /usr/src/dist/frontend /app/frontend
COPY start.sh /usr/share/nginx/start.sh
RUN chmod +x /usr/share/nginx/start.sh
EXPOSE 80

CMD ["/usr/share/nginx/start.sh"]
