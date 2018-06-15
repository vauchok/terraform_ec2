variable "ami_id" {
  description = "(Required) The AMI to use for the instance"
}

variable "number_of_instances" {
  description = "Number of instances to make"
}

variable "instance_name" {
  description = "Used to populate the Name tag. This is done in main.tf"
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

variable "source_dest_check" {
  description = "(Optional) Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs. Defaults true"
}

variable "user_data" {
  description = "(Optional) The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead"
}

variable "user_data_base64" {
  description = "(Optional) Can be used instead of user_data to pass base64-encoded binary data directly. Use this instead of user_data whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption"
}

variable "iam_instance_profile" {
  description = "(Optional) The IAM Instance Profile to launch the instance with"
}

variable "ipv6_address_count" {
  description = "(Optional) A number of IPv6 addresses to associate with the primary network interface. Amazon EC2 chooses the IPv6 addresses from the range of your subnet"
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource"
}

variable "volume_tags" {
  description = "(Optional) A mapping of tags to assign to the devices created by the instance at launch time"
}

variable "root_block_device" {
  description = "(Optional) Customize details about the root block device of the instance. See Block Devices below for details"
  default = {}
}

variable "ebs_block_device" {
  description = "(Optional) Additional EBS block devices to attach to the instance. See Block Devices below for details"
  default = {}
}

variable "ephemeral_block_device" {
  description = "(Optional) Customize Ephemeral (also known as Instance Store) volumes on the instance. See Block Devices below for details"
  default = {}
}

variable "network_interface" {
  description = "(Optional) Customize network interfaces to be attached at instance boot time. See Network Interfaces below for more details"
  default = {}
}

variable "credit_specification" {
  description = "(Optional) Customize the credit specification of the instance. See Credit Specification below for more details"
  default = {}
}


# timeouts
# https://www.terraform.io/docs/configuration/resources.html#timeouts 
variable "create" {
  description = "(Defaults to 10 mins) Used when launching the instance (until it reaches the initial running state)"
}

variable "update" {
  description = "(Defaults to 10 mins) Used when stopping and starting the instance when necessary during update - e.g. when changing instance type"
}

variable "delete" {
  description = "(Defaults to 20 mins) Used when terminating the instance"
}


# Block Devices
# https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/block-device-mapping-concepts.html
# Currently, changes to *_block_device configuration of existing resources cannot be automatically detected by Terraform.
# After making updates to block device configuration, resource recreation can be manually triggered by using the taint command.
# https://www.terraform.io/docs/commands/taint.html

# root_block_device. Modifying any of the root_block_device settings requires resource replacement:
variable "volume_type_root" {
  description = "(Optional) The type of volume. Can be 'standard', 'gp2', or 'io1'"
}

variable "volume_size_root" {
  description = "(Optional) The size of the volume in gigabytes"
}

variable "iops_root" {
  description = "(Optional) The amount of provisioned IOPS. This is only valid for volume_type of 'io1', and must be specified if using that type"
}

variable "delete_on_termination_root" {
  description = "(Optional) Whether the volume should be destroyed on instance termination"
  default = true
}

# ebs_block_device. Modifying any ebs_block_device currently requires resource replacement.
# ebs_block_device cannot be mixed with external aws_ebs_volume + aws_volume_attachment resources:
variable "device_name_ebs" {
  description = "The name of the device to mount (available for ephemeral_block_device too)"
}

variable "snapshot_id_ebs" {
  description = "(Optional) The Snapshot ID to mount"
}
variable "volume_type_ebs" {
  description = "(Optional) The type of volume. Can be 'standard', 'gp2', or 'io1'"
}

variable "volume_size_ebs" {
  description = "(Optional) The size of the volume in gigabytes"
}

variable "iops_ebs" {
  description = "(Optional) The amount of provisioned IOPS. This is only valid for volume_type of 'io1', and must be specified if using that type"
}

variable "delete_on_termination_ebs" {
  description = "(Optional) Whether the volume should be destroyed on instance termination"
  default = true
}

variable "encrypted_ebs" {
  description = "(Optional) Enables EBS encryption on the volume. Cannot be used with snapshot_id"
  default = false
}

# ephemeral_block_device
# https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html#InstanceStoreDeviceNames
variable "device_name_ephemeral" {
  description = "The name of the device to mount"
}

variable "virtual_name_ephemeral" {
  description = "(Optional) The Instance Store Device Name (e.g. 'ephemeral0')"
}

variable "no_device_ephemeral" {
  description = "(Optional) Suppresses the specified device included in the AMI's block device mapping"
}


# Network interfaces
variable "device_index" {
  description = "(Required) The integer index of the network interface attachment. Limited by instance type"
}
variable "network_interface_id" {
  description = "(Required) The ID of the network interface to attach"
}

variable "delete_on_termination_network_interface" {
  description = "(Optional) Whether or not to delete the network interface on instance termination. Currently, the only valid value is false, as this is only supported when creating new network interfaces when launching an instance"
  default = false
}


# Credit specification
# can be applied/modified to the EC2 Instance at any time
variable "cpu_credits" {
  description = "(Optional) The credit option for CPU usage"
}