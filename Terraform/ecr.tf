resource "aws_ecr_repository" "nodejs_image" {
  name = "nodejs image"
  image_tag_mutability = "MUTABLE"
}
