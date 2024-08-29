terraform {
  source = "git@github.com:marquesmateus93/terraform-tags.git//modules/tags//."
}

include {
  path = find_in_parent_folders()
}

locals {
  environment = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  account     = read_terragrunt_config(find_in_parent_folders("account.hcl"))

  env_folder  = local.environment.locals.env_folder
  prefix_name = local.account.locals.prefix_name
}

inputs = {
  prefix_name = local.prefix_name
  environment = local.env_folder
  creator_id  = get_aws_caller_identity_user_id()
}
