# Momo Infrastructure

Репозиторий инфраструктуры проекта [Momo-store](https://gitlab.praktikum-services.ru/std-022-044/momo-store)

## Реализовано

- приложения в докер образах
- ci/cd в gitlab
- [sonarcloud](https://sonarcloud.io/organizations/std-022-044/projects)
- Terraform инфраструктуры проекта
- helm chart приложения
- мониторинг и логирование
- Приложение: [Ссылка](https://devops.the-pro.ru)
- Prometheus: [Ссылка](https://prometheus.the-pro.ru)
- Grafana: [Ссылка](https://grafana.the-pro.ru) | пользователь: viewer | пароль: qwe123$

## Последовательность действий.

1. Создать облако и каталог.
2. Создать "административный" сервисный аккаунт
3. Создать бакет.
4. Создать статический ключ доступа на сервис аккаунт, который имеет доступ к бакету.

```
$Env:AWS_SECRET_ACCESS_KEY="..."
$Env:AWS_ACCESS_KEY_ID="..."
```
5. Разварачиваем кластер.
```
terraform init
terraform apply
```
6.1 Получаем OAuth-токен аккаунта YC и настраиваем cli в yandex cloud
```
yc config set cloud-id b1g40f22ddg7uijfcg42
yc config set folder-id b1goagja58j7rcupommr
yc init
```
6.2 Настроим доступ к нашему кластеру из kubectl. Для этого нужно получить конфигурационный файл при помощи yc:
yc managed-kubernetes cluster get-credentials --name k8s-cluster --external
6.3 Получаем токен доступа сервис аккаунта от имени которого будет деплой.
```
kubectl apply ./kube/sa.yaml
```
И выгрузим токен:
```
kubectl -n kube-system get secret admin-user-token -o json
```
#### *Данный токен и certificate-authority-data используем для деплоя в gitlab.*
7.1 Установка ingress-nginx
```
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install ingress-nginx ingress-nginx/ingress-nginx --namespace ingress-nginx --create-namespace
```
7.2 Установка cert-manager c плагином Yandex Cloud DNS ACME webhook.
Получите ключ для сервис аккаунта.
```
yc iam key create --service-account-id <id-sa> --folder-name <folder-name> --output key.json
```
[Установите плагин в кластер.](https://yandex.cloud/ru/docs/managed-kubernetes/tutorials/ingress-cert-manager?from=int-console-help-center-or-nav#connecting-certs-manager)

7.3 Установка средства мониторинга и логирования.
- Loki: [установка Loki](https://yandex.cloud/ru/docs/managed-kubernetes/operations/applications/loki)
- Prometheus:```helm upgrade --install prometheus prometheus```
- Grafana: ```helm upgrade --install grafana grafana```
- Alertmanager: ```helm upgrade --install alertmanager alertmanager``

8. Деплоим приложение helm чарта из gitlab.

