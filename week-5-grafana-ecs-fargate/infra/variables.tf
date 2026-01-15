variable "aws_region" {
    description = "The AWS region to deploy resources in"
    type = string
    default = "eu-west-2"
}

variable "vpc_id" {
    description = "The region vpc"
    type = string
}

variable "public_subnet_ids" {
    description = "The subnet IDs to deploy resources in"
    type = list(string)  
}

variable "allowed_cidr_blocks" {
    description = "The CIDR blocks for the VPC"
    type = list(string)
    default = ["0.0.0.0/0"]  
}

#variable "task_execution_role_arn" {
#    description = "The ARN of the ECS task execution role"
#    type = string
#}
