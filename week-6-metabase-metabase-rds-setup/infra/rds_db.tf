resource "aws_security_group" "rds_db" {
    name        = "rds_db_sg"
    description = "Security group for RDS database"
    vpc_id      = var.vpc_id

    egress {
            from_port   = 0
            to_port     = 0
            protocol    = "-1"
            cidr_blocks = ["0.0.0.0/0"]
        }
}

resource "aws_db_instance" "metabase_db" {
    identifier              = "metabase-db-instance"
    engine                  = "postgres"
    instance_class          = "db.t3.micro"
    allocated_storage       = 20
    username                = var.db_username
    password                = var.db_password
    vpc_security_group_ids  = [aws_security_group.rds_db.id]
    db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
    skip_final_snapshot     = true
    publicly_accessible     = false
    multi_az                = false
    storage_type            = "gp2"
    deletion_protection     = false
}

resource "aws_db_subnet_group" "rds_subnet_group" {
    name       = "rds-subnet-group"
    subnet_ids = var.private_subnet_ids

    tags = {
        Name = "RDS subnet group"
    }
}
