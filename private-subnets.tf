resource "aws_subnet" "private" {
    for_each = local.private_subnets

    vpc_id = aws_vpc.main.id
    cidr_block = each.value.cidr
    availability_zone = each.value.az

    tags = {
        "Name" = "${local.env}-private-us-east-1a"
        #EKS space
    }
}
