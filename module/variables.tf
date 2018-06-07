variable "ami" {
  description = "(Required) The AMI to use for the instance"
}

variable "availability_zone" {
  description = "(Optional) The AZ to start the instance in"
}

variable "placement_group" {
  description = "(Optional) The Placement Group to start the instance in"
}

variable "tenancy" {
  description = "(Optional) The tenancy of the instance (if the instance is running in a VPC). An instance with a tenancy of dedicated runs on single-tenant hardware. The host tenancy is not supported for the import-instance command"
}

variable "ebs_optimized" {
  description = "(Optional) If true, the launched EC2 instance will be EBS-optimized"
  default = false
}

variable "disable_api_termination" {
  description = "(Optional) If true, enables EC2 Instance Termination Protection"
  default = false
}

variable "instance_initiated_shutdown_behavior" {
  description = " (Optional) Shutdown behavior for the instance. Amazon defaults this to stop for EBS-backed instances and terminate for instance-store instances. Cannot be set on instance-store instances. See Shutdown Behavior for more information"
}

variable "instance_type" {
  description = "(Required) The type of instance to start. Updates to this field will trigger a stop/start of the EC2 instance"
}

variable "key_name" {
  description = "(Optional) The key name to use for the instance"
}

variable "get_password_data" {
  description = "(Optional) If true, wait for password data to become available and retrieve it. Useful for getting the administrator password for instances running Microsoft Windows. The password data is exported to the password_data attribute. See GetPasswordData for more information"
}

variable "monitoring" {
  description = "(Optional) If true, the launched EC2 instance will have detailed monitoring enabled"
}

variable "security_groups" {
  description = "(Optional) A list of security group names to associate with. If you are creating Instances in a VPC, use vpc_security_group_ids instead"
  default     = []
}

variable "vpc_security_group_ids" {
  description = "(Optional) A list of security group IDs to associate with"
  default     = []
}

variable "subnet_id" {
  description = "(Optional) The VPC Subnet ID to launch in"
}

variable "associate_public_ip_address" {
  description = "(Optional) Associate a public ip address with an instance in a VPC. Boolean value"
}

variable "private_ip" {
  description = "(Optional) Private IP address to associate with the instance in a VPC"
}

variable "instance_name" {
  description = "Used to populate the Name tag. This is done in main.tf"
}

variable "number_of_instances" {
  description = "Number of instances to make"
}

variable "user_data" {
  description = "The path to a file with user_data for the instances"
}

variable "tags" {
  default = {
    created_by = "terraform"
 }
}
