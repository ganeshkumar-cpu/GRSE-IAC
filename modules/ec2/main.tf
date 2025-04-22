resource "aws_instance" "this" {
  for_each = var.ec2_instances

  ami           = each.value.ami
  instance_type = each.value.instance_type
  subnet_id     = var.subnet_map[each.key]
  vpc_security_group_ids = var.sg_map[each.key]
  key_name      = var.key_name

  root_block_device {
    volume_size = each.value.root_volume
    volume_type = "gp3"
  }

  tags = {
    Name = each.key
  }
}

resource "aws_ebs_volume" "additional" {
  for_each = {
    for inst_key, inst in var.ec2_instances :
    inst_key => inst if contains(keys(inst), "ebs_volume")
  }

  availability_zone = aws_instance.this[each.key].availability_zone
  size              = each.value.ebs_volume
  type              = "gp3"

  tags = {
    Name = "${each.key}-extra-ebs"
  }
}

resource "aws_volume_attachment" "attach_extra" {
  for_each = aws_ebs_volume.additional

  device_name = "/dev/sdf"
  instance_id = aws_instance.this[each.key].id
  volume_id   = each.value.id
}

