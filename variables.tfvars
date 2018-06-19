instance_name="jenkins-slave"
instance_type="t2.micro"
number_of_instances=1
count_eip=1
user_data="./userdata.sh"
vpc_security_group_ids=["sg-6a013413","sg-9bcaffe2"]
aws_region="us-west-1"
subnet_id="subnet-37b0de6c"
key_name="wk-iad-dev-instance"

# root_block_device
volume_type_root="standard"
volume_size_root=100
iops_root=1500
delete_on_termination_root=true

# ebs_block_device
device_name_ebs="xvdh"
snapshot_id_ebs=""
volume_type_ebs="gp2"
volume_size_ebs=10
iops_ebs=1500
delete_on_termination_ebs=true
encrypted_ebs=false

# ephemeral_block_device
device_name_ephemeral="/dev/sdk"
virtual_name_ephemeral="ephemeral0"
no_device_ephemeral=false