variable "aws_region" {
  type        = string
  description = "Região AWS"
  default     = "sa-east-1"
}

variable "project_name" {
  type        = string
  description = "Nome do projeto"
  default     = "pedido-veloz"
}

variable "environment" {
  type        = string
  description = "Ambiente"
  default     = "dev"
}
