variable "cluster_id" {
  description = "ID папки"
  type        = string
  default     = ""
}
variable "sg_id" {
  description = "The name of the service account"
  type        = string
  default     = ""
}
variable "platform" {
  description = "Платформа"
  type        = string
  default     = "standard-v2"
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
variable "subnet_id" {
  description = "ID образа системы"
  type        = string
  default     = "fd80qm01ah03dkqb14lc"
}
variable "disk_size" {
  description = "Размер диска[Гб]"
  type        = number
  default     = 30
}
variable "scale_min" {
  description = "Наименование сети"
  type        = number
  default     = 1
}
variable "scale_max" {
  description = "Зона доступности"
  type        = number
  default     = 1
}
variable "scale_init" {
  description = "ID подсети"
  type        = number
  default     = 1
}