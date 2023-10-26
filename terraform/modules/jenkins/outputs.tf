output "jenkins_server_ip" {
  value = aws_instance.jenkins_server.public_ip
}

output "allow_ssh" {
  value = aws_security_group.jenkins_sg.name
}
