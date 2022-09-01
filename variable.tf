variable "region-name" {
    description = "made region a variable"
    default = "eu-west-2"
    type=string
  }

variable "cidr-for-vpc" {
    description = "the-cidr for-proton-project1-for-vpc"
    default = "10.0.0.0/16"
    type=string
  }

variable "cidr-for-private-subnet-1" {
    description = "private cidr"
    default = "10.0.100.0/24"
    type=string
  }

variable "AZ-1" {
    description = "availability zone"
    default = "eu-west-2a"
    type=string
  }

  variable "cidr-for-private-subnet-2" {
    description = "private cidr"
    default = "10.0.105.0/24"
    type=string
  }

variable "AZ-2" {
    description = "availability zone"
    default = "eu-west-2b"
    type=string
  }

variable "cidr-for-public-subnet-1" {
    description = "public cidr"
    default = "10.0.110.0/24"
    type=string
  }

variable "AZ-3" {
    description = "availability zone"
    default = "eu-west-2c"
    type=string
  }

variable "cidr-for-public-subnet-2" {
    description = "public cidr"
    default = "10.0.115.0/24"
    type=string
  }

variable "AZ-4" {
    description = "availability zone"
    default = "eu-west-2a"
    type=string
  }


variable "internet-gateway-association" {
    description = "association of internet gateway with route"
    default = "0.0.0.0/0"
    type=string
  }
