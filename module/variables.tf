variable "ami" {
  type = "map"

  default = {
    "us-east-1"      = "ami-4bf3d731"
    "us-east-2"      = "ami-e1496384"
    "us-west-1"      = "ami-65e0e305"
    "us-west-2"      = "ami-a042f4d8"
    "eu-central-1"   = "ami-337be65c"
    "eu-west-1"      = "ami-6e28b517"
    "eu-west-2"      = "ami-ee6a718a"
    "eu-west-3"      = "ami-bfff49c2"
    "sa-east-1"      = "ami-f9adef95"
    "ca-central-1"   = "ami-dcad28b8"
    "ap-southeast-2" = "ami-b6bb47d4"
    "ap-southeast-1" = "ami-d2fa88ae"
    "ap-south-1"     = "ami-5d99ce32"
    "ap-northeast-2" = "ami-7248e81c"
    "ap-northeast-1" = "ami-25bd2743"
  }
}

variable "number_of_instances" {
  description = "Number of instances to make"
}

variable "instance_name" {
  description = "Used to populate the Name tag. This is done in main.tf"
}

variable "availability_zone" {
  description = "(Optional) The AZ to start the instance in"
  default     = ""
}

variable "placement_group" {
  description = "(Optional) The Placement Group to start the instance in"
  default     = ""
}

variable "tenancy" {
  description = "(Optional) The tenancy of the instance (if the instance is running in a VPC). An instance with a tenancy of dedicated runs on single-tenant hardware. The host tenancy is not supported for the import-instance command"
  default     = "default"
}

variable "ebs_optimized" {
  description = "(Optional) If true, the launched EC2 instance will be EBS-optimized"
  default     = false
}

variable "disable_api_termination" {
  description = "(Optional) If true, enables EC2 Instance Termination Protection"
  default     = false
}

variable "instance_initiated_shutdown_behavior" {
  description = " (Optional) Shutdown behavior for the instance. Amazon defaults this to stop for EBS-backed instances and terminate for instance-store instances. Cannot be set on instance-store instances. See Shutdown Behavior for more information"
  default     = ""
}

variable "instance_type" {
  description = "(Required) The type of instance to start. Updates to this field will trigger a stop/start of the EC2 instance"
}

variable "key_name" {
  description = "(Optional) The key name to use for the instance"
  default     = ""
}

variable "get_password_data" {
  description = "(Optional) If true, wait for password data to become available and retrieve it. Useful for getting the administrator password for instances running Microsoft Windows. The password data is exported to the password_data attribute. See GetPasswordData for more information"
  default     = false
}

variable "monitoring" {
  description = "(Optional) If true, the launched EC2 instance will have detailed monitoring enabled"
  default     = false
}

variable "vpc_security_group_ids" {
  description = "(Optional) A list of security group IDs to associate with"
  type        = "list"
  default     = []
}

variable "subnet_id" {
  description = "(Optional) The VPC Subnet ID to launch in"
}

variable "associate_public_ip_address" {
  description = "(Optional) Associate a public ip address with an instance in a VPC. Boolean value"
  default     = false
}

variable "private_ip" {
  description = "(Optional) Private IP address to associate with the instance in a VPC"
  default     = ""
}

variable "source_dest_check" {
  description = "(Optional) Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs. Defaults true"
  default     = true
}

variable "user_data" {
  description = "(Optional) The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead"
  default     = ""
}

variable "user_data_base64" {
  description = "(Optional) Can be used instead of user_data to pass base64-encoded binary data directly. Use this instead of user_data whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption"
  default     = ""
}

variable "iam_instance_profile" {
  description = "(Optional) The IAM Instance Profile to launch the instance with"
  default     = ""
}

variable "ipv6_address_count" {
  description = "(Optional) A number of IPv6 addresses to associate with the primary network interface. Amazon EC2 chooses the IPv6 addresses from the range of your subnet"
  default     = "0"
}

variable "ipv6_addresses" {
  description = "Specify one or more IPv6 addresses from the range of the subnet to associate with the primary network interface"
  default     = []
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource"
  default     = {}
}

variable "volume_tags" {
  description = "(Optional) A mapping of tags to assign to the devices created by the instance at launch time"
  default     = {}
}

variable "root_block_device" {
  description = "(Optional) Customize details about the root block device of the instance. See Block Devices below for details"
  default     = []
}

variable "ebs_block_device" {
  description = "(Optional) Additional EBS block devices to attach to the instance. See Block Devices below for details"
  default     = []
}

variable "ephemeral_block_device" {
  description = "(Optional) Customize Ephemeral (also known as Instance Store) volumes on the instance. See Block Devices below for details"
  default     = []
}

variable "credit_specification" {
  description = "(Optional) Customize the credit specification of the instance. See Credit Specification below for more details"
  default     = []
}

variable "create" {
  description = "(Defaults to 10 mins) Used when launching the instance (until it reaches the initial running state)"
  default     = "10m"
}

variable "update" {
  description = "(Defaults to 10 mins) Used when stopping and starting the instance when necessary during update - e.g. when changing instance type"
  default     = "10m"
}

variable "delete" {
  description = "(Defaults to 20 mins) Used when terminating the instance"
  default     = "10m"
}

variable "count_eip" {
  description = "If you want for each enstance - count_eip shoul equal number_of_instances"
  default     = 0
}

variable "aws_region" {
  description = "AWS region for ami"
}

variable "security_groups" {
  description = "(Optional) A list of security group names to associate with. If you are creating Instances in a VPC, use vpc_security_group_ids instead"
  type        = "list"
  default     = []
}

variable "network_interface" {
  description = "(Optional) Customize network interfaces to be attached at instance boot time. See Network Interfaces below for more details"
  default     = []
}

