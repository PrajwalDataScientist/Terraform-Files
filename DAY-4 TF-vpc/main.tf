resource "aws_vpc" "terraform_vpc" {
    cidr_block = "10.0.0.0/24"
    tags = {
      Name = "${var.project_env}-instance"
    }
}

resource "aws_subnet" "public_subnet" {
   count = var.public_subnet_count
   vpc_id = aws_vpc.terraform_vpc.id
   cidr_block =cidrsubnet(aws_vpc.terraform_vpc.cidr_block,1,count.index)
    tags = {
      Name= "${var.project_env}-subnet-${count.index}"
    }
   }

resource "aws_internet_gateway" "terraform_IGW" {
    vpc_id = aws_vpc.terraform_vpc.id

    tags = {
      Name= "${var.project_env}-igw"
    }
  
}

resource "aws_route_table" "publice_rout_tabel" {
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform_IGW.id
  }
  tags = {
    Name= "${var.project_env}-public rout tabel"
  }
}

resource "aws_route_table_association" "publice_route_asso" {
  count = var.public_subnet_count
  subnet_id = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.publice_rout_tabel.id
}

resource "aws_security_group" "terraform_security_group" {
    name = "terraform_SG"
    description = "allow post 80 and 22"
    vpc_id = aws_vpc.terraform_vpc.id
    dynamic "ingress" {
        for_each = local.ingress_rules
        content {
          description = ingress.value.description
          from_port = ingress.value.port
          to_port = ingress.value.port
          protocol = ingress.value.protocol
          cidr_blocks = ingress.value.cidr_block
        }
      
    }
  dynamic "egress" {
    for_each = local.egress_rules

    content {
      from_port = egress.value.port
      to_port = egress.value.port
      protocol = egress.value.protocol
      cidr_blocks=egress.value.cidr_block
    }
    
  }
}

resource "aws_instance" "ec2_instance" {
  ami=var.ami_value
  instance_type = var.instance_type_value
  associate_public_ip_address = var.enable_pi_address
  subnet_id = aws_subnet.public_subnet[0].id
  vpc_security_group_ids = [aws_security_group.terraform_security_group.id]

  count = var.ec2_count

    tags = {
    Name = "${var.project_env}-instance"
    }
}