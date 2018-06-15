variable "instance_name" {
  description = "Used to populate the Name tag. This is done in main.tf"
}

variable "instance_type" {
  description = "The type of instance to start"
}

variable "ami_id" {
  description = "The AMI to use"
}

variable "key_name" {
  description = "The key name to use for the instance"
}

variable "number_of_instances" {
  description = "Number of instances to make"
}

variable "subnet_id" {
  description = " The VPC Subnet ID to launch in"
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  default     = []
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

variable "aws_region" {}






variable "get_password_data" {
  description = "(Optional) If true, wait for password data to become available and retrieve it. Useful for getting the administrator password for instances running Microsoft Windows. The password data is exported to the password_data attribute. See GetPasswordData for more information"
}
