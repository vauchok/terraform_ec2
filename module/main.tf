#EC2 Instance Resource for Module
resource "aws_instance" "ec2_instance" {
  count = "${var.number_of_instances}"

  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  user_data              = "${file(var.user_data)}"
  subnet_id              = "${var.subnet_id}"
  key_name               = "${var.key_name}"
  monitoring             = "${var.monitoring}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  iam_instance_profile   = "${var.iam_instance_profile}"

  #security_groups = "${var.security_groups}"

  associate_public_ip_address          = "${var.associate_public_ip_address}"
  private_ip                           = "${var.private_ip}"
  ipv6_address_count                   = "${var.ipv6_address_count}"
  ipv6_addresses                       = "${var.ipv6_addresses}"
  ebs_optimized                        = "${var.ebs_optimized}"
  volume_tags                          = "${var.volume_tags}"
  root_block_device                    = "${var.root_block_device}"
  ebs_block_device                     = "${var.ebs_block_device}"
  ephemeral_block_device               = "${var.ephemeral_block_device}"
  source_dest_check                    = "${var.source_dest_check}"
  disable_api_termination              = "${var.disable_api_termination}"
  instance_initiated_shutdown_behavior = "${var.instance_initiated_shutdown_behavior}"
  placement_group                      = "${var.placement_group}"
  tenancy                              = "${var.tenancy}"

  tags = "${merge(var.tags, map("Name", var.number_of_instances > 1 ? format("%s-%d", var.instance_name, count.index+1) : var.instance_name))}"
  
  lifecycle {
    # Due to several known issues in Terraform AWS provider related to arguments of aws_instance:
    # (eg, https://github.com/terraform-providers/terraform-provider-aws/issues/2036)
    # we have to ignore changes in the following arguments
    ignore_changes = ["private_ip", "root_block_device"]
  }
  
  credit_specification {
    cpu_credits = "${var.cpu_credits}"
  }


}

resource "aws_eip" "this" {
  count = "${var.count_eip}"
  vpc      = true
  instance = "${element(aws_instance.ec2_instance.*.id, count.index)}"
}