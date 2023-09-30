resource "aws_key_pair" "realtechie_key" {
    key_name = "realtechie_key"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}

# use data source to get all avalablility zones in region
data "aws_availability_zones" "available_zones" {}


#Create AWS Instance
resource "aws_instance" "MyFirstInstnace" {
  ami                     = lookup(var.AMIS, var.AWS_REGION)
  instance_type           = var.instance_type
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  key_name      = aws_key_pair.realtechie_key.key_name
  vpc_security_group_ids  = [aws_security_group.realtechie-sg.id]
  subnet_id = aws_subnet.realtechiePub-Sub1.id

  tags = {
    Name = "${var.project_name}-Ec2Instance"
  }
}

output "public_ip" {
  value = aws_instance.MyFirstInstnace.public_ip 
}

#EBS resource Creation
resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone      = data.aws_availability_zones.available_zones.names[0]
  size                   = 50
  type                   = "gp2"

  tags = {
    Name = "Secondary Volume Disk"
  }
}

#Atatch EBS volume with AWS Instance
resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.ebs-volume-1.id
  instance_id = aws_instance.MyFirstInstnace.id
}

#TO CREATE SSH-KEYGEN
#ssh-keygen -f <keyname>

#Mounting the disk
#df -h
#lsblk
#mkfs.ext4 /dev/xvdh
#mkdir -p data
#mount /dev/xvdh /data
#to secure reboot...................
#vi /etc/fstab
#/dev/xvdh /data ext4 defaults 0 0