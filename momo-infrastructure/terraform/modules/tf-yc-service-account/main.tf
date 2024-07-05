resource "yandex_iam_service_account" "service_account" {
  name        = var.service_account_name
  description = "K8S zonal service account"
}
resource "yandex_resourcemanager_folder_iam_member" "k8s-clusters-agent" {
  # Сервисному аккаунту назначается роль "k8s.clusters.agent".
  folder_id = var.folder_id
  role      = "k8s.clusters.agent"
  member    = "serviceAccount:${yandex_iam_service_account.service_account.id}"
}
resource "yandex_resourcemanager_folder_iam_member" "vpc-public-admin" {
  # Сервисному аккаунту назначается роль "vpc.publicAdmin".
  folder_id = var.folder_id
  role      = "vpc.publicAdmin"
  member    = "serviceAccount:${yandex_iam_service_account.service_account.id}"
}
resource "yandex_resourcemanager_folder_iam_member" "images-puller" {
  # Сервисному аккаунту назначается роль "container-registry.images.puller".
  folder_id = var.folder_id
  role      = "container-registry.images.puller"
  member    = "serviceAccount:${yandex_iam_service_account.service_account.id}"
}
resource "yandex_resourcemanager_folder_iam_member" "encrypterDecrypter" {
  # Сервисному аккаунту назначается роль "kms.keys.encrypterDecrypter".
  folder_id = var.folder_id
  role      = "kms.keys.encrypterDecrypter"
  member    = "serviceAccount:${yandex_iam_service_account.service_account.id}"
}
resource "yandex_resourcemanager_folder_iam_member" "loadBalancerAdmin" {
  # Сервисному аккаунту назначается роль "load-balancer.admin".
  folder_id = var.folder_id
  role      = "load-balancer.admin"
  member    = "serviceAccount:${yandex_iam_service_account.service_account.id}"
}
resource "yandex_resourcemanager_folder_iam_member" "dnsEditor" {
  # Сервисному аккаунту назначается роль "load-balancer.admin".
  folder_id = var.folder_id
  role      = "dns.editor"
  member    = "serviceAccount:${yandex_iam_service_account.service_account.id}"
}
resource "yandex_resourcemanager_folder_iam_member" "storageUploader" {
  # Сервисному аккаунту назначается роль "load-balancer.admin".
  folder_id = var.folder_id
  role      = "storage.uploader"
  member    = "serviceAccount:${yandex_iam_service_account.service_account.id}"
}
resource "yandex_resourcemanager_folder_iam_member" "k8sViewer" {
  # Сервисному аккаунту назначается роль "load-balancer.admin".
  folder_id = var.folder_id
  role      = "k8s.viewer"
  member    = "serviceAccount:${yandex_iam_service_account.service_account.id}"
}
