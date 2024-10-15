provider "aws" {
  region = var.region
}

# Security Group to Allow PostgreSQL Access on Port 5432
resource "aws_security_group" "postgres_access_group" {
  name        = "postgres-access-group-iac"
  description = "Allow PostgreSQL access"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Open access (limit this in production)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create the RDS PostgreSQL Database
resource "aws_db_instance" "postgres_rds" {
  identifier          = "aws-serverless-iac-db" # Unique name to avoid conflicts
  allocated_storage   = 20
  storage_type        = "gp2"
  engine              = "postgres"
  engine_version      = "14.13"
  instance_class      = "db.t4g.micro"  # Free tier eligible instance
  db_name                = var.db_name
  username            = var.db_username
  password            = var.db_password  # Password from variable
  publicly_accessible = true  # Allow external access (for now)

  vpc_security_group_ids = [aws_security_group.postgres_access_group.id]
  skip_final_snapshot    = true
}
