variable "cloud_id" {
  description = "ID облако"
  type        = string
  default     = "b1g40f22ddg7uijfcg42"
}
variable "folder_id" {
  description = "ID папки"
  type        = string
  default     = "b1goagja58j7rcupommr"
}
variable "zone" {
  description = "Зона провайдера instance"
  type        = string
  default     = "ru-central1-a"
}
variable "service_account_name" {
  description = "Сервисный аккаунт"
  type        = string
  default     = "zonal-k8s-account"
}