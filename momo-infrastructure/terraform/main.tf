module "yandex_network" {
  source = "./modules/tf-yc-network"
}
module "yandex_iam_service_account" {
  source = "./modules/tf-yc-service-account"
  service_account_name = var.service_account_name
  folder_id            = var.folder_id
}
module "yandex_instance_group" {
  source             = "./modules/tf-yc-instance-group"
  cluster_id         = module.yandex_kubernetes_cluster.cluster_id
  sg_id              = module.yandex_vpc_security_group.sg_id
  subnet_id          = module.yandex_network.subnet_info[var.zone]
  scale_min          = 1
  scale_max          = 3
  scale_init         = 1
}
module "yandex_vpc_security_group" {
  source = "./modules/tf-yc-security-group"
  service_account_id = module.yandex_iam_service_account.service_account_id
  subnet_id          = module.yandex_network.subnet_info[var.zone]
  network_id         = module.yandex_network.network_id
  zone               = var.zone
}
module "yandex_kubernetes_cluster" {
  source = "./modules/tf-yc-k8s"
  subnet_id          = module.yandex_network.subnet_info[var.zone]
  network_id         = module.yandex_network.network_id
  zone               = var.zone
  service_account_id = module.yandex_iam_service_account.service_account_id
  sg_id              = module.yandex_vpc_security_group.sg_id
}