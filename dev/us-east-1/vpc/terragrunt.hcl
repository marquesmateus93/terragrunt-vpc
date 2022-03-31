terraform {
  source = "git::git@github.com:Dev-Marques-Ops/terraform-vpc.git//modules/vpc"
}

include {
  path = find_in_parent_folders()
}

dependency "tags" {
  config_path = "../tags"

  mock_outputs_allowed_terraform_commands = ["plan","apply"]
}

inputs = {
  tags = {
    account_id  = dependency.tags.outputs.commons.account_id
    email       = dependency.tags.outputs.commons.email
  }
  prefix_name = dependency.tags.outputs.prefix_name
}