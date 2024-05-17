terraform {
  backend "s3" {
    bucket  = "ecs"
    region  = "us-east-1"
    key     = "ecs-fargate/terraform.tfstate"
    encrypt = true
  }
}