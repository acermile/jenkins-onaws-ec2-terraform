provider "aws" {
  region  = var.aws-region
  profile = "csa" //give the profile of your AWS account
  version = ">= 2.28.1"
}
