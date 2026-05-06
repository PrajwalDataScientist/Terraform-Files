ami_value            = "ami-091138d0f0d41ff90"
instance_value       = "t2.micro"
enable_public_IP     = true
project_env          = "dev"
vpc_cidr_block       = "10.0.0.0/16"
public_subnets_count = 2
private_subnets_count = 2

alb_ingress = [
  {
    port     = 80
    protocol = "tcp"
    cidr     = "0.0.0.0/0"
  },
  {
    port     = 443
    protocol = "tcp"
    cidr     = "0.0.0.0/0"
  }
]

ec2_ingress = [
  {
    port     = 80
    protocol = "tcp"
  }
]