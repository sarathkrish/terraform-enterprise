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
  source  = "${var.module_source}"
  version = "${var.module_version}"
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  }