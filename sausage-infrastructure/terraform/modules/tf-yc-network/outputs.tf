output "vm_network_info" {
  description = "Список характеристик виртуальных сетей"
  value       = { for vnet in data.yandex_vpc_subnet.default : vnet.zone => vnet.id }
}
