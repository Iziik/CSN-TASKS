terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
      }
    }
}

provider "aws" {
    region = var.aws_region 
}

resource "aws_vpc" "VPC_A" {
    cidr_block = var.vpc_a_cidr
    tags = {
      "Name" = var.vpc_a_name 
    }
}

resource "aws_subnet" "vpc_a_public_subnet" {
    vpc_id = aws_vpc.VPC_A.id 
    cidr_block = "10.10.1.0/24"
    map_public_ip_on_launch = true
    tags = {
      Name = "${var.vpc_a_name}-Public"
    }
}


resource "aws_subnet" "vpc_a_priavte_subnet" {
    vpc_id = aws_vpc.VPC_A.id 
    cidr_block = "10.10.2.0/24"
    map_public_ip_on_launch = true
    tags = {
      Name = "${var.vpc_a_name}-Private"
    }
}

resource "aws_route_table" "vpc_a_rt" {
    vpc_id = aws_vpc.VPC_A.id
    tags = {
        Name = "${var.vpc_a_name}"
    }
    
  
}

resource "aws_route_table_association" "vpc_a_public_assoc" {
   subnet_id = aws_subnet.vpc_a_public_subnet.id
   route_table_id = aws_route_table.vpc_a_rt.id 
}

resource "aws_vpc" "VPC_B" {
    cidr_block = var.vpc_b_cidr
    tags = {
      Name = "${var.vpc_b_name}"
    }
}

resource "aws_subnet" "vpc_b_public_subnet" {
    vpc_id = aws_vpc.VPC_B.id
    cidr_block = "10.20.1.0/24"
    map_public_ip_on_launch = true
    tags = {
        Name = "${var.vpc_b_name}-Public"
    }
}

resource "aws_subnet" "vpc_b_priavte_subnet" {
    vpc_id = aws_vpc.VPC_B.id
    cidr_block = "10.20.2.0/24"
    tags = {
        Name = "${var.vpc_b_name}-Private"
    } 
}

resource "aws_route_table" "vpc_b_rt" {
    vpc_id = aws_vpc.VPC_B.id
    tags = {
        Name = "${var.vpc_b_name}"
    }
}

resource "aws_route_table_association" "vpc_b_public_assoc" {
   subnet_id = aws_subnet.vpc_b_public_subnet.id
   route_table_id = aws_route_table.vpc_b_rt.id 
}

#Create VPC Peering Connection
resource "aws_vpc_peering_connection" "peer" {
    vpc_id      = aws_vpc.VPC_A.id
    peer_vpc_id = aws_vpc.VPC_B.id
    tags = {
        Name = "VPC-A-to-VPC-B-Peering"
    }
}

#Accept the VPC Peering Connection
resource "aws_vpc_peering_connection_accepter" "peer" {
    vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
    auto_accept               = true
}

#Add route to VPC A's Route Table to VPC B
resource "aws_route" "vpc_a_to_b" {
    route_table_id = aws_route_table.vpc_a_rt.id
    destination_cidr_block = var.vpc_b_cidr
    vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}

#Add route to VPC B's Route Table to VPC A
resource "aws_route" "vpc_b_to_a" {
    route_table_id = aws_route_table.vpc_b_rt.id
    destination_cidr_block = var.vpc_a_cidr
    vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}



