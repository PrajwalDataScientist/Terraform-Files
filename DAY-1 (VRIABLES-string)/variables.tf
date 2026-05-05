variable "ami_value" {
  description = "AWS ami value for ubuntu machine"
  type = string
  default = "ami-091138d0f0d41ff90"
}

variable "instace_type" {
  description = "AWS inatance type"
  type = string
  default = "t3.micro"
}

variable "subnet_value" {
  description = "AWS publice subnet"
  type = string
  default = "subnet-07918a5ee3e4581ad"
  
}

variable "Security_grop_value" {
  description = "Custom vpc"
  type = string
  default = "sg-0f8a6c7c1c13891ff"

}