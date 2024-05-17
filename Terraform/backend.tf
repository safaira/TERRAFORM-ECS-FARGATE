resource "aws_s3_bucket" "ECS" {
  bucket = "ECS"
  region = "var.aws_region.default"
}