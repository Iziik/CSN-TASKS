
# CSN-TASKS — Cloud Systems & Networking Hands-On Labs

## 📌 Overview

This repository contains a collection of **hands-on cloud infrastructure and networking tasks** designed to build real-world competence in **AWS, cloud networking, containerization, observability, and managed services**.

Each folder represents a **self-contained infrastructure scenario**, progressing from foundational cloud concepts (EC2, VPC) to more advanced architectures (multi-VPC networking, container orchestration, monitoring, and analytics platforms).

The goal of this repository is not just to “deploy resources”, but to **understand why systems are designed a certain way, and where trade-offs exist**.

---

## 🏗️ High-Level Architecture Themes

Across all tasks, the repository explores these core cloud architecture patterns:

- **Isolated networking using AWS VPC**
- **Secure access control using Security Groups and IAM**
- **Compute abstraction layers** (EC2 vs ECS Fargate)
- **Service separation using multi-VPC designs**
- **Observability and analytics using Grafana & Metabase**
- **Managed services vs self-managed infrastructure trade-offs**

Rather than one monolithic system, each task simulates a **real production scenario in isolation**, mirroring how cloud engineers work in real organizations.

---

## 📂 Repository Structure

```

CSN-TASKS/
│
├── week-3-windows-ec2-setup/
│   └── Windows EC2 provisioning & access
│
├── week-4-Multi-VPC-Peering-Architecture/
│   └── Secure networking across multiple VPCs
│
├── week-5-grafana-ecs-fargate/
│   └── Containerized observability platform
│
├── week-6-metabase-metabase-rds-setup/
│   └── Business intelligence with managed databases
│
└── README.md

```

Each folder contains its own **detailed README** explaining:
- Architecture design
- Implementation steps
- Tools used and trade-offs
- Real-world use cases

---

## 🧰 Core Tools & Technologies

### ☁️ Cloud Platform
- **Amazon Web Services (AWS)**  
  Used for compute, networking, container orchestration, load balancing, and managed databases.

### 🖥️ Compute & Orchestration
- **EC2 (Windows & Linux)** — full VM control
- **ECS with Fargate** — serverless container execution

### 🌐 Networking
- **VPC, Subnets, Route Tables**
- **VPC Peering**
- **Security Groups**

### 📊 Observability & Analytics
- **Grafana** — metrics visualization and monitoring
- **Metabase** — business intelligence and data analytics

### 🗄️ Managed Services
- **AWS RDS (PostgreSQL/MySQL)** — managed relational databases

---

## ⚖️ Design Decisions & Trade-Offs

| Choice | Why It Was Used | Trade-Off |
|------|----------------|-----------|
| EC2 | Full OS control & learning fundamentals | More ops overhead |
| ECS Fargate | No server management | Higher cost per workload |
| VPC Peering | Simple cross-VPC communication | No transitive routing |
| RDS | Reliability & backups | Less low-level DB control |
| Managed Load Balancers | Scalability & security | Additional cost |

These trade-offs are intentional and reflect **real production decision-making**, not just lab exercises.

---

## 🌍 Real-World Use Cases Simulated

This repository mirrors scenarios commonly found in:

- **Startup cloud environments**
- **Enterprise internal tooling**
- **Dev/staging/production separation**
- **Monitoring & observability platforms**
- **Data analytics and reporting systems**
- **Hybrid or multi-environment AWS architectures**

Examples:
- A Windows EC2 acting as an admin or bastion host
- Separate VPCs for dev and prod communicating securely
- Grafana monitoring cloud workloads
- Metabase powering business dashboards from production data

---

## 🎯 Who This Repo Is For

- Cloud / DevOps engineers building a portfolio
- Students transitioning into cloud engineering
- Recruiters reviewing hands-on AWS experience

---

## 🚀 Future Improvements

Potential enhancements:
- CI/CD pipelines for deployments
- Centralized logging (ELK / OpenSearch)
- Transit Gateway–based networking
- Secrets management with AWS Secrets Manager

---
