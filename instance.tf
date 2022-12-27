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
  instance_type                        = "t3a.micro"  // TODO(rihoj) make var
  iam_instance_profile                 = "among-us"   // TODO(rihoj) make resource
  associate_public_ip_address          = false        // TODO(rihoj) use NLB to handle pub traffic
  availability_zone                    = "us-east-1d" // TODO(rihoj) Make resource
  ebs_optimized                        = true
  instance_initiated_shutdown_behavior = "stop"
  key_name                             = "amonguseast1" // TODO(rihoj) make resource
  security_groups                      = ["launch-wizard-2"]
  monitoring                           = true
  subnet_id                            = "subnet-fcd8b09b" // TODO(rihoj) make resource

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