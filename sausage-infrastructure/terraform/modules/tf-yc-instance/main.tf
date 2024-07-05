resource "yandex_compute_instance" "vm-1" {
  name = var.name

  resources {
    cores  = var.cores
    memory = var.memory
  }

  platform_id = var.platform

  scheduling_policy {
    preemptible = var.preemptible
  }

  zone = var.zone

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = var.disk_size
    }
  }

  network_interface {
    subnet_id = var.instance_subnet_id
    nat       = var.nat
  }

  metadata = {
    user-data = "${file("cloud-init.yaml")}"
  }
}
