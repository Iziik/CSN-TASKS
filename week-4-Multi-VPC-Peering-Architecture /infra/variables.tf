variable "aws_region" {
    description = "AWS region"
    type = string
    default = "eu-west-2"
}

#Configuration for VPC-A
variable "vpc_a_name" {
    description = "Vpc-A name"
    type = string
    default = "VPC-A"
}
variable "vpc_a_cidr" {
    description = "CIDR for a (must be 10.10.0.0/16)"
    type = string
    default = "10.10.0.0/16" 
}

#Configuration for VPC-B
variable "vpc_b_name" {
    description = "Vpc-b name"
    type = string
    default = "VPC-B"
}
variable "vpc_b_cidr" {
    description = "CIDR for b (must be 10.20.0.0/16)"
    type = string
    default = "10.20.0.0/16" 
}

