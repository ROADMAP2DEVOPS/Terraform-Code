resource "aws_instance" "MyFirstInstnace" {
  count         = 3
  ami           = "ami-00c6177f250e07ec1"
  instance_type = "t2.micro"

  tags = {
    Name = "MyFirstInstnace-${count.index}"
  }
}