#EC2 Instance Resource for Module
resource "aws_instance" "ec2_instance" {
    ami = "${var.ami_id}"
    count = "${var.number_of_instances}"
    security_groups = "${var.security_groups}"
    instance_type = "${var.instance_type}"
    user_data = "${file(var.user_data)}"
    tags {
        created_by = "${lookup(var.tags,"created_by")}"
        Name = "${var.instance_name}-${count.index}"
    }
}
