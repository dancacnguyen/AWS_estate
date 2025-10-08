locals {
    region = "us-east-1"
    vpc_cidr = "10.0.0.0/20"
    env = "dev" 

    azs = ["us-east-1a", "us-east-1b"]
    public_subnets = ["10.0.0.0/20", "10.0.32.0/20"]
    
    private_subnets = {
        public_1 = {
            cidr = "10.0.64.0/20"
            az = "us-east-1a"
        }
        public_2 = {
            cidr = "10.0.96.0/20"
            az = "us-east-1b"
        }
    }
}
