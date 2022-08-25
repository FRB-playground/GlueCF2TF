data "aws_caller_identity" "current" {}

data "aws_organizations_organization" "current" {}

#data "aws_kms_key" "s3_kms_key" {
#  key_id = "kms-key-ssm-resource-sync-${var.region}-${data.aws_caller_identity.current.account_id}"
#} ### TO BE UNCOMMENTED AFTER KEY PROVISIONING

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "account_ids" {
  value = data.aws_organizations_organization.current.accounts[*].id
}