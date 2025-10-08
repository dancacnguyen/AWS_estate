resource "aws_subnet" "isolated_zone1" {
    count = local.create_isoalted_subnets ? 1 : 0
    
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.128.0/20"
    availability_zone = "us-east-1a"

    tags = {
        "Name" = "${local.env}-isolated-us-east-1a"
    }
}

resource "aws_subnet" "isolated_zone2" {
    count = local.create_isoalted_subnets ? 1 : 0

    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.128.0/20"
    availability_zone = "us-east-1b"

    tags = {
        "Name" = "${local.env}-isolated-us-east-1b"
    }

}
