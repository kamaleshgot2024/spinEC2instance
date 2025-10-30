data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["851725294985"]
  filter {
    name   = "name"
    values = ["encrypted-custom-ami"]
  }
}