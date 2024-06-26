resource "aws_instance" "ec2_provisioners" {
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Name = "test agent from jenkins"
  }
}
