provider "aws" {
    region = "${var.aws_region}"
}

module "jenkins-slave" {
  source = "./module"
  
  instance_name = "${var.instance_name}"
  ami_id = "${var.ami_id}"
  number_of_instances = "${var.number_of_instances}"
  security_groups = "${var.security_groups}"
  instance_type = "${var.instance_type}"
  user_data = "${file(var.user_data)}"
  tags = "${var.tags}"
}
