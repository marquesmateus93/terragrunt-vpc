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
  prefix_name           = dependency.tags.outputs.prefix_name
  
  vpc_cidr_block        = "10.0.0.0/16"

  public_cidr_block     = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24"
  ]
  
  private_cidr_block    = [
    "10.0.11.0/24",
    "10.0.12.0/24",
    "10.0.13.0/24"
  ]

  resources_cidr_block  = [
    "10.0.21.0/24",
    "10.0.22.0/24",
    "10.0.33.0/24"
  ]

  azs = [
    "us-east-2a",
    "us-east-2b",
    "us-east-2c"
  ]

  tags = {
    environment = dependency.tags.outputs.environment
    creator_id  = dependency.tags.outputs.creator_id
  }
}