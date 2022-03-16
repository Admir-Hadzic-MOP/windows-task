# Elastic IPs

resource "aws_eip" "one" {
  vpc                       = true
  network_interface         = aws_network_interface.win-server-nic.id
  associate_with_private_ip = "10.11.12.10"
  depends_on = [
    aws_internet_gateway.gw
  ]
   
}

resource "aws_eip" "second" {
  vpc                       = true
  network_interface         = aws_network_interface.win-wsus-nic.id
  associate_with_private_ip = "10.11.12.11"
  depends_on = [
    aws_internet_gateway.gw
  ]
   
}

resource "aws_eip" "third" {
  vpc                       = true
  network_interface         = aws_network_interface.win-testsrv-nic.id
  associate_with_private_ip = "10.11.12.20"
  depends_on = [
    aws_internet_gateway.gw
  ]
   
}