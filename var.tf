variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" { 
default = "eu-central-1" 
}
 
variable "PATH_TO_PRIVATE_KEY" { default = "mykey" } 
variable "PATH_TO_PUBLIC_KEY" { default = "mykey.pub" } 
variable "INSTANCE_USERNAME" { default = "admin" } 
variable "INSTANCE_PASSWORD" { }

variable "azs" {
  type    = list(string)
  default = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
}
