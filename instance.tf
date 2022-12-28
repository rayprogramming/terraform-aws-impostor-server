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
  availability_zone                    = var.instance_subnet.availability_zone
  ebs_optimized                        = true
  instance_initiated_shutdown_behavior = "stop"
  key_name                             = "amonguseast1" // TODO(rihoj) make variable
  security_groups                      = [aws_security_group.amongus_instance.id]
  monitoring                           = true
  subnet_id                            = var.instance_subnet // TODO(rihoj) make resource

  provisioner "remote-exec" {
    inline = ["echo Done!"]

    connection {
      host        = self.ipv4_address
      type        = "ssh"
      user        = "root"
      private_key = file(var.private_key)
    }
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ec2-user -i '${self.ipv4_address},' --private-key ${var.private_key} -e 'domain=${var.domain}' ${path.module}/ansible/playbook.yml"
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

  }
  tags = {
    Name = "amongus"
  }
  volume_tags = {
    Name = "amongus"
  }
}