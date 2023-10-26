module "ec2" {
  source = "../../modules/ec2"
}

module "jenkins" {
  source         = "../../modules/jenkins"
  key_name       = module.ec2.ssh_key_name
  security_group = module.jenkins.allow_ssh
}
