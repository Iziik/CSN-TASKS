# Week 3 — Windows EC2 Setup

## 🏗️ Overview & Architecture

This module focuses on provisioning a **Windows Server EC2 instance** on AWS to serve as a bastion or app host.


The Windows instance resides in a **public subnet** with an Elastic IP for remote access (RDP).

## 🧰 Implementation

1. Create a **VPC** and public subnet.
2. Define a **Security Group** open to RDP (port 3389) from authorized IPs.
3. Provision a **Windows EC2 instance** with the latest Windows Server AMI.
4. Associate **Elastic IP** for internet access.
5. Validate RDP connectivity and IAM role permissions.

## 🛠️ Tools Used

| Tool | Purpose | Trade-offs |
|------|---------|------------|
| **AWS EC2** | Virtual machine hosting | Fully managed, but costs run per hour |
| **AWS VPC** | Network isolation | More secure boundaries; more config overhead |
| **Security Groups** | Firewall rules | Easy to update, limited deep packet inspection |

## 🚀 Real-World Use Cases

✔ Admin workstation for hybrid infra management  
✔ Footprint for on-prem app migration  
✔ Windows-specific workloads (IIS, .NET services)  
✔ Bastion host for internal services

