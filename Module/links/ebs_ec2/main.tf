resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = var.ebs_vol_id
  instance_id = var.aws_instance_id
}