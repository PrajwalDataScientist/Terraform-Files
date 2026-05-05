resource "aws_instance" "EC2_instance" {
    ami = var.ami_value
    instance_type = var.instace_type
    subnet_id = var.subnet_value
    vpc_security_group_ids = [var.Security_grop_value]

    tags = {
      name = "Terraform EC2"
    }
}