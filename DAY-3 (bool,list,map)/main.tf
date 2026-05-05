resource "aws_instance" "EC2_instance" {
    ami=var.ami_value
    instance_type = var.instance_value
    associate_public_ip_address = var.enable_public_ip_address
    count = var.ec2_count
    subnet_id ="subnet-07918a5ee3e4581ad"
    vpc_security_group_ids = ["sg-0f8a6c7c1c13891ff"]
    tags = var.project_env
}

resource "aws_iam_user" "IAM_User" {
    count=length(var.IAM_user_value)
    name = var.IAM_user_value[count.index]
  
}

