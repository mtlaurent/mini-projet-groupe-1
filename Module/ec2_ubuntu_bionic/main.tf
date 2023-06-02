data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.devops_key_name

  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = var.tag_name
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt install nginx -y",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
  
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = ssh_key 
      host        = self.public_ip
    }
    }
  provisioner "local-exec" {
  command = "echo 'Adresse IP public: ${var.eip_public_ip}' > ip_ec2-projet.txt"
  }
}