variable "ami_value" {
    description = "we are using the ubuntu AMI"
    type = string
}

variable "instance_value" {
    description = "the instance type is t3.micro"
    type = string
}

variable "enable_public_ip_address" {
    description = "enable the public ip"
    type = bool
}

variable "ec2_count" {
    description = "the count of ec2 instance"
    type = number
  
}

variable "IAM_user_value" {
  description = "creating a 3 IAM users"
  type = list(string)
}

variable "project_env" {
    description = "this is dev env"
    type = map(string)
  
}