locals {
  ingress_rules=[
    {
        port=80
        description="allow the port 80"
        protocol="tcp"
        cidr_block=["0.0.0.0/0"]
    },
    {
        port=22
        description="allow the port 22"
        protocol="tcp"
        cidr_block=["0.0.0.0/0"]
    }
  ]
}

locals {
  egress_rules=[
    {
    port=0
    description="allow the 22 port"
    protocol="-1"
    cidr_block=["0.0.0.0/0"]
}]
}