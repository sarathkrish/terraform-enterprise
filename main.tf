provider "aws" {
  region = "${var.region}"
  version = "~> 2.48"

}

terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "Metsian"


    workspaces {
      name = "ModulesTest"
    }
  }
}

module "app" {

  source  = "app.terraform.io/Metsian/ec2/aws"
  version = "1.0.0"

  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  }