# Serverless Application using Terraform and AWS - RDS Database Management

## Project Overview

This repository is part of a larger project that focuses exclusively on database management using Infrastructure as Code (IaC) with Terraform. The primary goal is to test AWS deployment and build a serverless cloud architecture, leveraging Terraform's capabilities for efficient and replicable infrastructure management.

The database is managed using AWS RDS (PostgreSQL) and containerized with Docker. This design ensures secure, scalable, and efficient database management in the cloud. Key features include data encryption at rest, automated backup and recovery strategies, and seamless integration with a broader AWS architecture. Other components of the project—such as Lambda functions, API Gateway, ECR, and a client-side frontend—will be managed in separate repositories.

## Key Features

- **AWS RDS (PostgreSQL):** Utilizes managed relational database services with high availability, automated backups, and encryption at rest.
- **Terraform IaC:** Implements Infrastructure as Code to facilitate the replication and management of the database setup, allowing for consistent environments across different stages of development.
- **Docker Containerization:** Ensures a consistent environment setup for database management and testing, minimizing discrepancies between development and production environments.
- **Data Encryption at Rest:** All data stored in AWS RDS is encrypted using AWS KMS to ensure security and compliance.
- **Backup and Recovery:** Automated backup configuration and point-in-time recovery strategies are implemented to prevent data loss.

## Repository Contents

This repository contains the following key files:

- **init-db/init.sql:** SQL script to initialize the database with tables (users, products, purchases) and sample data.
- **app.py:** Python script to establish a connection to the RDS instance and run the SQL script for database initialization.
- **Dockerfile:** Defines the containerized environment using Python 3.11 and installs necessary dependencies.
- **docker-compose.yml:** Sets up the containerized services for the project, including environment variables for database connection.
- **.env:** A file (not included in this repo for security reasons) that contains environment variables like database host, port, username, and password.
- **Terraform Files:** Includes all Terraform configurations for managing the infrastructure, such as main.tf, outputs.tf, and variables.tf.

## Getting Started

### Prerequisites

- AWS RDS instance for PostgreSQL, set up with data encryption at rest and automated backups.
- Docker and Docker Compose installed on your local machine.
- Terraform installed on your local machine.
- API testing tools like Postman or Insomnia for testing the CRUD operations.

### Setup Steps

1. **Create AWS RDS Instance:**

   - Set up a PostgreSQL RDS instance via the AWS Management Console.
   - Ensure the instance is in a private VPC and has encryption at rest enabled.
   - Configure automated backups and point-in-time recovery.

2. **Configure Environment Variables:**

   - Create a .env file at the root of your project directory with the necessary environment variables.

3. **Run the Application:**

   - Build and run the Docker containers using Docker Compose:
     ```bash
     docker-compose up --build
     ```
   - This will set up a Python container that connects to the RDS instance and initializes the database with the SQL scripts.

4. **Verify Database Setup:**
   - Use a PostgreSQL client or API testing tools like Postman or Insomnia to verify that the users, products, and purchases tables have been created in your RDS instance.
   - Sample data should also be present in these tables, as defined in init.sql.

## Things to Look Out For

- **Terraform State Files:** Remember to add Terraform-generated files to your `.gitignore`, as they can become too large to push to Git. This prevents headaches when trying to debug push errors due to large files.
- **Environment Variables:** Ensure that your `.env` file is configured correctly with the necessary database connection details.
- **IAM Permissions:** Make sure that your AWS credentials have the necessary permissions to create and manage the RDS instances and security groups.

## Security and Best Practices

- **Encryption at Rest:** AWS KMS is used to ensure that all data stored in RDS is encrypted.
- **IAM Roles:** Use least-privilege IAM roles to restrict access to the RDS instance.
- **Backup and Recovery:** Automated backups and point-in-time recovery are enabled to safeguard against data loss.

## Technologies Used

- **AWS RDS (PostgreSQL):** Relational database management.
- **Docker:** Containerization for local development.
- **psycopg2:** PostgreSQL adapter for Python to interact with the database.
- **Terraform:** Infrastructure as Code for managing and provisioning resources.

## Contributing

Feel free to submit issues or pull requests if you find bugs or have suggestions to improve the project.

## Feedback

Always open to feedback and looking forward to connecting with professionals in the tech space!
