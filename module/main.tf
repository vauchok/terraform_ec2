#EC2 Instance Resource for Module
resource "aws_instance" "ec2_instance" {
    count = "${var.number_of_instances}"

    ami = "${var.ami_id}"
    user_data = "${file(var.user_data)}"
    #security_groups = "${var.security_groups}"
    subnet_id = "${var.subnet_id}"
    vpc_security_group_ids = "${var.vpc_security_group_ids}"
    instance_type = "${var.instance_type}"
    key_name = "${var.key_name}"
    tags = "${merge(var.tags, map("Name", var.number_of_instances > 1 ? format("%s-%d", var.instance_name, count.index+1) : var.instance_name))}"
}
