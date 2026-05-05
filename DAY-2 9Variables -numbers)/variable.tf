<<<<<<< HEAD
variable "ami_value" {
  description = "AWS ami value for ubuntu machine"
  type = string
}

variable "instace_type" {
  description = "AWS inatance type"
  type = string
}

variable "subnet_value" {
  description = "AWS publice subnet"
  type = string
  
}

variable "Security_grop_value" {
  description = "Custom vpc"
  type = string

}

variable "EC2_count" {
    description = "EC2 count using COUNT variable"
    type = number
=======
variable "ami_value" {
  description = "AWS ami value for ubuntu machine"
  type = string
}

variable "instace_type" {
  description = "AWS inatance type"
  type = string
}

variable "subnet_value" {
  description = "AWS publice subnet"
  type = string
  
}

variable "Security_grop_value" {
  description = "Custom vpc"
  type = string

}

variable "EC2_count" {
    description = "EC2 count using COUNT variable"
    type = number
>>>>>>> 44c6f24b362e9e27f97d09e1cd81f7421740a87f
}