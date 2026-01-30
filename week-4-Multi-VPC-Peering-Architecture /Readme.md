# Week 4 — Multi-VPC Peering Architecture

## 🏗️ Architecture Diagram

This setup uses **VPC Peering** to allow network traffic between multiple isolated Virtual Private Clouds.

## 🧰 Implementation

1. Create **two distinct VPCs** (dev and prod).
2. Define **subnets, route tables, and ACLs** for each VPC.
3. Establish a **VPC Peering Connection** between the two.
4. Update **route tables** to enable cross-VPC traffic.
5. Confirm connectivity using EC2 instances ping/SSH.

## 🛠️ Tools Used

| Tool | Purpose | Trade-offs |
|------|---------|------------|
| **AWS VPC Peering** | Enables private links between VPCs | Simple but not transitive |
| **Route Tables** | Direct traffic across peering links | Manual maintenance |
| **Terraform / IaC** | Automate infra provisioning | Learning curve for beginners |

## 🚀 Use Cases

✔ Secure cross-environment communication. 
✔ Shared service access (e.g., central logging).  
✔ Multi-tenant infrastructure.  
✔ Separation of dev/qa/infrastructure environments.


