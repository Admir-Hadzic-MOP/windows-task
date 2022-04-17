data "aws_ami" "winsrv19" {
     most_recent = true     
  filter {
       name   = "name"
       values = ["Windows_Server-2019-English-Full-Base-2022.03.09"]  
  }     
  filter {
       name   = "virtualization-type"
       values = ["hvm"]  
  }     
  
  owners = ["amazon"] 
}