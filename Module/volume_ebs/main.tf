resource "aws_ebs_volume" "ebs_vol" {
  availability_zone = var.ebs_region
  size              = var.ebs_size
}
