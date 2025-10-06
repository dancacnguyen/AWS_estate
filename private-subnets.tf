resource "aws_subnet" "private_zone1" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.64.0/20"
    availability_zone = "us-east-1a"

    tags = {
        "Name" = "dev-private-us-east-1a"
        #EKS space
    }
}

resource "aws_subnet" "private_zone2" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.64.0/20"
    availability_zone = "us-east-1b"

    tags = {
        "Name" = "dev-private-us-east-1b"
        #EKS space
    }
}