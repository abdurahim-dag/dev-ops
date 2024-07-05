resource "yandex_vpc_network" "k8s-network" {
  name = "k8s-network"
}
resource "yandex_vpc_subnet" "k8s-subnet" {
  for_each = { for a in var.network_zones : a.name => a }
  v4_cidr_blocks = ["${each.value.cidr}"]
  name     = "${resource.yandex_vpc_network.k8s-network.name}-${each.key}"
  network_id = yandex_vpc_network.k8s-network.id
  zone = each.key
}
