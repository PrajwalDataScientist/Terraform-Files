<<<<<<< HEAD
resource "aws_instance" "EC2_instance" {
    ami = var.ami_value
    instance_type = var.instace_type
    subnet_id = var.subnet_value
    vpc_security_group_ids = [var.Security_grop_value]
    count = var.EC2_count

    tags = {
      name=" Terraform EC2"
    }
  
=======
resource "aws_instance" "EC2_instance" {
    ami = var.ami_value
    instance_type = var.instace_type
    subnet_id = var.subnet_value
    vpc_security_group_ids = [var.Security_grop_value]
    count = var.EC2_count

    tags = {
      name=" Terraform EC2"
    }
  
>>>>>>> 44c6f24b362e9e27f97d09e1cd81f7421740a87f
}