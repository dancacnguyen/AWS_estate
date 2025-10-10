terraform {
  backend "s3" {
    bucket         = "b-n-c-rem-tfstate-20251009" #S3
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "aws-rem-terraform-lock"
    encrypt        = true
  }
}
