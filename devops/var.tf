variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" { 
default = "eu-west-1" 
}
 
variable "PATH_TO_PRIVATE_KEY" { default = "mykey" } 
variable "PATH_TO_PUBLIC_KEY" { default = "mykey.pub" } 

variable "azs" {
  type    = list(string)
  default = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}
variable "azs2" {
  type    = list(string)
  default = ["us-west-2a", "us-west-2b", "us-west-2c"]
}