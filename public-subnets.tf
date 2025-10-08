resource "aws_subnet" "public_zone1" {
    vpc_id = aws_vpc.main.id
    cidr_block = local.vpc_cidr
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true

    tags = {
        "Name" = "${local.env}-public-us-east-1a"
        #here is also where we'd add EKS support if we wanted it
    }
}

resource "aws_subnet" "public_zone2" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.32.0/20"
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = true

    tags = {
        "Name" = "${local.env}-public-us-east-1b"
        #here too for the EKS
    }

}
