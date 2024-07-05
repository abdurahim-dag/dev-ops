output "cluster_id" {
  description = "Список характеристик виртуальных сетей"
  value       = yandex_kubernetes_cluster.k8s-cluster.id
}