variable "vpc_id" {
  description = "The ID of the VPC where the security group will be created"
  type        = string
}

variable "subnet_id" {
    description= "The ID of the subnet where the EC2 instance will be launched"
    type       = string
}
variable "allowed_cidr" {
  description = "CIDR block allowed to access RDP port"
  type        = string
  default     = "0.0.0.0/0"
}

variable "instance_type" {
    description = "The instance type for the Windows EC2 instance"
    type        = string
    default     = "t2.micro"
}

variable "key_name" {
    description = "The name of the key pair to use for the EC2 instance"
    type        = string
}