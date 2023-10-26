resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins-sg"
  description = "Jenkins Security Group"
  # vpc_id      = var.vpc_id  # Убедитесь, что вы задали переменную VPC, если используете VPC.

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Рекомендуется ограничить это только вашим IP, если возможно.
  }

  ingress {
    description = "Jenkins Web UI"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Рекомендуется ограничить это только вашим IP или IP-адресами вашей команды.
  }

  ingress {
    description = "Jenkins agent"
    from_port   = 50000
    to_port     = 50000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Рекомендуется ограничить это только IP-адресами агентов.
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins-sg"
  }
}
