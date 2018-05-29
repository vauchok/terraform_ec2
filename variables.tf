// Module specific variables

variable "instance_name" {
  description = "Used to populate the Name tag. This is done in main.tf"
}

variable "instance_type" {}

variable "ami_id" {
  description = "The AMI to use"
}

variable "number_of_instances" {
  description = "number of instances to make"
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
}

variable "user_data" {
  description = "The path to a file with user_data for the instances"
}

variable "security_groups" {
  description = "Default sg for instance"
  default     = []
}

variable "tags" {
  default = {
    created_by = "terraform"
 }
}
/*
// Variables for providers used in this module
variable "aws_access_key" {}
variable "aws_secret_key" {}
*/

variable "aws_region" {}

