resource "yandex_kms_symmetric_key" "kms-key" {
  # Ключ Yandex Key Management Service для шифрования важной информации, такой как пароли, OAuth-токены и SSH-ключи.
  name              = "kms-key"
  default_algorithm = "AES_128"
  rotation_period   = "8760h" # 1 год.
}
resource "yandex_kubernetes_cluster" "k8s-cluster" {
  name = "k8s-cluster"
  network_id = var.network_id
  master {
    zonal {
      zone      = var.zone
      subnet_id = var.subnet_id
    }
    security_group_ids = [var.sg_id]
    public_ip = true
  }
  service_account_id      = var.service_account_id
  node_service_account_id = var.service_account_id
  kms_provider {
    key_id = yandex_kms_symmetric_key.kms-key.id
  }
}

