data "aws_ami" "al2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "impostor" {
  ami                                  = data.aws_ami.al2.id
  instance_type                        = var.instance_type
  iam_instance_profile                 = aws_iam_instance_profile.instance_profile.name
  associate_public_ip_address          = false
  availability_zone                    = var.instance_availability_zone
  ebs_optimized                        = true
  instance_initiated_shutdown_behavior = "stop"
  key_name                             = var.instance_key_name
  security_groups                      = [aws_security_group.amongus_instance.id]
  monitoring                           = true
  subnet_id                            = var.instance_subnet

  provisioner "remote-exec" {
    inline = ["echo Done!"]

    connection {
      host        = self.private_dns
      type        = "ssh"
      user        = "root"
      private_key = file(var.private_key)
    }
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ec2-user -i '${self.private_dns},' --private-key ${var.private_key} -e 'matchmaker_domain=${aws_route53_record.matchmaker.fqdn}' -e 'game_domain=${aws_route53_record.gameserver.fqdn}' ${path.module}/ansible/playbook.yml"
  }

  root_block_device {
    throughput            = 125
    encrypted             = false
    delete_on_termination = true
    iops                  = 3000
    volume_size           = "8"
    volume_type           = "gp3"
  }

  ebs_block_device {
    delete_on_termination = false
    device_name           = "records"
    volume_size           = "10"
    volume_type           = "gp3"
    iops                  = 3000
    throughput            = 125
  }
  tags = {
    Name = "amongus"
  }
  volume_tags = {
    Name = "amongus"
  }
}