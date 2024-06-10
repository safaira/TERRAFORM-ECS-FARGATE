
resource "aws_default_vpc" "default_vpc" {
}

# subnet
resource "aws_default_subnet" "default_subnet_a" {

  availability_zone = "ap-south-1a"         #   map_public_ip_on_launch = "true"

  tags = {
    Name = "Subnet-1a"
  }
}

resource "aws_default_subnet" "default_subnet_b" {

  availability_zone = "ap-south-1b"         #   map_public_ip_on_launch = "true"

  tags = {
    Name = "Subnet-1b"
  }
}








# terraform init
# terraform validate or terraform fmt
# terraform plan 
# terraform apply or terraform apply -auto-approve
# terraform show state list 
# terraform show state $aws_lb
# terraform destroy