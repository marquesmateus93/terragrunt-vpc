terraform {
  source = "git::git@github.com:Dev-Marques-Ops/terraform-vpc.git"
}

include {
  path = find_in_parent_folders()
}

dependency "tags" {
  config_path = "../tags"

  mock_outputs = {
    commons = {
      account_id  = get_aws_account_id()
      email       = "dummy_user@dummymail.com"
    }

    prefix_name = "Dummy Project"
  }
}

inputs = {
  tags = {
    account_id  = dependency.tags.outputs.commons.account_id
    email       = dependency.tags.outputs.commons.email
  }
  prefix_name = dependency.tags.outputs.prefix_name
}