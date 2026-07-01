variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project Name"
  type        = string
  default     = "lite-thinking-devops"
}

variable "environment" {
  description = "Environment"
  type        = string
  default     = "dev"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "EC2 Key Pair"
  type        = string
  default     = "jeisson-devops-key"
}

variable "db_name" {
  type    = string
  default = "retodb"
}

variable "db_user" {
  type    = string
  default = "admin"
}

variable "db_password" {
  type        = string
  description = "RDS Password"
  sensitive   = true
}