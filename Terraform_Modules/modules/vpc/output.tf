
output "project_name" {
  value = var.project_name
}

output "vpc_id" {
  value = aws_vpc.realtechie.id
}

output "public_subnet_az1_id" {
  value = aws_subnet.realtechiePub-Sub1.id
}

output "public_subnet_az2_id" {
  value = aws_subnet.realtechiePub-Sub2.id
}

output "private_subnet_az1_id" {
  value = aws_subnet.realtechiePub-Sub3.id
}

output "private_subnet_az2_id" {
  value = aws_subnet.realtechiePri-Sub1.id
}

output "private_subnet_az3_id" {
  value = aws_subnet.realtechiePri-Sub2.id
}

output "private_subnet_az4_id" {
  value = aws_subnet.realtechiePri-Sub3.id
}

output "internet_gateway" {
  value = aws_internet_gateway.realtechie-igw.id
}