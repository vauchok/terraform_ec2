variable "instance_name" {}
variable "instance_type" {}
variable "key_name" {}
variable "number_of_instances" {}
variable "subnet_id" {}

variable "vpc_security_group_ids" {
  type = "list"
}

variable "user_data" {}
variable "aws_region" {}
variable "count_eip" {}

provider "aws" {
  region = "${var.aws_region}"
}

variable "root_block_device" {
  description = "(Optional) Customize details about the root block device of the instance. See Block Devices below for details"
  default     = []
}

variable "ebs_block_device" {
  description = "(Optional) Additional EBS block devices to attach to the instance. See Block Devices below for details"
  default     = []
}


# Block Devices
# https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/block-device-mapping-concepts.html
# Currently, changes to *_block_device configuration of existing resources cannot be automatically detected by Terraform.
# After making updates to block device configuration, resource recreation can be manually triggered by using the taint command.
# https://www.terraform.io/docs/commands/taint.html

# root_block_device. Modifying any of the root_block_device settings requires resource replacement:
variable "volume_type_root" {
  description = "(Optional) The type of volume. Can be 'standard', 'gp2', or 'io1'"
  default     = "standard"
}

variable "volume_size_root" {
  description = "(Optional) The size of the volume in gigabytes"
  default     = 100
}

variable "iops_root" {
  description = "(Optional) The amount of provisioned IOPS. This is only valid for volume_type of 'io1', and must be specified if using that type"
  default     = 1500
}

variable "delete_on_termination_root" {
  description = "(Optional) Whether the volume should be destroyed on instance termination"
  default     = true
}



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

  root_block_device [{
    volume_type = "${var.volume_type_root}"
    volume_size = "${var.volume_size_root}"
    iops = "${var.iops_root}"
    delete_on_termination = "${var.delete_on_termination_root}"
  }]
/*
  ebs_block_device {
    count = "${var.count_ebs}"
    device_name = "${var.device_name_ebs}"
    snapshot_id = "${var.snapshot_id_ebs}"
    volume_type = "${var.volume_type_ebs}"
    volume_size = "${var.volume_size_ebs}"
    iops = "${var.iops_ebs}"
    delete_on_termination = "${var.delete_on_termination_ebs}"
    encrypted = "${var.encrypted_ebs}"
  }
  */
}
