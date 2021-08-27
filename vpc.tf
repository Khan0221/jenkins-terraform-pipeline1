resource "aws_vpc" "demo" {
    cidr_block       = "70.70.0.0/16"
    instance_tenancy = "default"

    tags = {
        Name = "demo-vpc"
    }
}
resource "aws_subnet" "demo1" {
    vpc_id     = aws_vpc.demo.id
    cidr_block = "70.70.1.0/28"

    tags = {
        Name = "subnet1"
    }
}
resource "aws_subnet" "demo2" {
    vpc_id     = aws_vpc.demo.id
    cidr_block = "70.70.1.16/28"

    tags = {
        Name = "subnet2"
    }
}
resource "aws_interenet_gateway" "intgw" {
    vpc_id = aws_vpc.demo.id

    tags = {
        Name = "pubgw"
    }
}
resource "aws_route_table" "Pub_RT" {
    vpc_id = aws_vpc.demo.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_interenet_gateway.intgw.id
    }

    tags = {
        Name = "pubint"
    }
}
resource "aws_route_table" "Private_RT" {
    vpc_id = aws_vpc.demo.id
}
