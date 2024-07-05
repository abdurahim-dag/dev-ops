variable "network_id" {
  description = "Наименование сети"
  type        = string
  default     = "k8s-network"
}
variable "subnet_id" {
  description = "Наименование сети"
  type        = string
  default     = "k8s-network"
}
variable "zone" {
  description = "Зона доступности"
  type        = string
  default     = ""
}
variable "service_account_id" {
  description = "The name of the service account"
  type        = string
  default     = ""
}
variable "sg_id" {
  description = "ID security group"
  type        = string
  default     = ""
}