variable "aws_region" {
    description = "The AWS region to deploy resources in"
    type = string
    default = "eu-west-2"
}

variable "vpc_id" {
    description = "The region vpc"
    type = string
}

variable "private_subnet_ids" {
    description = "The subnet IDs for both tasks"
    type = list(string)  
}

variable "db_username" {
    description = "The username for the RDS database"
    type = string
    default = "metabaseadmin"  
}

variable "db_password" {
    description = "The password for the RDS database"
    type = string
    sensitive = true 
}

variable "allowed_cidr_blocks" {
    description = "CIDR blocks allowed to access Metabase"
    type = list(string)
    default = ["0.0.0.0/0"]
}
