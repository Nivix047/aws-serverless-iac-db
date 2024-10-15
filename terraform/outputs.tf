output "rds_endpoint" {
  value       = aws_db_instance.postgres_rds.endpoint
  description = "The connection endpoint for the PostgreSQL database"
}

output "db_name" {
  value       = var.db_name  # Pull the database name from the input variable
  description = "The name of the PostgreSQL database"
}

output "db_username" {
  value       = var.db_username  # Pull the username from the input variable
  description = "The username for the PostgreSQL database"
}
