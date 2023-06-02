variable "instance_type" {
  description = "Type d'instance EC2 à déployer"
  default     = "t2.nano"
}
variable "tag_name" {
  description = "Tag pour l'instance EC2"
  default     = "ec2-Mathis"
}

variable "security_group_id" {
  type = string
}

variable "eip_public_ip" {
  type = string
}
variable "ssh_key" {
  type = string
}
variable "devops_key_name" {
  type = string
}