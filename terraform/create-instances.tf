# Instance AD

resource "aws_instance" "server01" {
  ami           = "ami-09d416ef29471299a"  
  instance_type = "t2.micro"
  #subnet_id = "subnet-0c5c17ec1467f36a0"
  key_name = "my_key_pair"
  availability_zone = "eu-central-1a"
  tags = {
    Name = "Windows AD"
  }

  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.win-server-nic.id
  }
}
# Instance WSUS

resource "aws_instance" "wsus-01" {
  ami           = "ami-014c4bcfe3cae98f0"  
  instance_type = "t2.micro"
  #subnet_id = "subnet-0c5c17ec1467f36a0"
  key_name = "my_key_pair"
  availability_zone = "eu-central-1a"
  tags = {
    Name = "WSUS"
  }
  

  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.win-wsus-nic.id
  }

}
# EBS Volume for File Server

resource "aws_ebs_volume" "partition-file-server" {
  availability_zone = "eu-central-1a"
  size              = 1
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.partition-file-server.id
  instance_id = aws_instance.wsus-01.id
}

# Instance Test Server

resource "aws_instance" "testsrv-01" {
  ami           = "ami-014c4bcfe3cae98f0"  
  instance_type = "t2.micro"
  #subnet_id = "subnet-0c5c17ec1467f36a0"
  key_name = "my_key_pair"
  availability_zone = "eu-central-1a"
  tags = {
    Name = "Test Server"
  }
  
  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.win-testsrv-nic.id
  }

}