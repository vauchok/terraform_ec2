provider "aws" {
    region = "${var.aws_region}"
}

module "jenkins-slave" {
  source = "./module"
}