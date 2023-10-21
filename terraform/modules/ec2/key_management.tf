resource "aws_key_pair" "ssh_key" {
  key_name   = "aws_console_key"
  public_key = file("~/.ssh/aws_console_key.pub")
}
