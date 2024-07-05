resource "yandex_kubernetes_node_group" "k8s-ng" {
  name        = "k8s-ng"
  description = "Kubernetes node group"
  cluster_id  = var.cluster_id
  instance_template {
    name =  "k8s-ng-{instance.short_id}-{instance_group.id}"
    platform_id = var.platform
    resources {
      cores         = var.cores
      core_fraction = 50
      memory        = var.memory
    }
    boot_disk {
      size = var.disk_size
      type = "network-ssd"
    }
    network_acceleration_type = "standard"
    network_interface {
      security_group_ids = [var.sg_id]
      subnet_ids         = [var.subnet_id]
      nat                = true
    }
    scheduling_policy {
      preemptible = true
    }
  }
  scale_policy {
    auto_scale {
      min     = var.scale_min
      max     = var.scale_max
      initial = var.scale_init
    }
  }  
  deploy_policy {
    max_expansion   = 3
    max_unavailable = 1
  }
  maintenance_policy {
    auto_upgrade = true
    auto_repair  = true
    maintenance_window {
      start_time = "22:00"
      duration   = "10h"
    }
  }
  allowed_unsafe_sysctls = ["kernel.msg*", "net.core.somaxconn"]
}
