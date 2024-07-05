FROM node:17.9.1-slim as builder
ARG VERSION=${VERSION}
WORKDIR /app

COPY ./ ./

ENV NODE_ENV="development"
ENV VUE_APP_API_URL="/api/"
ENV NODE_OPTIONS=--openssl-legacy-provider 

RUN npm install && npm run build

FROM nginx:stable-alpine3.17-slim

COPY --from=builder /app/dist /app/frontend/momo-store
COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh /usr/share/nginx/start.sh
RUN chmod +x /usr/share/nginx/start.sh

EXPOSE 80

CMD ["/usr/share/nginx/start.sh"]
