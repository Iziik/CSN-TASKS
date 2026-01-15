# 1. Find the latest Free Tier Eligible Windows AMI
data "aws_ami" "windows_free" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    # This filter specifically targets official Windows Server 2022 Base images
    values = ["Windows_Server-2022-English-Full-Base-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

# 2. Create the Key Pair (Option: Use your existing local public key)
resource "aws_key_pair" "windows_key" {
  key_name   = "my-windows-key"
  public_key = file("~/.ssh/id_rsa.pub") # Ensure this file exists on your PC
}

# 3. Launch the Free Tier Instance
resource "aws_instance" "windows_free_tier" {
  ami           = data.aws_ami.windows_free.id
  instance_type = "t3.micro" # Use t2.micro or t3.micro for Free Tier
  key_name      = aws_key_pair.windows_key.key_name

  # Ensure storage is within the 30GB Free Tier limit
  root_block_device {
    volume_size = 30 
    volume_type = "gp3" # gp2 or gp3 are eligible
  }

  tags = {
    Name = "FreeTierWindows-2026"
  }
}

resource "aws_security_group" "windows_rdp_sg" {
  name        = "windows_rdp_access"
  description = "Allow RDP from a specified CIDR block"
  vpc_id      = var.vpc_id # security group belongs to this VPC

  ingress {
    description = "RDP from allowed CIDR"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = [var.allowed_cidr]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Windows-RDP-SG"
  }
}

resource "aws_instance" "windows_ec2" {
  ami                         = data.aws_ami.windows_free.id  # Use data source instead
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.windows_key.key_name
  vpc_security_group_ids      = [aws_security_group.windows_rdp_sg.id]
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true

  tags = {
    Name = "Windows-EC2-Instance"
  }
}
