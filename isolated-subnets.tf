resource "aws_subnet" "isolated_zone1" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.128.0/20"
    availability_zone = "us-east-1a"

    tags = {
        "Name" = "dev-isolated-us-east-1a"
    }
}

resource "aws_subnet" "isolated_zone2" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.128.0/20"
    availability_zone = "us-east-1b"

    tags = {
        "Name" = "dev-isolated-us-east-1b"
    }
}