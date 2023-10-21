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
