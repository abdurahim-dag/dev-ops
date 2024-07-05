output "subnet_info" {
  description = "Список характеристик виртуальных сетей"
  value       = { for vnet in resource.yandex_vpc_subnet.k8s-subnet : vnet.zone => vnet.id }
}
output "network_id" {
  description = "Список характеристик виртуальных сетей"
  value       = resource.yandex_vpc_network.k8s-network.id
}
