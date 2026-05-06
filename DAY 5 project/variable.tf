variable "ami_value" {
  type = string

  validation {
    condition     = can(regex("^ami-[a-zA-Z0-9]+$", var.ami_value))
    error_message = "AMI must look like ami-xxxxxxxx"
  }
}

variable "instance_value" {
  type = string

  validation {
    condition     = can(regex("^t[2-3]\\.(micro|small|medium)$", var.instance_value))
    error_message = "Allowed: t2.micro/small/medium, t3.micro/small/medium"
  }
}

variable "enable_public_IP" {
  type        = bool
  description = "Enable public IP on instances"
}

variable "project_env" {
  type        = string
  description = "Environment tag"
}

variable "vpc_cidr_block" {
  type = string

  validation {
    condition     = can(cidrnetmask(var.vpc_cidr_block))
    error_message = "Invalid CIDR block"
  }
}

variable "public_subnets_count" {
  type        = number
  description = "At least 2 public subnets for ALB"
}

variable "private_subnets_count" {
  type        = number
  description = "Private subnets for ASG"
}

variable "alb_ingress" {
  type = list(object({
    port     = number
    protocol = string
    cidr     = string
  }))
}

variable "ec2_ingress" {
  type = list(object({
    port     = number
    protocol = string
  }))
}