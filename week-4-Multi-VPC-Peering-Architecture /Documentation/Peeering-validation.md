# VPC Peering Connection Validiation

This is to ensure VPC Peering connection is correctly configured and ready.

### Verify Connection Status
- Navigate to VPC dashboard in the AWS console
- Click **Peering connectionw**.
- Locate the connection named `VPC-A-to-VPC-B-Peer`
- Confirm that the Status column shows **Active**

### Verify Route Tables
Check that the new routes have been successfully added to the Route Tables.

#### VPC-A Route Table 
- Go to **Route Tables** and select `VPC-A-RT`
- View the Routes tab
- You must see `10.20.0.0/16` pointing to target starting with `pcx-`(VPC Peering Connection ID)

#### VPC-B Route Table 
- Go to **Route Tables** and select `VPC-B-RT`
- View the Routes tab
- You must see `10.10.0.0/16` pointing to target starting with `pcx-`(VPC Peering Connection ID)
   