provider "aws" {
  region = "${var.aws_region}"
}

variable "instance_name" {}
variable "instance_type" {}
variable "key_name" {}
variable "number_of_instances" {}
variable "subnet_id" {}
variable "vpc_security_group_ids" { type = "list" }
variable "user_data" {}
variable "aws_region" {}
variable "count_eip" {}


# Block Devices
# https://www.terraform.io/docs/providers/aws/r/instance.html#block-devices

# root_block_device
variable "volume_type_root" {}
variable "volume_size_root" {}
variable "iops_root" {}
variable "delete_on_termination_root" {}

# ebs_block_device
variable "device_name_ebs" {}
variable "snapshot_id_ebs" {}
variable "volume_type_ebs" {}
variable "volume_size_ebs" {}
variable "iops_ebs" {}
variable "delete_on_termination_ebs" {}
variable "encrypted_ebs" {}

# ephemeral_block_device
variable "device_name_ephemeral" {}
variable "virtual_name_ephemeral" {}
variable "no_device_ephemeral" {}


# Network interfaces
# https://www.terraform.io/docs/providers/aws/r/instance.html#network-interfaces
variable "device_index" {}
variable "network_interface_id" {}
variable "delete_on_termination_network_interface" {}


module "jenkins-slave" {
  source = "./module"

  instance_name          = "${var.instance_name}"
  number_of_instances    = "${var.number_of_instances}"
  subnet_id              = "${var.subnet_id}"
  key_name               = "${var.key_name}"
  aws_region             = "${var.aws_region}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  instance_type          = "${var.instance_type}"
  user_data              = "${var.user_data}"
  count_eip              = "${var.count_eip}"

  root_block_device = [{
    volume_type           = "${var.volume_type_root}"
    volume_size           = "${var.volume_size_root}"
    iops                  = "${var.iops_root}"
    delete_on_termination = "${var.delete_on_termination_root}"
  }]

  ebs_block_device = [{
    device_name           = "${var.device_name_ebs}"
    snapshot_id           = "${var.snapshot_id_ebs}"
    volume_type           = "${var.volume_type_ebs}"
    volume_size           = "${var.volume_size_ebs}"
    iops                  = "${var.iops_ebs}"
    delete_on_termination = "${var.delete_on_termination_ebs}"
    encrypted             = "${var.encrypted_ebs}"
  }]

  ephemeral_block_device = [{
    device_name  = "${var.device_name_ephemeral}"
    virtual_name = "${var.virtual_name_ephemeral}"
    no_device    = "${var.no_device_ephemeral}"
  }]

  network_interface = [{
    device_index = "${var.device_index}"
    network_interface_id = "${var.network_interface_id}"
    delete_on_termination = "${var.delete_on_termination_network_interface}"
  }]
}
