terraform {
  source = "git@github.com:marquesmateus93/terraform-vpc.git//modules/vpc//."
}

include {
  path = find_in_parent_folders()
}

dependency "tags" {
  config_path = "../tags"

  mock_outputs = {
    prefix_name = "dummy_name"
    environment = "dummy_environment"
    creator_id  = get_aws_caller_identity_user_id()
  }
}

inputs = {
  prefix_name = dependency.tags.outputs.prefix_name
  tags = {
    environment = dependency.tags.outputs.environment
    creator_id  = dependency.tags.outputs.creator_id
  }
}