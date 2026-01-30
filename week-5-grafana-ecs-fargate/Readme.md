# Week 5 — Grafana on ECS Fargate

## 🏗️ System Architecture


This task deploys **Grafana** (observability dashboard) as a container on **AWS ECS Fargate** with load balancing.

## 🧰 Implementation

1. Build/pull **Grafana Docker image**.
2. Create **ECS Cluster** and **Fargate service**.
3. Define **Task Definition** (port 3000 exposure).
4. Configure **Application Load Balancer**.
5. Set IAM roles for ECS tasks and load balancer target groups.

## 🛠️ Tools & Trade-Offs

| Tool | Purpose | Trade-offs |
|------|---------|------------|
| **Grafana** | Metrics dashboard | UI complexity; needs data sources |
| **AWS ECS Fargate** | Serverless containers | Simpler ops, more expensive than EC2 |
| **ALB** | HTTP routing | Extra cost, powerful routing |

## 🪶 Real-World Use Cases

✔ Central metrics & logging dashboard  
✔ Alerting on production KPIs  
✔ Multi-tenant monitoring portal  
✔ Dashboard for DevOps observability

