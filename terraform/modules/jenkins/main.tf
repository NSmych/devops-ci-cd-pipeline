provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "jenkins_server" {
  ami = "ami-0136ddddd07f0584f"
  instance_type = "t2.micro"

  user_data = <<-EOF
                #!/bin/bash
                set -e # Остановить скрипт при первой же ошибке
                exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

                sudo apt-get update -y
                sudo apt-get install -y openjdk-11-jdk
                wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
                sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EF5975CA
                sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
                sudo apt-get update -y
                sudo apt-get install -y jenkins
                sudo systemctl start jenkins
            EOF

  key_name = var.key_name
  security_groups = [ var.security_group ]

  tags = {
    Name = "jenkins-server"
  }
}