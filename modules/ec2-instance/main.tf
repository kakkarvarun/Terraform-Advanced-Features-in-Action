# Creates EC2s based on input count
resource "aws_instance" "ec2" {
  count         = var.instance_count
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "modular-instance-${count.index}"
  }
}
