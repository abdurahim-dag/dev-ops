variable "network_zones" {
  description = "Список ip-адресов и названий зон"
  type = list(object({
      name = string
      cidr = string
  }))
  default = [
    {
      name = "ru-central1-a"
      cidr = "192.168.10.0/24"
    },
  ]
}