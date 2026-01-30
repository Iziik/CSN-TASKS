# Week 6 — Metabase with RDS

## 🏗️ System Architecture


This task integrates the **Metabase BI tool** with the **AWS RDS** backend for analytical dashboards.

## 🧰 Implementation Steps

1. Provision **AWS RDS instance** (engine: PostgreSQL/MySQL).
2. Secure RDS with subnet group & security group.
3. Deploy **Metabase app** (Docker/ECS/EC2).
4. Connect Metabase to RDS as the analytics backend.

## 🛠️ Tools + Trade-Offs

| Tool | Purpose | Trade-offs |
|------|---------|------------|
| **Metabase** | BI dashboard for data | UI simplicity, limited complex analytics |
| **AWS RDS** | Managed database | Great uptime, cost vs admin control |
| **ECS or EC2** | Hosting the app | Fargate eases ops, EC2 can be cheaper |

## 🪙 Real-World Use Cases

✔ Business analytics dashboards  
✔ Data-driven decision making  
✔ Reporting for product/finance teams  
✔ Quick internal KPI visualization

