module "yandex_instance" {
  source             = "./modules/tf-yc-instance"
  instance_subnet_id = module.yandex_network.vm_network_info[var.zone]
  zone               = var.zone
  image_id           = "fd80qm01ah03dkqb14lc"
}
module "yandex_network" {
  source = "./modules/tf-yc-network"
}
