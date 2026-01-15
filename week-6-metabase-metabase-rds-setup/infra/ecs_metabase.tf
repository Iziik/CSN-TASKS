resource "aws_ecs_cluster" "metabase_cluster" {
    name = "metabase-ecs-cluster" 
}

resource "aws_security_group" "metabase_sg" {
    name        = "ecs-metabase_sg"
    description = "Security group for Metabase ECS tasks"
    vpc_id      = var.vpc_id

    ingress {
        from_port   = 3000
        to_port     = 3000
        protocol    = "tcp"
        cidr_blocks = var.allowed_cidr_blocks
    }
       
    

    egress {
            from_port   = 0
            to_port     = 0
            protocol    = "-1"
            cidr_blocks = ["0.0.0.0/0"]
        
    }
}

resource "aws_security_group_rule" "allow_ecs_to_rds_access" {
    type                     = "ingress"
    from_port                = 5432
    to_port                  = 5432
    protocol                 = "tcp"
    security_group_id        = aws_security_group.rds_db.id
    source_security_group_id = aws_security_group.metabase_sg.id
    description              = "Allow Metabase ECS tasks to access RDS database"
  
}

resource "aws_ecs_task_definition" "metabase_task" {
    family                   = "metabase-fargate-task"
    network_mode             = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu                      = "256"
    memory                   = "512"
    execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
    container_definitions    = file("${path.module}/../configuration/metabase-task-definition.json")#defines just the json array
}

 

resource "aws_ecs_service" "metabase_service" {
    name            = "metabase-ecs-service"
    cluster         = aws_ecs_cluster.metabase_cluster.id
    task_definition = aws_ecs_task_definition.metabase_task.arn
    desired_count   = 1
    launch_type     = "FARGATE"

    network_configuration {
        subnets         = var.private_subnet_ids
        assign_public_ip = true
        security_groups = [aws_security_group.metabase_sg.id]
    }
}