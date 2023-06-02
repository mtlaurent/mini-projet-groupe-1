module "ec2module" {
  source = "../Module/ec2_ubuntu_bionic"
  instance_type = "t2.nano"
  tag_name = "mini_projet"
  security_group_id = module.security_group.security_group_id
  eip_public_ip = module.create_eip.public_ip
  ssh_key = "../ssh_key/devops-example.pem"
  devops_key_name = "devops-example"
}

module "create_eip" {
  source = "../Module/network"
}

module "link_eip_to_ec2" {
  source = "../Module/links/eip_ec2"
  aws_instance_id = module.ec2module.aws_instance_id
  eip_allocation_id = module.create_eip.eip_allocation_id
}

module "volume_ebs" {
  source = "../Module/volume_ebs"
  ebs_size = "1"
  ebs_region = module.ec2module.availability_zone
}

module "link_ebs_to_ec2" {
  source = "../Module/links/ebs_ec2"
  aws_instance_id = module.ec2module.aws_instance_id
  ebs_vol_id = module.volume_ebs.ebs_vol_id
}

module "security_group" {
  source = "../Module/securitygroup"
  group_security = "group_security_projet"
}
