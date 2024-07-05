variable "network_zones" {
  description = "Список зон"
  type        = set(string)
  default     = ["ru-central1-a", "ru-central1-b"]
}
