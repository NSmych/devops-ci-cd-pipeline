# Мы хотим вывести публичный IP-адрес созданного нами EC2-инстанса
output "instance_public_ip" {
  value = aws_instance.web_server_instance.public_ip
}