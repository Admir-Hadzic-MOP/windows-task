resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}
 
 
data "template_file" "userdata_win" {
  template = <<EOF
<script>
echo "" > _INIT_STARTED_
net user ${var.INSTANCE_USERNAME} /add /y
net user ${var.INSTANCE_USERNAME} ${var.INSTANCE_PASSWORD}
net localgroup administrators ${var.INSTANCE_USERNAME} /add
echo "" > _INIT_COMPLETE_
</script>
<persist>false</persist>
EOF
}
 
resource "aws_instance" "win-dc" {
  ami           = data.aws_ami.winsrv19.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.mykey.key_name
  user_data = data.template_file.userdata_win.rendered
  vpc_security_group_ids=["${aws_security_group.allow-all.id}"]
  tags = {
    Name = "win-dc-01"
  }
 root_block_device {
   volume_size = 30
   volume_type = "gp2"
 }
}

resource "aws_instance" "wsus" {
  ami           = data.aws_ami.winsrv19.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.mykey.key_name
  user_data = data.template_file.userdata_win.rendered
  vpc_security_group_ids=["${aws_security_group.onlyrdp.id}"]
  tags = {
    Name = "wsus-01"
  }
 root_block_device {
   volume_size = 30
   volume_type = "gp2"
 }
}

resource "aws_instance" "testsrv" {
  ami           = data.aws_ami.winsrv19.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.mykey.key_name
  user_data = data.template_file.userdata_win.rendered
  vpc_security_group_ids=["${aws_security_group.onlyrdp.id}"]
  tags = {
    Name = "test-01"
  }
 root_block_device {
   volume_size = 30
   volume_type = "gp2"
 }
}

output "ip" {
 
value="${aws_instance.win-dc.public_ip}"
}