terraform {
  source = "git::git@github.com:Dev-Marques-Ops/terraform-tags.git//modules/tags"
}

include {
  path = find_in_parent_folders()
}


inputs = {
  commons = {
    account_id = get_aws_account_id()
    email      = "mateusmarques1993@gmail.com"
  }
  Branch      = "TestePR"
  prefix_name = "Dev-Marques-Ops"
}
