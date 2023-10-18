provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "web_server_instance" {
  ami           = "ami-0136ddddd07f0584f" # ID for Ubuntu in eu-west-1
  instance_type = "t2.micro"

  user_data = <<-EOF
                #!/bin/bash
                exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
                apt-get update -y
                apt-get install -y docker.io
                docker pull --platform linux/amd64 nsmych/greeting-container
                docker run -d -p 80:80 nsmych/greeting-container
              EOF

  key_name        = aws_key_pair.ssh_key.key_name
  security_groups = [aws_security_group.allow_ssh.name]

  tags = {
    Name = "greeting-instance-py"
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "aws_console_key"
  public_key = file("~/.ssh/aws_console_key.pub")
}
