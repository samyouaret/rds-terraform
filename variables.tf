variable "db_username" {
  type        = string
  description = "Username for postgres"
  default     = "username"
  sensitive   = true
}

variable "db_password" {
  type        = string
  description = "password for postgres"
  default     = "passw123"
  sensitive   = true
}
