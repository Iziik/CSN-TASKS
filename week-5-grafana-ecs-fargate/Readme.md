# Grafana Deployment on ECS

## Task Definition
The objective of this week is to deploy Grafana, a popular open-source dashboard tool, using Amazon ECS with FARGATE.

STEPS;
- Use the official Docker image `grafana/grafana`
- Create an **ECS Cluster**.
- Create a task definition that exposes port 3000
- Run the service/task in a public subnet
- Ensure the associated **Security Group** allows inbound taffic on port 3000.
- Access the service via **Public IP/3000** once running.

`Grafana login credentials`
**username**: `admin`
**Password**: `admin`

