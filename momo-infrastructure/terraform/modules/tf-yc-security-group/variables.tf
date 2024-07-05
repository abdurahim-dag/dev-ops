variable "security_group_name" {
  description = "Название security group"
  type        = string
  default     = "k8s-main-sg"
}
variable "network_id" {
  description = "Наименование сети"
  type        = string
  default     = ""
}
variable "subnet_id" {
  description = "Наименование сети"
  type        = string
  default     = ""
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
