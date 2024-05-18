resource "aws_ecr_repository" "nodejs_image" {
  name = "nodejs_image"
  image_tag_mutability = "MUTABLE"
}
