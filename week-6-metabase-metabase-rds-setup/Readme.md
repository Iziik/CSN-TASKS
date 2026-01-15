# Metabase Deployment on ECS Fargate with RDS PostgreSQL

## Task Description
The objective of this week is to deploy the Metabase analytics tool on Amazon ECS using Fargate and connect it to a managed POstgreSQL database hosted on Amazon RDS.

STEPS;
- Use the official **Metabase Docker image** from Docker Hub
- Deploy an **RDS PostgreSQL database** instance
- Configure the necessary **environment variables** in the metabase task definition for database connectivity.
- Ensure both ECS and RDS are in the **same VPC** for communication.
- The **RDS security group** must allow inbound traffic on **port 5432** only from the ECS Fargate task's security group
