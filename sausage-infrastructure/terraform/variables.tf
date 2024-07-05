variable "cloud_id" {
  description = "ID облако"
  type        = string
  default     = "b1g3jddf4nv5e9okle7p"
}
variable "folder_id" {
  description = "ID папки"
  type        = string
  default     = "b1gm68de4u794bg8egku"
}
variable "zone" {
  description = "Зона провайдера instance"
  type        = string
  default     = "ru-central1-a"
}
variable "token" {
  description = "Токен, для провайдера"
  type        = string
  default     = ""
}
