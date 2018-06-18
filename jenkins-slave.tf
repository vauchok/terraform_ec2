provider "aws" {
  region = "${var.aws_region}"
}

module "jenkins-slave" {
  source = "./module"

  instance_name       = "${var.instance_name}"
  ami                 = "${var.ami}"
  number_of_instances = "${var.number_of_instances}"
  subnet_id           = "${var.subnet_id}"
  key_name            = "${var.key_name}"

  #security_groups = "${var.security_groups}"
  vpc_security_group_ids = "${var.vpc_security_group_ids}"
  instance_type          = "${var.instance_type}"
  user_data              = "${var.user_data}"
  count_eip             = "${var.count_eip}"
}
