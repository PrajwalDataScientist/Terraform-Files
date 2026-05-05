variable "ami_value" {
    description = "This is aws ubuntu ami"
    type = string
}
variable "instance_type_value" {
    description = "This is aws ec2 instance"
    type = string
}
variable "ec2_count" {
    description = "the count of ec2 instance"
    type = number
}

variable "enable_pi_address" {
    description = "enable the public IP address"
    type = bool
}

variable "public_subnet_count" {
    description = "the aws public subnet value "
    type = number
}
variable "project_env" {
    description = "used the .tfvars file based on env"
  
}

