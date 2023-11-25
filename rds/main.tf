# Pulls information from aanother workspace 
data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "Sadykov123"
    workspaces = {
      name = "vpc"
    }
  }
}


# Creates subnet group with private subnets
resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [
    data.terraform_remote_state.vpc.outputs.private_subnets
  ]
}