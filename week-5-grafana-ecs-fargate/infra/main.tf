resource "aws_ecs_cluster" "grafana_cluster" {
  name = "grafana-ecs-cluster"
}

resource "aws_security_group" "grafana_sg" {
  name        = "grafana-sg"
  description = "Security group for Grafana ECS Fargate service"
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

resource "aws_ecs_task_definition" "grafana_task" {
  family                   = "grafana-fargate-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode(jsondecode(file("${path.module}/../configuration/task-definition.json")).containerDefinitions)
} #Extract the json array since it is defined in a json object

resource "aws_ecs_service" "grafana_service" {
  name            = "grafana-ecs-service"
  cluster         = aws_ecs_cluster.grafana_cluster.id
  task_definition = aws_ecs_task_definition.grafana_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = var.public_subnet_ids
    security_groups = [aws_security_group.grafana_sg.id]
    assign_public_ip = true
  }

  deployment_controller {
    type = "ECS"
  }
}



