variable "region" {
    type = string
    description = "region of vpc"
    default = "ap-south-1"
  
}

variable "vpc-name" {
    type = string
    default = "name of vpc"
  
}

variable "vpc-cidr" {
    type = string
    description = "cidr range of vpc"
}
variable "private-cidrs" {
    type = list(string)

}

variable "public-cidrs" {
    type = list(string)
  
}
variable "ami-id" {
    type = string
    description = "ami id of ubuntu 20.04"
    default = "ami-024c319d5d14b463e"
  
}
variable "web-trigger" {
    type = string
    description = "running number for trigger"
    default = "1.0"
  
}

