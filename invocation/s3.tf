module "s3_bucket" {
  source = "../modules/s3_bucket/v1.0"


  //KMS key
  description             = "KMS key for ssm-resource-sync S3 bucket"
  alias_name              = "kms-key-ssm-resource-sync-${var.region}-${data.aws_caller_identity.current.account_id}"
  deletion_window_in_days = 7
  kms_key_policy_rendered = templatefile("${path.cwd}/policies/s3_kms_key_policy.json", {
    account_id     = data.aws_caller_identity.current.account_id
    bucket_name    = "ssm-resource-sync-${var.region}-${data.aws_caller_identity.current.account_id}"
    s3_kms_key_arn = "" ##TO BE REPLACED WITH KMS KEY ARN AFTER DEPLOYING >>>> data.aws_kms_key.s3_kms_key.arn
    org_id         = data.aws_organizations_organization.current.id
  })

  //S3 bucket
  bucket              = "ssm-resource-sync-${var.region}-${data.aws_caller_identity.current.account_id}"
  force_destroy       = false
  block_public_access = true
  versioning_enabled  = true
  s3_tags             = local.tags



  server_side_encryption_configuration_inputs = [{
    sse_algorithm     = "aws:kms"
    kms_master_key_id = module.s3_bucket.s3_bucket_kms_key
  }]

  versioning_inputs = [
    {
      enabled    = true
      mfa_delete = null
    },
  ]

  logging_inputs = []

  lifecycle_rule_inputs = []
}