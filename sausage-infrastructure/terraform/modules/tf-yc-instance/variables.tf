variable "platform" {
  description = "Платформы"
  type        = string
  default     = "standard-v1"
}
variable "zone" {
  description = "Зона доступности"
  type        = string
  default     = "ru-central1-a"
}
variable "disk_size" {
  description = "Размер диска[Гб]"
  type        = number
  default     = 30
}
variable "instance_subnet_id" {
  description = "ID подсети"
  type        = string
  default     = "e9bmq2f27li3v3u21i30"
}
variable "image_id" {
  description = "ID образа системы"
  type        = string
  default     = "fd80qm01ah03dkqb14lc"
}
variable "name" {
  description = "Наименование инстанса"
  type        = string
  default     = "chapter5-std-022-44"
}
variable "cores" {
  description = "Количество ядер"
  type        = number
  default     = 2
}
variable "memory" {
  description = "Объём ОЗУ"
  type        = number
  default     = 2
}
variable "preemptible" {
  description = "Прерываямая?"
  type        = bool
  default     = true
}
variable "nat" {
  description = "Нужен публичный доступ?"
  type        = bool
  default     = true
}
