#! /bin/bash
set -xe

sudo docker login -u ${CI_REGISTRY_USER} -p ${CI_REGISTRY_PASSWORD} ${CI_REGISTRY}
sudo docker network create -d bridge sausage_network || true
sudo docker rm -f sausage-backend || true
sudo docker rmi "${CI_REGISTRY_IMAGE}"/sausage-backend:latest || true

sudo docker run -d --name sausage-backend \
     --env SPRING_DATASOURCE_URL="jdbc:postgresql://${BACKEND_PSQL_HOST}:${BACKEND_PSQL_PORT}/${BACKEND_PSQL_DBNAME}?ssl=true" \
     --env SPRING_DATASOURCE_USERNAME="${BACKEND_PSQL_USER}" \
     --env SPRING_DATASOURCE_PASSWORD="${BACKEND_PSQL_PASSWORD}" \
     --env SPRING_DATA_MONGODB_URI="mongodb://${BACKEND_MONGO_USER}:${BACKEND_MONGO_PASSWORD}@${BACKEND_MONGO_HOST}:${BACKEND_MONGO_PORT}/${BACKEND_MONGO_DATABASE}?tls=true" \
     --network=sausage_network \
     "${CI_REGISTRY_IMAGE}"/sausage-backend:latest
