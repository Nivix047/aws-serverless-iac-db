variable "db_password" {
  description = "The password for the PostgreSQL database"
  sensitive   = true  # Prevents the password from being printed in logs
}

variable "db_name" {
  description = "The name of the PostgreSQL database"
  default     = "postgres"
}

variable "db_username" {
  description = "The username for the PostgreSQL database"
  default     = "master_user"
}

variable "region" {
  description = "The AWS region where resources will be created"
  default     = "us-west-1"
}
